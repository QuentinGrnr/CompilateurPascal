//  A compiler from a very simple Pascal-like structured language LL(k)
//  to 64-bit 80x86 Assembly langage
//  Copyright (C) 2019 Pierre Jourlin
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
#include <set>
#include <map>
#include <FlexLexer.h>
#include "tokeniser.h"
#include <cstring>

using namespace std;

enum KEYWORDS {IF, THEN, ELSE, WHILE, FOR, DO, TO, BEGIN, END, VAR, DISPLAY};
enum OPREL {EQU, DIFF, INF, SUP, INFE, SUPE, WTFR};
enum OPADD {ADD, SUB, OR, WTFA};
enum OPMUL {MUL, DIV, MOD, AND ,WTFM};
enum TYPES {INTEGER, BOOLEAN};

TOKEN current;				// Current token

FlexLexer* lexer = new yyFlexLexer; // This is the flex tokeniser
// tokens can be read using lexer->yylex()
// lexer->yylex() returns the type of the lexicon entry (see enum TOKEN in tokeniser.h)
// and lexer->YYText() returns the lexicon entry as a string

map<string, enum TYPES> DeclaredVariables;	// Set of declared variables and their types	
unsigned long TagNumber=0;

bool IsDeclared(const char *id){
	return DeclaredVariables.find(id)!=DeclaredVariables.end();
}


void Error(string s){
	cerr << "Ligne n°"<<lexer->lineno()<<", lu : '"<<lexer->YYText()<<"'("<<current<<"), mais "; // lineno() retourne le numéro de la ligne actuelle
	cerr<< s << endl;
	exit(-1);
}

// Program := [DeclarationPart] StatementPart
// DeclarationPart := "[" Letter {"," Letter} "]"
// VarDeclarationPart := "VAR" VarDeclaration {";" VarDeclaration} "."
// VarDeclaration := Ident {"," Ident} ":" Type
// StatementPart := Statement {";" Statement} "."
// Statement := AssignementStatement | IfStatement | WhileStatement | ForStatement | BlockStatement

// AssignementStatement := Letter "=" Expression
// IfStatement := "IF" Expression "THEN" Statement [ "ELSE" Statement ]
// WhileStatement := "WHILE" Expression "DO" Statement
// ForStatement := "FOR" AssignementStatement "To" Expression "DO" Statement
// BlockStatement := "BEGIN" Statement { ";" Statement } "END"


// Expression := SimpleExpression [RelationalOperator SimpleExpression]
// SimpleExpression := Term {AdditiveOperator Term}
// Term := Factor {MultiplicativeOperator Factor}
// Factor := Number | Letter | "(" Expression ")"| "!" Factor
// Number := Digit{Digit}

// AdditiveOperator := "+" | "-" | "||"
// MultiplicativeOperator := "*" | "/" | "%" | "&&"
// RelationalOperator := "==" | "!=" | "<" | ">" | "<=" | ">="  
// Digit := "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
// Letter := "a"|...|"z"

enum TYPES Expression(void);
void Statement(void);
void StatementPart(void);
		
TYPES Identifier(void){
	enum TYPES type;
	if(!IsDeclared(lexer->YYText())){
		cerr << "Erreur : Variable '"<<lexer->YYText()<<"' non déclarée"<<endl;
		exit(-1);
	}
	type=DeclaredVariables[lexer->YYText()];
	cout << "\tpush "<<lexer->YYText()<<endl;
	current=(TOKEN) lexer->yylex();
	return type;
}

TYPES Number(void){
	enum TYPES type;
	if (current!=NUMBER)
		Error("Chiffre attendu");
	cout <<"\tpush $"<<atoi(lexer->YYText())<<endl; // YYText =/ readchar car on accede a la valeur du token sans avancer le curseur
	current=(TOKEN) lexer->yylex(); // YYlex envoie le type du token actuel et avance le curseur
	return INTEGER;
}

TYPES Factor(void){
	enum TYPES type;
	if(current==RPARENT){
		current=(TOKEN) lexer->yylex();
		type = Expression();
		if(current!=LPARENT)
			Error("')' était attendu");		// ")" expected
		else
			current=(TOKEN) lexer->yylex();
	} else {
		if (current==NUMBER){
			type = Number();
		}else{
			if(current==ID)
				type = Identifier();
			else
				Error("'(', chiffre ou lettre attendue");
		}
	}
	return type;
}


