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
#include <string>

using namespace std;

enum KEYWORDS {IF, THEN, ELSE, WHILE, FOR, DO, TO, BEGIN, END, VAR, DISPLAY, DOWNTO,TRUE, FALSE, NONE, CASE, OF, DEFAULT};
enum OPREL {EQU, DIFF, INF, SUP, INFE, SUPE, WTFR};
enum OPADD {ADD, SUB, OR, WTFA};
enum OPMUL {MUL, DIV, MOD, AND ,WTFM};
enum TYPES {INTEGER, BOOLEAN, DOUBLE, CHAR};

TOKEN current;				// Current token

FlexLexer* lexer = new yyFlexLexer; // This is the flex tokeniser
// tokens can be read using lexer->yylex()
// lexer->yylex() returns the type of the lexicon entry (see enum TOKEN in tkeniser.h)
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
// Statement := AssignementStatement | IfStatement | WhileStatement | ForStatement | BlockStatement | DisplayStatement

// AssignementStatement := Letter "=" Expression
// IfStatement := "IF" Expression "THEN" Statement [ "ELSE" Statement ]
// WhileStatement := "WHILE" Expression "DO" Statement
// ForStatement := "FOR" AssignementStatement "To" Expression "DO" Statement
// BlockStatement := "BEGIN" Statement { ";" Statement } "END"
// CaseStatement ::= "CASE" Expression "OF" CaseListElement {; CaseListElement } "END"
// CaseListElement ::= CaseLabelList ":" Statement | Empty
// CaseLabelList ::= Factor {, Factor }
// Empty::=

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
KEYWORDS getKeyword(void);
		
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
	double floatNumber;
	unsigned int *p;
	string nbr = lexer->YYText();
	if (current!=NUMBER)
		Error("Chiffre attendu");
	if (nbr.find(".") != string::npos){
		floatNumber = atof(lexer->YYText());
		p = (unsigned int *) &floatNumber; 
		cout << "\tsubq $8, %rsp \t # allocate 8 bytes on stack's top"<<endl;
		cout << "\tmovl $"<<*p<<", (%rsp) \t# Conversion of "<<floatNumber<<" (32 bit high part)"<<endl;
		cout << "\tmovl $"<<*(p+1)<<", 4(%rsp) \t# Conversion of "<<floatNumber<<" (32 bit low part)"<<endl;
		current=(TOKEN) lexer->yylex();
		return DOUBLE;
	} else {
		cout <<"\tpush $"<<atoi(lexer->YYText())<<endl; // YYText =/ readCHAR car on accede a la valeur du token sans avancer le curseur
		current=(TOKEN) lexer->yylex(); // YYlex envoie le type du token actuel et avance le curseur
		return INTEGER;
	}
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
	} else if (current==NUMBER){
		type = Number();
	} else if(current==ID) {
		type = Identifier();
	} else if (current==CHARCONST){
		cout << "\tpush $"<<lexer->YYText()<<endl;
		current=(TOKEN) lexer->yylex();
		type = CHAR;
	} else if (getKeyword()==TRUE){ // a modif 
		cout << "\tpush $0xFFFFFFFFFFFFFFFF"<<endl;
		current=(TOKEN) lexer->yylex();
		type = BOOLEAN;
	}else if (getKeyword()==FALSE){
		cout << "\tpush $0"<<endl;
		current=(TOKEN) lexer->yylex();
		type = BOOLEAN;
	} else if (current==NOT){
		current=(TOKEN) lexer->yylex();
		type = Factor();
		if (type!=BOOLEAN)
			Error("Booléen attendu");
		cout << "\tpop %rax"<<endl;
		cout << "\txorq $0xFFFFFFFFFFFFFFFF, %rax"<<endl;
		cout << "\tpush %rax"<<endl;
	} else
		Error("'(', chiffre ou lettre attendue");
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
		mulop=MultiplicativeOperator();
		typeB = Factor();
		if (typeA!=typeB && !((typeA==DOUBLE && typeB==INTEGER) || (typeA==INTEGER && typeB==DOUBLE)))
			Error("Memes types attendus");
		if (typeA==DOUBLE) {
			if (typeB==INTEGER) {
				cout << "\tfildl (%rsp)\t" << endl; 
			} else { // DOUBLE
				cout<<"\tfldl	(%rsp)\t"<<endl;
			}
			cout<<"\tfldl	8(%rsp)"<<endl;
		} else if (typeA==INTEGER || typeA==BOOLEAN) {
			if (typeB==DOUBLE) {
				cout << "\tfldl (%rsp)\t" << endl;
				cout << "\tfildl 8(%rsp)\t" << endl; 
			} else {
				cout << "\tpop %rbx"<<endl;
				cout << "\tpop %rax"<<endl;
			}
		}
		switch(mulop){
			case AND:
				if (typeA!=BOOLEAN)
					Error("Booléens attendus"); // same type expected
				cout << "\tandq	%rbx, %rax\t# AND"<<endl;	// operand1 AND operand2
				cout << "\tpush %rax"<<endl;			// store result
				break;
			case MUL:
				if (typeA == DOUBLE && typeB == INTEGER) {
					cout << "\tfmulp	%st(0),%st(1)\t# %st(0) <- op1 * op2 ; %st(1)=null"<<endl;
					cout << "\tfstpl 8(%rsp)"<<endl; 
					cout << "\taddq $8, %rsp"<<endl;
				} else if (typeA == INTEGER && typeB == DOUBLE) {
					cout << "\tfmulp	%st(0),%st(1)\t# %st(0) <- op1 * op2 ; %st(1)=null"<<endl;
					cout << "\tfstpl 8(%rsp)"<<endl; 
					cout << "\taddq $8, %rsp"<<endl;
				} else if (typeA==INTEGER) {
				cout << "\tmulq	%rbx"<<endl;	// a * b -> %rdx:%rax
				cout << "\tpush %rax\t# MUL"<<endl;	// store result
				} else if (typeA == DOUBLE) {
					cout<<"\tfmulp	%st(0),%st(1)\t# %st(0) <- op1 * op2 ; %st(1)=null"<<endl;
					cout<<"\tfstpl 8(%rsp)"<<endl; 
					cout<<"\taddq $8, %rsp"<<endl;
				} else {
					Error("Entiers ou flottant attendus pour la multiplication"); 
				}
				break;
			case DIV:
				if (typeA == DOUBLE && typeB == INTEGER) {
					cout << "\tfdivp	%st(0),%st(1)"<<endl;
					cout << "\tfstpl 8(%rsp)"<<endl; 
					cout << "\taddq $8, %rsp"<<endl;
				} else if (typeA == INTEGER && typeB == DOUBLE) {
					cout << "\tfdivp	%st(0),%st(1)"<<endl;
					cout << "\tfstpl 8(%rsp)"<<endl; 
					cout << "\taddq $8, %rsp"<<endl;
				} else if (typeA==INTEGER) {
					cout << "\tmovq $0, %rdx"<<endl; 
					cout << "\tdiv %rbx"<<endl;
					cout << "\tpush %rax\t# DIV"<<endl;	
				} else if (typeA == DOUBLE) {
					cout<<"\tfdivp	%st(0),%st(1)"<<endl;
					cout<<"\tfstpl 8(%rsp)"<<endl; 
					cout<<"\taddq $8, %rsp"<<endl;
				} else {
					Error("Entiers ou flottant attendus pour la division");
				}
				break;
			case MOD:
				if (typeA==INTEGER) {
					cout << "\tmovq $0, %rdx"<<endl; 	// Higher part of numerator  
					cout << "\tdiv %rbx"<<endl;			// remainder goes to %rdx
					cout << "\tpush %rdx\t# MOD"<<endl;		// store result
				} else {
					Error("Entiers attendus pour le modulo");
				}
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

// Expression:= Term {AdditiveOperator Term}
TYPES SimpleExpression(void){
	enum TYPES typeA, typeB;
	OPADD adop;
	typeA = Term();
	while(current==ADDOP){
		adop=AdditiveOperator();
		typeB = Term();
		if (typeA!=typeB && !((typeA==DOUBLE && typeB==INTEGER) || (typeA==INTEGER && typeB==DOUBLE)))
			Error("assignation de meme type ou double et entier attendu");
		if (typeA!=INTEGER && typeA!=BOOLEAN && typeA!=DOUBLE)
			Error("Entier, booléen ou double attendu"); 
		// chargement des valeurs dans les registres celons les types
		if (typeA==DOUBLE) {
			if (typeB==INTEGER) {
				cout << "\tfildl (%rsp)\t" << endl; 
			} else { // DOUBLE
				cout<<"\tfldl	(%rsp)\t"<<endl;
			}
			cout<<"\tfldl	8(%rsp)"<<endl;
		} else if (typeA==INTEGER || typeA==BOOLEAN) { // BOOLEAN et DOUBLE impossible car déjà traité
			if (typeB==DOUBLE) {
				cout << "\tfldl (%rsp)\t" << endl;
				cout << "\tfildl 8(%rsp)\t" << endl; 
			} else {
				cout << "\tpopq %rbx"<<endl;
				cout << "\tpopq %rax"<<endl;
			}
		} else {
			Error("Entier, booléen ou double attendu");
		}
		switch(adop){
			case OR:
				if (typeA!=BOOLEAN)
					Error("Booléens attendus");
					cout << "\taddq	%rbx, %rax\t# OR"<<endl;
					cout << "\tpush %rax"<<endl;		
				break;			
			case ADD:
				if (typeA == DOUBLE && typeB == INTEGER) {
					cout << "\tfaddp	%st(0),%st(1)"<<endl;
					cout << "\tfstpl 8(%rsp)"<<endl; 
					cout << "\taddq $8, %rsp"<<endl;
				} else if (typeA == INTEGER && typeB == DOUBLE) {
					cout << "\tfaddp	%st(0),%st(1)"<<endl;
					cout << "\tfstpl 8(%rsp)"<<endl; 
					cout << "\taddq $8, %rsp"<<endl;
				} else if (typeA==INTEGER) {
					cout << "\taddq	%rbx, %rax\t# ADD"<<endl;
					cout << "\tpush %rax"<<endl;		
				} else if (typeA == DOUBLE) {
					cout<<"\tfaddp	%st(0),%st(1)"<<endl;
					cout<<"\tfstpl 8(%rsp)"<<endl; 
					cout<<"\taddq $8, %rsp"<<endl;
				} else {
					Error("Entiers ou doubles attendus");
				}
				break;			
			case SUB:
				if (typeA!=INTEGER && typeA!=DOUBLE)
					Error("Entiers attendus"); 
				if (typeA == DOUBLE && typeB == INTEGER) {
					cout << "\tfsubp	%st(0),%st(1)"<<endl;
					cout << "\tfstpl 8(%rsp)"<<endl; 
					cout << "\taddq $8, %rsp"<<endl;
				} else if (typeA == INTEGER && typeB == DOUBLE) {
					cout << "\tfsubp	%st(0),%st(1)"<<endl;
					cout << "\tfstpl 8(%rsp)"<<endl; 
					cout << "\taddq $8, %rsp"<<endl;
				} else	if (typeA == DOUBLE) {
					cout<<"\tfsubp \t%st(0),%st(1)" << endl; 
					cout<<"\tfstpl 8(%rsp)"<<endl;
					cout<<"\taddq	$8, %rsp\t# result on stack's top"<<endl; 
				} else if (typeA==INTEGER) {
					cout << "\tsubq	%rbx, %rax\t# SUB"<<endl;
					cout << "\tpushq %rax"<<endl;
				}
				break;
			default:
				Error("opérateur additif inconnu");
		}
	}
	return typeA;
}

TYPES Type(void){
	if (current!=KEYWORD){
		Error("Type attendu");
	}
	if(strcmp(lexer->YYText(),"INTEGER")==0){
		current=(TOKEN) lexer->yylex();
		return INTEGER;
	}
	else if(strcmp(lexer->YYText(),"BOOLEAN")==0) {
		current=(TOKEN) lexer->yylex();
		return BOOLEAN;
	} else if (strcmp(lexer->YYText(),"DOUBLE")==0) {
		current=(TOKEN) lexer->yylex();
		return DOUBLE;
	} else if (strcmp(lexer->YYText(),"CHAR")==0) {
		current=(TOKEN) lexer->yylex();
		return CHAR;
	}
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
		switch(type){
			case BOOLEAN:
			case INTEGER:
				cout << *it << ":\t.quad 0"<<endl;
				break;
			case DOUBLE:
				cout << *it << ":\t.double 0.0"<<endl;
				break;
			case CHAR:
				cout << *it << ":\t.byte 0"<<endl;
				break;
			default:
				Error("Type inconnu");
		}
		DeclaredVariables[*it]=type;
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
	typeA=SimpleExpression();
	if(current==RELOP){
		oprel=RelationalOperator();
		typeB=SimpleExpression();
		if (typeA!=typeB)
			Error("Memes types attendus"); // same type expected
		if (typeA==INTEGER || typeA==BOOLEAN){
			cout << "\tpop %rax"<<endl;
			cout << "\tpop %rbx"<<endl;
			cout << "\tcmpq %rax, %rbx"<<endl;
		} else if (typeA==DOUBLE){
			cout<<"\tfldl	(%rsp)\t"<<endl;
			cout<<"\tfldl	8(%rsp)\t# first operand -> %st(0) ; second operand -> %st(1)"<<endl;
			cout<<"\t addq $16, %rsp\t# 2x pop nothing"<<endl;
			cout<<"\tfcomip %st(1)"<<endl;
			cout<<"\tfaddp %st(1)\t# pop nothing"<<endl;
		} else if (typeA==CHAR){
			cout << "\tpop %rax"<<endl;
			cout << "\tpop %rbx"<<endl;
			cout << "\tcmpb %al, %bl"<<endl;
		} else {
			Error("Entier, booléen, char ou double attendu");
		}
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

KEYWORDS getKeyword(void){
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
	else if (strcmp(lexer->YYText(),"DOWNTO")==0)
		kw=DOWNTO;
	else if (strcmp(lexer->YYText(),"TRUE")==0)
		kw=TRUE;
	else if (strcmp(lexer->YYText(),"FALSE")==0)
		kw=FALSE;
	else if (strcmp(lexer->YYText(),"CASE")==0)
		kw=CASE;
	else if (strcmp(lexer->YYText(),"OF")==0)
		kw=OF;
	else if (strcmp(lexer->YYText(),"DEFAULT")==0)
		kw=DEFAULT;
	else
		kw=NONE;
	return kw;
}

TYPES getType (string variable){
	if (IsDeclared(variable.c_str()))
		return DeclaredVariables[variable];
	else
		Error("Variable non déclarée");
	return INTEGER;
}

// AssignementStatement := Identifier ":=" Expression
string AssignementStatement(void){
	cout << "#-----------------------AssignementStatement-----------------------#"<<endl;
	enum TYPES type1, type2;
	string variable;
	if(current!=ID)
		Error("Identificateur attendu");
	if (!IsDeclared(lexer->YYText()))
		Error("Variable non déclarée");
	variable=lexer->YYText();
	current=(TOKEN) lexer->yylex();
	type1=DeclaredVariables[variable];
	if(current!=ASSIGN)
		Error("':=' attendu");
	current=(TOKEN) lexer->yylex();
	type2=Expression();
	if (type1!=type2 && !((type1==DOUBLE && type2==INTEGER) || (type1==INTEGER && type2==DOUBLE)))
		Error("Memes types attendus");
	cout << "\tpop "<<variable<<endl;
	return variable;	
}

// DisplayStatement := "DISPLAY" Expression
void DisplayStatement(void){
	cout << "#-----------------------DisplayStatement"<< TagNumber << "-----------------------#"<<endl;
	enum TYPES type;
	current=(TOKEN) lexer->yylex();
	type = Expression();
	if (type == INTEGER){
		cout << "\tpop %rsi   \t# The value to be displayed"<<endl;
		cout << "\tmovq $FormatStringSignedInt, %rdi   \t# \"%llu\\n\""<<endl; 
		cout << "\txorl	%eax, %eax    \t# No floating point arguments"<<endl;
	} else if (type == BOOLEAN){
		cout << "\tpop %rsi   \t# The value to be displayed"<<endl;
		cout << "\tcmpq $0, %rsi   \t# Compare with 0"<<endl;
		cout << "\tjne displayVrai"<<++TagNumber<<"\t# If not equal to 0"<<endl;
		cout << "\tmovq $FormatStringFalse, %rdi   \t# \"FALSE\\n\""<<endl;
		cout << "\tjmp Suite"<<TagNumber<<endl;
		cout << "displayVrai"<<TagNumber<<":\tmovq $FormatStringTrue, %rdi   \t# \"TRUE\\n\""<<endl;
		cout << "Suite"<<TagNumber<<":"<<endl;
		cout << "\txorl	%eax, %eax    \t# No floating point arguments"<<endl;
	} else if (type == DOUBLE){
		cout << "\tmovsd	(%rsp), %xmm0   \t# L'adresse de la valeur dans le registre xmm0"<<endl;
		cout << "\tsubq $16 , %rsp   \t# Allocate 16 bytes on stack's top"<<endl;
		cout << "\tmovsd %xmm0, 8(%rsp)   \t# Store the value on the stack"<<endl;
		cout << "\tmovq $FormatStringDouble, %rdi   \t# \"%f\\n\""<<endl;
 		cout << "\tadd $24, %rsp   \t# pop nothing"<<endl;
	} else if (type == CHAR){
		cout << "\tpop %rsi   \t# The value to be displayed"<<endl;
		cout << "\tmovq $FormatStringCHAR, %rdi   \t# \"%c\\n\""<<endl;
		cout << "\txorl	%eax, %eax    \t# No floating point arguments"<<endl;
		} else {
		Error("Entier ou booléen attendu");
	}
	cout << "\tcall printf@PLT   \t # Display the value"<<endl;
}

// IfStatement := "IF" Expression "THEN" Statement [ "ELSE" Statement ]
void IfStatement(void){
	unsigned long TagNumber1 = ++TagNumber;
	cout << "#-----------------------IfStatement"<< TagNumber1 << "-----------------------#"<<endl;
	if(current!=KEYWORD && getKeyword()!=IF)
		Error("Mot clé 'IF' attendu");
	current=(TOKEN) lexer->yylex();
	Expression();
	cout << "\tpop %rax"<<endl;
	cout << "\tcmpq $0, %rax"<<endl; // compare with 0 to know if the expression is false
	cout << "\tje ELSE"<<TagNumber1<<endl; // if false, jump to the else statement
	if(current!=KEYWORD && getKeyword()!=THEN)
		Error("Mot clé 'THEN' attendu");
	current=(TOKEN) lexer->yylex();
	Statement();
	cout << "\tjmp FINIF"<<TagNumber1<<endl;
	cout << "ELSE"<<TagNumber1<<":"<<endl;
	if(current!=KEYWORD && getKeyword()!=ELSE)
		Error("Mot clé 'ELSE' attendu");
	current=(TOKEN) lexer->yylex();
	Statement();
	cout << "FINIF"<<TagNumber1<<":"<<endl;
}

// WhileStatement := "WHILE" Expression "DO" Statement
void WhileStatement(void){
	unsigned long TagNumber1=++TagNumber;
	cout << "#-----------------------WhileStatement"<< TagNumber1 << "-----------------------#"<<endl;
	if(current!=KEYWORD && getKeyword()!=WHILE)
		Error("Mot clé 'WHILE' attendu");
	current=(TOKEN) lexer->yylex();
	cout << "TESTWHILE"<<TagNumber1<<":"<<endl;
	Expression();
	cout << "\tpop %rax"<<endl;
	cout << "\tcmpq $0, %rax"<<endl; // compare with 0 to know if the expression is false
	cout << "\tje FINWHILE"<<TagNumber1<<endl; // if false, jump to the end of the while statement
	if(current!=KEYWORD && getKeyword()!=DO)
		Error("Mot clé 'DO' attendu");
	current=(TOKEN) lexer->yylex();
	Statement();
	cout << "\tjmp TESTWHILE"<<TagNumber1<<endl;
	cout << "FINWHILE"<<TagNumber1<<":"<<endl;
}

// FORStatement := "FOR" AssignementStatement ("TO"|"DOWNTO") Expression "DO" Statement
void ForStatement(void){
	unsigned long TagNumber1=++TagNumber;
	cout << "#-----------------------ForStatement"<< TagNumber1 << "-----------------------#"<<endl;
	enum TYPES type1, type2;
	bool to = false; // true if the keyword is TO, false if it is DOWNTO
	string variable;
	if(current!=KEYWORD && getKeyword()!=FOR)
		Error("Mot clé 'FOR' attendu");
	current=(TOKEN) lexer->yylex();
	variable = AssignementStatement();
	type1 = getType(variable);
	if(current!=KEYWORD && getKeyword()!=TO && getKeyword()!=DOWNTO) {
		Error("Mot clé 'TO' ou 'DOWNTO' attend");
	} else if (getKeyword()==TO){
		to = true;
	}
	current=(TOKEN) lexer->yylex();
	cout << "DEBUTFOR"<<TagNumber1<<":"<<endl;
	type2 = Expression();
	if (type1!=type2 || type1!=INTEGER) // les variables de la boucle FOR doivent être des entiers
		Error("Les paramètres de la boucle FOR doivent être des entiers");
	cout << "\tpop %rbx #\t valeur de l'expression"<<endl;
	cout << "\tcmpq %rbx, "<<variable<<endl;
	if (to){
		cout << "\tjae FINFOR"<<TagNumber1<<endl;
	} else {
		cout << "\tjbe FINFOR"<<TagNumber1<<endl; 
	}
	if(current!=KEYWORD && getKeyword()!=DO)
		Error("Mot clé 'DO' attendu");
	current=(TOKEN) lexer->yylex();
	Statement();
	if (to){
		cout << "\tincq "<<variable<<endl; // increment the variable
	} else {
		cout << "\tdecq "<<variable<<endl; // decrement the variable
	}
	cout << "\tjmp DEBUTFOR"<<TagNumber1<<endl;

	cout << "FINFOR"<<TagNumber1<<":"<<endl;
}

// BlockStatement := "BEGIN" Statement { ";" Statement } "END"
void BlockStatement(void){
	cout << "#-----------------------BlockStatement"<< TagNumber << "-----------------------#"<<endl;
	if(current!=KEYWORD && getKeyword()!=BEGIN)
		Error("Mot clé 'BEGIN' attendu");
	current=(TOKEN) lexer->yylex();
	Statement();
	while(current==SEMICOLON){
		current=(TOKEN) lexer->yylex();
		Statement();
	}
	if(current!=KEYWORD && getKeyword()!=END)
		Error("Mot clé 'END' attendu");
	current=(TOKEN) lexer->yylex();
}

void CaseComparaison (TYPES typeExpression){
	// aprés mure réflexion, je n'ai pas trouvé d'autre solution que de dupliquer le code de la fonction Expression() pour la comparaison
	TYPES typeFactor = Factor();
	if (typeFactor!=typeExpression)
		Error("Cas de même type que l'expression attendu (case)");
	if (typeFactor==INTEGER || typeFactor==BOOLEAN){
		cout << "\tpop %rax"<<endl;
		cout << "\tcmpq %rax, %rbx"<<endl;
		cout << "\tje CASEVRAIS"<<TagNumber<<endl;
	} else if (typeFactor==CHAR){
		cout << "\tpop %rax"<<endl;
		cout << "\tcmpb %al, %bl"<<endl;
		cout << "\tje CASEVRAIS"<<TagNumber<<endl;
	} else {
		Error("Entier, booléen ou char attendu pour les cases");
	}
}

// CaseLabelList ::= Factor {, Factor }
void CaseLabelList(TYPES typeExpression){
	unsigned long ThisCase=++TagNumber;
	CaseComparaison(typeExpression);
	while(current==COMMA){
		CaseComparaison(typeExpression);
	}
	cout << "\tjmp ENDCASE"<<ThisCase<<endl;
}

// CaseListElement ::= CaseLabelList ":" Statement | Empty
void CaseListElement(TYPES typeExpression, int caseTagNumber){
	CaseLabelList(typeExpression);
	if (current!=COLON){
		Error("':' attendu après la liste des cas");
	}
	current=(TOKEN) lexer->yylex();
	if ((current==KEYWORD && getKeyword()!=END) && (strcmp(lexer->YYText(),";")!=0)){ // si le statement n'est pas vide
		cout << "CASEVRAIS"<<TagNumber<<":"<<endl;
		Statement();
		cout << "\tjmp CASEFINISHED"<<caseTagNumber<<endl;
	} else if (strcmp(lexer->YYText(),";")==0){ // si le statement est vide
		cout << "CASEVRAIS"<<TagNumber<<":"<<endl;
		cout << "\tjmp CASEFINISHED"<<caseTagNumber<<endl;
	} else {
		Error("Instruction attendue après les cas");
	}
}

// CaseStatement ::= "CASE" Expression "OF" CaseListElement {";" CaseListElement } [";" DEFAULT Statement] "END"
void CaseStatement(void){
	unsigned long TagNumber1=++TagNumber;// TagNumber1 est le numéro du CASE nous permettant de sauter les cases si une condition est vérifiée
	cout << "#-----------------------CaseStatement"<< TagNumber1 << "-----------------------#"<<endl;
	
	if(current!=KEYWORD && getKeyword()!=CASE)
		Error("Mot clé 'CASE' attendu");

	current=(TOKEN) lexer->yylex();
	TYPES typeExpression = Expression();
	if(current!=KEYWORD && getKeyword()!=OF)
		Error("Mot clé 'OF' attendu");
	
	current=(TOKEN) lexer->yylex();
	if (typeExpression==DOUBLE)
		Error("Type double non implenté pour les cases");
	cout << "\tpop %rbx"<<endl; // l'expression est stockée dans rbx durant tout le casestatement

	CaseListElement(typeExpression, TagNumber1); // type = pour eviter les comparaisons de types différents, TagNumber1 = permettre le jmp à la fin du casestatement si une condition est vérifiée
	cout << "ENDCASE"<<TagNumber<<":"<<endl;
	while(current==SEMICOLON){
		current=(TOKEN) lexer->yylex();
		if (current==KEYWORD && getKeyword()==DEFAULT){
			current=(TOKEN) lexer->yylex();
			if (current!=COLON)
				Error("':' attendu après le mot clé 'DEFAULT'");
			current=(TOKEN) lexer->yylex();
			Statement();
			if (current!=KEYWORD && getKeyword()!=END)
				Error("Mot clé 'END' attendu après le mot clé 'DEFAULT'");
			break;
		} else {
			CaseListElement(typeExpression, TagNumber1);
			cout << "ENDCASE"<<TagNumber<<":"<<endl;
		}

	}
	cout << "CASEFINISHED"<<TagNumber1<<":"<<endl;
	if(current!=KEYWORD && getKeyword()!=END)
		Error("Mot clé 'END' attendu");
	current=(TOKEN) lexer->yylex();
}

// NotStatement ::= "NOT" Expression
void NotStatement(void){
	cout << "#-----------------------NotStatement"<< TagNumber << "-----------------------#"<<endl;
	if(current!=NOT)
		Error("Mot clé 'NOT' attendu");
	current=(TOKEN) lexer->yylex();
	Expression();
	cout << "\tpop %rax"<<endl;
	cout << "\txorq $0xFFFFFFFFFFFFFFFF, %rax"<<endl;
	cout << "\tpush %rax"<<endl;
}



// Statement := AssignementStatement | IfStatement | WhileStatement | ForStatement | BlockStatement | DisplayStatement | CaseStatement
void Statement(void){
	switch(current){
		case ID:
			AssignementStatement();
			break;
		case KEYWORD:
			switch(getKeyword()){
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
				case CASE:
					CaseStatement();
					break;
				case NOT:
					NotStatement();
					break;
				default:
					Error("Instruction non reconnue");
			}
			break;
		case NOT:
			NotStatement();
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
	cout << ".cfi_startproc"<<endl;
	cout << "endbr64"<<endl;
	cout << "\tpushq %rbp \t# Save the position of the stack's top"<<endl;
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
	if(current==KEYWORD && getKeyword()==VAR)
		VarDeclarationPart();
	StatementPart();
}

int main(void){	// First version : Source code on standard input and assembly code on standard output
	// Header for gcc assembler / linker
	cout << "\t\t\t# This code was produced by the CERI Compiler"<<endl;
	cout << ".data"<<endl;
	cout << "FormatStringSignedInt:\t.string \"%lld\\n\"\t# used by printf to display 64-bit unsigned integers"<<endl; 
	cout << "FormatStringDouble:\t.string \"%f\\n\"\t# used by printf to display double precision floating point numbers"<<endl;
	cout << "FormatStringCHAR:\t.string \"%c\\n\"\t# used by printf to display CHARacters"<<endl;
	cout << "FormatStringTrue:\t.string \"TRUE\\n\"\t# used by printf to display the boolean value TRUE"<<endl; 
	cout << "FormatStringFalse:\t.string \"FALSE\\n\"\t# used by printf to display the boolean value FALSE"<<endl; 
	// Let's proceed to the analysis and code production
	current=(TOKEN) lexer->yylex();
	Program();
	// Trailer for the gcc assembler / linker
	cout << "\tpopq %rbp\t\t# Restore the position of the stack's top"<<endl;
	cout << "\tret\t\t\t# Return from main function"<<endl;
	cout << ".cfi_endproc"<<endl;

	if(current!=FEOF){
		cerr <<"Caractères en trop à la fin du programme : ["<<current<<"]";
		Error("."); // unexpected CHARacters at the end of program
	}
}