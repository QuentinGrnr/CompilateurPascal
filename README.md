# Pascal compiler

## From Pascal-like imperative LL(k) langage, To 64 bit 80x86 assembly langage (AT&T)

Project for a Pascal code compiler completed during the Assembly Language course of my fourth semester in the Computer Science degree. This project uses C++ as an intermediary to utilize the assembly code necessary for executing Pascal code. The project structure was designed by Mr. Pierre Jourlin.

## Personal Additions

**__- Case Statement:__**
Enables handling of multiple conditions based on the value of an expression/variable and executes the code corresponding to the first condition met.

**__- Addition of default case in CASESTATEMENT:__**
Enables handling the case where no condition is met.

**__- Display: modification of the display to work on my system__**
I had to analyze how `printf` works in assembly on my system to understand why the provided assembly code did not function correctly on my system. You will find screenshots in the "Screen" folder that demonstrate the display functionality for all my test files.

**__- Addition of the function getType: allows retrieving the type of a variable__**
This function allows retrieving the type of a variable based on its name. It is used to verify that variable types are compatible during assignment.

**__- Addition of the KEYWORDS "TRUE" and "FALSE": enables defining boolean values__**

**__- Addition of NOT:__**
Allows negation of a boolean expression.

**__- Addition of int with float operations:__**
Enables addition, subtraction, multiplication, and division between an integer and a float, regardless of the order.

**__- Addition of int with float comparison:__**
Allows comparison between an integer and a float, regardless of the order.

**__- Addition of the string type:__**
Allows declaring variables of type `string` and manipulating them. This also includes the display of strings. After spending many hours trying to concatenate two strings, I unfortunately did not succeed. 

**Build the compiler and test it :**

> make test

**Have a look at the output :**

> gedit test.s

**Debug the executable :**

> ddd ./test

**This version Can handle :**

// Program := [DeclarationPart] StatementPart
// DeclarationPart := "[" Letter {"," Letter} "]"
// VarDeclarationPart := "VAR" VarDeclaration {";" VarDeclaration} "."
// VarDeclaration := Ident {"," Ident} ":" Type
// StatementPart := Statement {";" Statement} "."
// Statement := AssignementStatement | IfStatement | WhileStatement | ForStatement | BlockStatement | DisplayStatement | NotStatement | CaseStatement

// AssignementStatement := Letter "=" Expression
// IfStatement := "IF" Expression "THEN" Statement [ "ELSE" Statement ]
// WhileStatement := "WHILE" Expression "DO" Statement
// ForStatement := "FOR" AssignementStatement "To" Expression "DO" Statement
// BlockStatement := "BEGIN" Statement { ";" Statement } "END"
// CaseStatement ::= "CASE" Expression "OF" CaseListElement {; CaseListElement } "END"
// CaseListElement ::= CaseLabelList ":" Statement | Empty
// CaseLabelList ::= Factor {, Factor }
// DisplayStatement := "DISPLAY" Expression
// NotStatement := "NOT" Factor

// Expression := SimpleExpression [RelationalOperator SimpleExpression]
// SimpleExpression := Term {AdditiveOperator Term}
// Term := Factor {MultiplicativeOperator Factor}
// Factor := Number | Letter | "(" Expression ")"| "!" Factor
// Number := Digit{Digit}

// AdditiveOperator := "+" | "-" | "||"
// MultiplicativeOperator := "*" | "/" | "%" | "&&"
// RelationalOperator := "==" | "!=" | "<" | ">" | "<=" | ">="  
// Digit := "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
// Letter := "a"|...|"z"