// MultiplicativeOperator := "*" | "/" | "%" | "&&"
OPMUL MultiplicativeOperator(void){
	OPMUL opmul;
	if(strcmp(lexer->YYText(),"*")==0)
		opmul=MUL;
	else if(strcmp(lexer->YYText(),"/")==0)
		opmul=DIV;
	else if(strcmp(lexer->YYText(),"%")==0)
		opmul=MOD;
	else if(strcmp(lexer->YYText(),"&&")==0)
		opmul=AND;
	else opmul=WTFM;
	current=(TOKEN) lexer->yylex();
	return opmul;
}

// Term := Factor {MultiplicativeOperator Factor}
TYPES Term(void){
	TYPES typeA, typeB;
	OPMUL mulop;
	typeA = Factor();
	while(current==MULOP){
		mulop=MultiplicativeOperator();		// Save operator in local variable
		typeB = Factor();
		if (typeA!=INTEGER || typeB!=INTEGER)
			Error("meme type attendu"); // same type expected
		cout << "\tpop %rbx"<<endl;	// get first operand
		cout << "\tpop %rax"<<endl;	// get second operand
		switch(mulop){
			case AND:
				if (typeA!=INTEGER)
					Error("Booléens attendus"); // same type expected
				cout << "\tmulq	%rbx"<<endl;	// a * b -> %rdx:%rax
				cout << "\tpush %rax\t# AND"<<endl;	// store result
				break;
			case MUL:
				if (typeA!=INTEGER)
					Error("Entiers attendus"); // same type expected
				cout << "\tmulq	%rbx"<<endl;	// a * b -> %rdx:%rax
				cout << "\tpush %rax\t# MUL"<<endl;	// store result
				break;
			case DIV:
				if (typeA!=INTEGER)
					Error("Entiers attendus"); // same type expected
				cout << "\tmovq $0, %rdx"<<endl; 	// Higher part of numerator  
				cout << "\tdiv %rbx"<<endl;			// quotient goes to %rax
				cout << "\tpush %rax\t# DIV"<<endl;		// store result
				break;
			case MOD:
				if (typeA!=INTEGER)
					Error("Entiers attendus"); // same type expected
				cout << "\tmovq $0, %rdx"<<endl; 	// Higher part of numerator  
				cout << "\tdiv %rbx"<<endl;			// remainder goes to %rdx
				cout << "\tpush %rdx\t# MOD"<<endl;		// store result
				break;
			default:
				Error("opérateur multiplicatif attendu");
		}
	}
	return typeA;
}

// AdditiveOperator := "+" | "-" | "||"
OPADD AdditiveOperator(void){
	OPADD opadd;
	if(strcmp(lexer->YYText(),"+")==0)
		opadd=ADD;
	else if(strcmp(lexer->YYText(),"-")==0)
		opadd=SUB;
	else if(strcmp(lexer->YYText(),"||")==0)
		opadd=OR;
	else opadd=WTFA;
	current=(TOKEN) lexer->yylex();
	return opadd;
}

// SimpleExpression := Term {AdditiveOperator Term}
TYPES SimpleExpression(void){
	enum TYPES typeA, typeB;
	OPADD adop;
	typeA = Term();
	while(current==ADDOP){
		adop=AdditiveOperator();		// Save operator in local variable
		typeB = Term();
		if (typeA!=typeB)
			Error("Memes types attendus"); // same type expected
		cout << "\tpop %rbx"<<endl;	// get first operand
		cout << "\tpop %rax"<<endl;	// get second operand
		switch(adop){
			case OR:
				if (typeA!=BOOLEAN)
					Error("Booléens attendus"); // same type expected
				cout << "\taddq	%rbx, %rax\t# OR"<<endl;// operand1 OR operand2
				break;			
			case ADD:
				if (typeA!=INTEGER)
					Error("Entiers attendus"); // same type expected
				cout << "\taddq	%rbx, %rax\t# ADD"<<endl;	// add both operands
				break;			
			case SUB:
				if (typeA!=INTEGER)
					Error("Entiers attendus"); // same type expected	
				cout << "\tsubq	%rbx, %rax\t# SUB"<<endl;	// substract both operands
				break;
			default:
				Error("opérateur additif inconnu");
		}
		cout << "\tpush %rax"<<endl;			// store result
	}
	return typeA;
}

TYPES Type(void){
	if (current!=KEYWORD)
		Error("Type attendu");
	if(strcmp(lexer->YYText(),"INTEGER")==0){
		current=(TOKEN) lexer->yylex();
		return INTEGER;
	}
	else if(strcmp(lexer->YYText(),"BOOLEAN")==0) {
		current=(TOKEN) lexer->yylex();
		return BOOLEAN;
	} else
		Error("Type attendu");
	return INTEGER; // to avoid a warning, this line is never reached
}

