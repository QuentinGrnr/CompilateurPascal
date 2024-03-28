//  A compiler from a very simple Pascal-like structured language LL(k)
//  to 64-bit 80x86 Assembly langage
//  Copyright (C) 2019 Pierre Jourlin
//  Copyright (C) 2024 Quentin Garnier
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Build with "make compilateur"


#include <string>
#include <iostream>
#include <cstdlib>

using namespace std;

char current, lookedAhead;                // Current char    
int NLookedAhead=0;

void ReadChar(void){
    if(NLookedAhead>0){
        current=lookedAhead;    // Char has already been read
        NLookedAhead--;
    }
    else
        // Read character and skip spaces until 
        // non space character is read
        while(cin.get(current) && (current==' '||current=='\t'||current=='\n'));
}

void LookAhead(void){
    while(cin.get(lookedAhead) && (lookedAhead==' '||lookedAhead=='\t'||lookedAhead=='\n'));
    NLookedAhead++;
}

void Error(string s){
	cerr<< s << endl;
	exit(-1);
}

// ArithmeticExpression := Term {AdditiveOperator Term}
// Term := Digit | "(" ArithmeticExpression ")"
// AdditiveOperator := "+" | "-"
// Digit := "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"

	
void AdditiveOperator(void){
	if(current=='+'||current=='-')
		ReadChar();
	else
		Error("Opérateur additif attendu");	   // Additive operator expected
}
		
void Digit(void){
	if((current<'0')||(current>'9'))
		Error("Chiffre attendu");		   // Digit expected
	else{
		cout << "\tpush $"<<current<<endl;
		ReadChar();
	}
}

void ArithmeticExpression(void);			// Called by Term() and calls Term()

void Term(void){
	if(current=='('){
		ReadChar();
		ArithmeticExpression();
		if(current!=')')
			Error("')' était attendu");		// ")" expected
		else
			ReadChar();
	}
	else 
		if (current>='0' && current <='9')
			Digit();
	     	else
			Error("'(' ou chiffre attendu");
}

void ArithmeticExpression(void){
	char adop;
	Term();
	while(current=='+'||current=='-'){
		adop=current;		// Save operator in local variable
		AdditiveOperator();
		Term();
		cout << "\tpop %rbx"<<endl;	// get first operand
		cout << "\tpop %rax"<<endl;	// get second operand
		if(adop=='+')
			cout << "\taddq	%rbx, %rax"<<endl;	// add both operands
		else
			cout << "\tsubq	%rbx, %rax"<<endl;	// substract both operands
		cout << "\tpush %rax"<<endl;			// store result
	}

}

char OpRel(){
	char oprel = current;
	if(current!='<' && current!='>' && current!='=')
		Error("Opérateur relationnel attendu");
	else {
		ReadChar();
		return oprel;
	}
}



// exp := ArithmeticExpression(operateurRelationel ExpArithmetique)
void Expression() {
    string oprel = "";
    ArithmeticExpression();
    
    if (current == '<' || current == '>' || current == '=' ) {
        oprel += OpRel();
        LookAhead();
        if (current == '<' || current == '>' || current == '=' ) {
            oprel += OpRel();
        }
        ArithmeticExpression();
    }
    
    cout << "\tpop %rbx" << endl;
    cout << "\tpop %rax" << endl;
    cout << "\tcmp %rbx, %rax" << endl; 

    if (oprel.length() == 1) {
        if (oprel == "<") {
            cout << "\tjb Vrai" << endl;
        } else if (oprel == ">") {
            cout << "\tja Vrai" << endl;
        } else {
            Error("Opérateur relationnel non géré");
        }
    } else if (oprel.length() == 2) {
        if (oprel == "<=") {
            cout << "\tjbe Vrai" << endl;
        } else if (oprel == ">=") {
            cout << "\tjae Vrai" << endl;
        } else if (oprel == "<>") {
            cout << "\tjne Vrai" << endl;
        } else if (oprel == "==") {
            cout << "\tje Vrai" << endl;
        } else {
            Error("Opérateur relationnel non géré");
        }
    } else {
        Error("Opérateur relationnel attendu");
    }
		cout << "\tFaux : push $0" << endl;
        cout << "\tjmp FinExp" << endl;
        cout << "\tVrai : push $1" << endl;
        cout << "\tFinExp :" << endl;
}

int main(void){	// First version : Source code on standard input and assembly code on standard output
	// Header for gcc assembler / linker
	cout << "\t\t\t#This code was produced by the CERI Compiler"<<endl;
	cout << "\t.text\t\t# The following lines contain the program"<<endl;
	cout << "\t.globl main\t# The main function must be visible from outside"<<endl;
	cout << "main:\t\t\t# The main function body :"<<endl;
	cout << "\tmovq %rsp, %rbp\t# Save the position of the stack's top"<<endl;

	// Let's proceed to the analysis and code production
	ReadChar();
	Expression();
	ReadChar();
	// Trailer for the gcc assembler / linker
	cout << "\tmovq %rbp, %rsp\t\t# Restore the position of the stack's top"<<endl;
	cout << "\tret\t\t\t# Return from main function"<<endl;
	if(cin.get(current)){
		cerr <<"Caractères en trop à la fin du programme : ["<<current<<"]";
		Error("."); // unexpected characters at the end of program
	}

}
		
			





