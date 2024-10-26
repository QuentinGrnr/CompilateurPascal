# CERIcompiler

### Ajout personnels
**__- Case Statement :__**
Permet de gérer des conditions multiples celon la valeur d'une expression/variable et d'executer le code correspondant à la première condition vérifiée.
**__- Ajout de default case dans CASESTATEMENT :__**
Permet de gérer le cas ou aucune condition n'est vérifiée.
**__- Display : modification du display pour qu'il fonctionne sur mon système__**
J'ai du annalyser le fonctionnement du printf en assembleur sur mon systeme pour comprendre pourquoi le code assembleur donné ne fonctionnait pas sur mon système. Vous trouverez ainsi des Screen dans le dossier "Screen" qui témoignera du fonctionnement de l'affichage de tout mes test.p
**__- Ajout de la fonction getType : permet de récupérer le type d'une variable__**
Cette fonction permet de récupérer le type d'une variable en fonction de son nom. Elle est utilisée pour vérifier que les types des variables sont compatibles lors d'une assignation.
**__- Ajout des KEYWORDS "TRUE" et "FALSE" : permet de définir la valeur booléenne__**
**__- Ajout de NOT :__**
permet de faire la négation d'une expression booléenne.
**__- Ajout d'opérations int avec float :__**
Permet l'addition, la soustraction, la multiplication et la division entre un entier et un flottant peut importe l'ordre.
**__- Ajout de la comparaison int avec float :__**
Permet de comparer un entier avec un flottant peu importe l'ordre.
**__- Ajout du type string :__**
Permet de déclarer des variables de type string et de les manipuler.
Cela comprend aussi l'affichage de string. Aprés avoir passé de nombreuses heures a tenter de concaténer deux string, je n'y suis malheureusement pas parvenu.

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