// VarDeclaration := Ident {"," Ident} ":" Type
void VarDeclaration(void){
	set <string> idents;
	enum TYPES type;
	if(current!=ID)
		Error("Identificateur attendu");
	idents.insert(lexer->YYText()); // insert the first identifier
	current=(TOKEN) lexer->yylex();
	while(current==COMMA){
		current=(TOKEN) lexer->yylex();
		if(current!=ID)
			Error("Identificateur attendu");
		if(idents.find(lexer->YYText())!=idents.end()) // if the identifier is already declared
			Error("Identificateur déjà déclaré");
		idents.insert(lexer->YYText());
		current=(TOKEN) lexer->yylex();
	}
	if (current!=COLON)
		Error("caractère ':' attendu");
	current=(TOKEN) lexer->yylex();
	type=Type();
	for(set<string>::iterator it=idents.begin(); it!=idents.end(); it++){
		if(DeclaredVariables.find(*it)!=DeclaredVariables.end())
			Error("Identificateur déjà déclaré");
		DeclaredVariables[*it]=type;
		cout << *it << ":\t.quad 0"<<endl;
	}
}

// VarDeclarationPart := "VAR" VarDeclaration {";" VarDeclaration} "."
void VarDeclarationPart(void) {
	current=(TOKEN) lexer->yylex(); // skip the "VAR" keyword
	VarDeclaration();
	while(current==SEMICOLON){
		current=(TOKEN) lexer->yylex();
		VarDeclaration();
	}
	if (current!=DOT)
		Error("caractère '.' attendu");
	current=(TOKEN) lexer->yylex();
}


// RelationalOperator := "==" | "!=" | "<" | ">" | "<=" | ">="  
OPREL RelationalOperator(void){
	OPREL oprel;
	if(strcmp(lexer->YYText(),"==")==0) // strcmp renvoie 0 si les deux chaines sont égales et un nombre positif ou négatif si elles sont différentes
		oprel=EQU;
	else if(strcmp(lexer->YYText(),"!=")==0)
		oprel=DIFF;
	else if(strcmp(lexer->YYText(),"<")==0)
		oprel=INF;
	else if(strcmp(lexer->YYText(),">")==0)
		oprel=SUP;
	else if(strcmp(lexer->YYText(),"<=")==0)
		oprel=INFE;
	else if(strcmp(lexer->YYText(),">=")==0)
		oprel=SUPE;
	else oprel=WTFR;
	current=(TOKEN) lexer->yylex();
	return oprel;
}

// Expression := SimpleExpression [RelationalOperator SimpleExpression]
TYPES Expression(void){
	enum TYPES typeA, typeB;
	OPREL oprel;
	typeA = SimpleExpression();
	if(current==RELOP){
		oprel=RelationalOperator();
		typeB = SimpleExpression();
		if (typeA!=typeB)
			Error("Memes types attendus"); // same type expected
		cout << "\tpop %rax"<<endl;
		cout << "\tpop %rbx"<<endl;
		cout << "\tcmpq %rax, %rbx"<<endl;
		switch(oprel){
			case EQU:
				cout << "\tje Vrai"<<++TagNumber<<"\t# If equal"<<endl;
				break;
			case DIFF:
				cout << "\tjne Vrai"<<++TagNumber<<"\t# If different"<<endl;
				break;
			case SUPE:
				cout << "\tjae Vrai"<<++TagNumber<<"\t# If above or equal"<<endl;
				break;
			case INFE:
				cout << "\tjbe Vrai"<<++TagNumber<<"\t# If below or equal"<<endl;
				break;
			case INF:
				cout << "\tjb Vrai"<<++TagNumber<<"\t# If below"<<endl;
				break;
			case SUP:
				cout << "\tja Vrai"<<++TagNumber<<"\t# If above"<<endl;
				break;
			default:
				Error("Opérateur de comparaison inconnu");
		}
		cout << "\tpush $0\t\t# False"<<endl;
		cout << "\tjmp Suite"<<TagNumber<<endl;
		cout << "Vrai"<<TagNumber<<":\tpush $0xFFFFFFFFFFFFFFFF\t\t# True"<<endl;	
		cout << "Suite"<<TagNumber<<":"<<endl;
		return BOOLEAN;
	}
	return typeA;
}

