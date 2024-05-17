# CERIcompiler

### Ajout personnels
**__- Display : modification du display pour qu'il fonctionne sur mon système__**
J'ai du annalyser le fonctionnement du printf en assembleur sur mon systeme pour comprendre pourquoi le code assembleur donné ne fonctionnait pas sur mon système.
**__- Ajout de la fonction getType : permet de récupérer le type d'une variable__**
Cette fonction permet de récupérer le type d'une variable en fonction de son nom. Elle est utilisée pour vérifier que les types des variables sont compatibles lors d'une assignation.
**__- Ajout des KEYWORDS "TRUE" et "FALSE" : permet de définir la valeur booléenne__**
**__- Ajout des commentaires : permet de commenter le code__**
Les commentaires sont de la forme `// commentaire //` et sont ignorés par le compilateur. WARN : les commentaires sont interpretés comme des instructions, ainsi ils peuvent etre placée dans les partie du code qui acceptent des instructions (par exemple pas dans les déclarations).

### A faire
- implementer NOT
- modif reconnaissance true/false dans factor()
- ajout operations int with float

A simple compiler.
From : Pascal-like imperative LL(k) langage
To : 64 bit 80x86 assembly langage (AT&T)

**Download the repository :**

> git clone git@framagit.org:jourlin/cericompiler.git

**Build the compiler and test it :**

> make test

**Have a look at the output :**

> gedit test.s

**Debug the executable :**

> ddd ./test

**Commit the new version :**

> git commit -a -m "What's new..."

**Send to your framagit :**

> git push -u origin master

**Get from your framagit :**

> git pull -u origin master

**This version Can handle :**

// Program := [DeclarationPart] StatementPart
// DeclarationPart := "[" Identifier {"," Identifier} "]"
// StatementPart := Statement {";" Statement} "."
// Statement := AssignementStatement
// AssignementStatement := Identifier ":=" Expression

// Expression := SimpleExpression [RelationalOperator SimpleExpression]
// SimpleExpression := Term {AdditiveOperator Term}
// Term := Factor {MultiplicativeOperator Factor}
// Factor := Number | Letter | "(" Expression ")"| "!" Factor
// Number := Digit{Digit}
// Identifier := Letter {(Letter|Digit)}

// AdditiveOperator := "+" | "-" | "||"
// MultiplicativeOperator := "*" | "/" | "%" | "&&"
// RelationalOperator := "==" | "!=" | "<" | ">" | "<=" | ">="  
// Digit := "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
// Letter := "a"|...|"z"