KEYWORDS GetKeyword(void){
	KEYWORDS kw;
	if(strcmp(lexer->YYText(),"IF")==0)
		kw=IF;
	else if(strcmp(lexer->YYText(),"THEN")==0)
		kw=THEN;
	else if(strcmp(lexer->YYText(),"ELSE")==0)
		kw=ELSE;
	else if(strcmp(lexer->YYText(),"WHILE")==0)
		kw=WHILE;
	else if(strcmp(lexer->YYText(),"FOR")==0)
		kw=FOR;
	else if(strcmp(lexer->YYText(),"DO")==0)
		kw=DO;
	else if(strcmp(lexer->YYText(),"TO")==0)
		kw=TO;
	else if(strcmp(lexer->YYText(),"BEGIN")==0)
		kw=BEGIN;
	else if(strcmp(lexer->YYText(),"END")==0)
		kw=END;
	else  if (strcmp(lexer->YYText(),"VAR")==0)
		kw=VAR;
	else if (strcmp(lexer->YYText(),"DISPLAY")==0)
		kw=DISPLAY;
	else 
		kw=IF;
	return kw;
}

// AssignementStatement := Identifier ":=" Expression
string AssignementStatement(void){
	string variable;
	if(current!=ID)
		Error("Identificateur attendu");
	if(!IsDeclared(lexer->YYText())){
		cerr << "Erreur : Variable '"<<lexer->YYText()<<"' non déclarée"<<endl;
		exit(-1);
	}
	variable=lexer->YYText();
	current=(TOKEN) lexer->yylex();
	if(current!=ASSIGN)
		Error("caractères ':=' attendus");
	current=(TOKEN) lexer->yylex();
	Expression();
	cout << "\tpop "<<variable<<endl;
	return variable;
}

// DisplayStatement := "DISPLAY" Expression
void DisplayStatement(void){
	enum TYPES type;
	unsigned long long TagNumber1=++TagNumber;
	current=(TOKEN) lexer->yylex();
	type = Expression();
	cout << ".cfi_startproc"<<endl;
	cout << "\tendbr64"<<endl;
	if (type == INTEGER){
		cout << "\tpop %rdx    \t# The value to be displayed"<<endl;
		cout << "\tmovq $FormatString1, %rsi   \t# \"%llu\\n\""<<endl;
	} else if (type == BOOLEAN){
		cout << "\tpop %rdx    \t# The value to be displayed"<<endl;
		cout << "\tmovq $TrueString, %rsi   \t # \"TRUE\n\""<<endl;
		cout << "\tcmpq $0, %rdx"<<endl;
		cout << "\tje FALSE"<<TagNumber1<<endl;
		cout << "\tmovq $FalseString, %rsi    \t# \"FALSE\n\""<<endl;
		cout << "FALSE"<<TagNumber1<<":"<<endl;
	} else {
		Error("Entier ou booléen attendu");
	}
	cout << "\tmovq $0, %rax    \t# No floating point arguments"<<endl;
	cout << "\tmovq $0, %rdi    \t# No floating point arguments"<<endl;
	cout << "\tcall printf   \t # Display the value"<<endl;
	cout << ".cfi_endproc"<<endl;
}

// IfStatement := "IF" Expression "THEN" Statement [ "ELSE" Statement ]
void IfStatement(void){
	unsigned long TagNumber1 = ++TagNumber;
	
	if(current!=KEYWORD && GetKeyword()!=IF)
		Error("Mot clé 'IF' attendu");
	current=(TOKEN) lexer->yylex();
	Expression();
	cout << "\tpop %rax"<<endl;
	cout << "\tcmpq $0, %rax"<<endl; // compare with 0 to know if the expression is false
	cout << "\tje ELSE"<<TagNumber1<<endl; // if false, jump to the else statement
	if(current!=KEYWORD && GetKeyword()!=THEN)
		Error("Mot clé 'THEN' attendu");
	current=(TOKEN) lexer->yylex();
	Statement();
	cout << "\tjmp FINIF"<<TagNumber1<<endl;
	cout << "ELSE"<<TagNumber1<<":"<<endl;
	if(current!=KEYWORD && GetKeyword()!=ELSE)
		Error("Mot clé 'ELSE' attendu");
	current=(TOKEN) lexer->yylex();
	Statement();
	cout << "FINIF"<<TagNumber1<<":"<<endl;
}

// WhileStatement := "WHILE" Expression "DO" Statement
void WhileStatement(void){
	unsigned long TagNumber1=++TagNumber;
	if(current!=KEYWORD && GetKeyword()!=WHILE)
		Error("Mot clé 'WHILE' attendu");
	current=(TOKEN) lexer->yylex();
	cout << "TESTWHILE"<<TagNumber1<<":"<<endl;
	Expression();
	cout << "\tpop %rax"<<endl;
	cout << "\tcmpq $0, %rax"<<endl; // compare with 0 to know if the expression is false
	cout << "\tje FINWHILE"<<TagNumber1<<endl; // if false, jump to the end of the while statement
	if(current!=KEYWORD && GetKeyword()!=DO)
		Error("Mot clé 'DO' attendu");
	current=(TOKEN) lexer->yylex();
	Statement();
	cout << "\tjmp TESTWHILE"<<TagNumber1<<endl;
	cout << "FINWHILE"<<TagNumber1<<":"<<endl;
}

// FORStatement := "FOR" AssignementStatement "TO" Expression "DO" Statement
void ForStatement(void){
	string varboucle;
	unsigned int TagNumber1=++TagNumber;
	if(current!=KEYWORD && GetKeyword()!=FOR)
		Error("Mot clé 'FOR' attendu");
	current=(TOKEN) lexer->yylex();
	varboucle=AssignementStatement();
	if(current!=KEYWORD && GetKeyword()!=TO)
		Error("Mot clé 'TO' attendu");
	current=(TOKEN) lexer->yylex();
	cout << "TESTFOR"<<TagNumber1<<":"<<endl;
	Expression();
	cout << "\tpop %rax"<<endl;
	cout << "\tcmpq "<<varboucle<<", %rax"<<endl;
	cout << "\tjb FINFOR"<<TagNumber1<<endl;
	if(current!=KEYWORD && GetKeyword()!=DO)
		Error("Mot clé 'DO' attendu");
	current=(TOKEN) lexer->yylex();
	Statement();
	cout << "\tincq "<<varboucle<<endl;
	cout << "\tjmp TESTFOR"<<TagNumber1<<endl;
	cout << "FINFOR"<<TagNumber1<<":"<<endl;
}

// BlockStatement := "BEGIN" Statement { ";" Statement } "END"
void BlockStatement(void){
	if(current!=KEYWORD && GetKeyword()!=BEGIN)
		Error("Mot clé 'BEGIN' attendu");
	current=(TOKEN) lexer->yylex();
	Statement();
	while(current==SEMICOLON){
		current=(TOKEN) lexer->yylex();
		Statement();
	}
	if(current!=KEYWORD && GetKeyword()!=END)
		Error("Mot clé 'END' attendu");
	current=(TOKEN) lexer->yylex();
}


// Statement := AssignementStatement | IfStatement | WhileStatement | ForStatement | BlockStatement
void Statement(void){
	switch(current){
		case ID:
			AssignementStatement();
			break;
		case KEYWORD:
			switch(GetKeyword()){
				case IF:
					IfStatement();
					break;
				case WHILE:
					WhileStatement();
					break;
				case FOR:
					ForStatement();
					break;
				case BEGIN:
					BlockStatement();
					break;
				case DISPLAY:
					DisplayStatement();
					break;
				default:
					Error("Instruction non reconnue");
			}
			break;
		default:
			Error("Instruction non reconnue");
	}
}

// StatementPart := Statement {";" Statement} "."
void StatementPart(void){
	cout << "\t.text\t\t# The following lines contain the program"<<endl;
	cout << "\t.globl main\t# The main function must be visible from outside"<<endl;
	cout << "main:\t\t\t# The main function body :"<<endl;
	cout << "\tmovq %rsp, %rbp\t# Save the position of the stack's top"<<endl;
	Statement();
	while(current==SEMICOLON){
		current=(TOKEN) lexer->yylex();
		Statement();
	}
	if(current!=DOT)
		Error("caractère '.' attendu");
	current=(TOKEN) lexer->yylex();
}

// Program := [VarDeclarationPart] StatementPart
void Program(void){
	if(current==KEYWORD && GetKeyword()==VAR)
		VarDeclarationPart();
	StatementPart();
}

int main(void){	// First version : Source code on standard input and assembly code on standard output
	// Header for gcc assembler / linker
	cout << "\t\t\t# This code was produced by the CERI Compiler"<<endl;
	cout << ".data"<<endl;
	cout << "FormatString1:\t.string \"%llu\\n\"\t# used by printf to display 64-bit unsigned integers"<<endl; 
	cout << "TrueString:\t.string \"TRUE\\n\"\t# used by printf to display the boolean value TRUE"<<endl; 
	cout << "FalseString:\t.string \"FALSE\\n\"\t# used by printf to display the boolean value FALSE"<<endl; 
	// Let's proceed to the analysis and code production
	current=(TOKEN) lexer->yylex();
	Program();
	// Trailer for the gcc assembler / linker
	cout << "\tmovq %rbp, %rsp\t\t# Restore the position of the stack's top"<<endl;
	cout << "\tret\t\t\t# Return from main function"<<endl;
	if(current!=FEOF){
		cerr <<"Caractères en trop à la fin du programme : ["<<current<<"]";
		Error("."); // unexpected characters at the end of program
	}

}
		
			





