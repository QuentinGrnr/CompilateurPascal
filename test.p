VAR		a,b,c :	INTEGER;
		c1,c2:	CHAR;
		num, denum, frac, intD:		DOUBLE;
		boolVal :	BOOLEAN;
		text:	STRING.
DISPLAY "Hello World!";
c1:='f';
c2:='a';
num:=1.0;
denum:=1.0;
frac:=num/denum; 
a:=1;
c:=2;
DISPLAY "Test de booleens :";
DISPLAY "!((a>3) || (c==2)) pour a =1 et c=2 donne ";
boolVal:=!((a>3) || (c==2));
DISPLAY boolVal;
DISPLAY '\n';
DISPLAY "test Statements imbriqués complexe :";
DISPLAY "If a>3 et c==2 alors afficher a>3 et c==2 sinon afficher a>3 et c!=2";
IF (a>3) THEN
	BEGIN
		IF (c==2) THEN
			DISPLAY "a>3 et c==2"
		ELSE
			DISPLAY "a>3 et c!=2"
	END
ELSE
	BEGIN 
		IF (c==2) THEN
			DISPLAY "a<=3 et c==2"
		ELSE
			DISPLAY "a<=3 et c!=2"
	END;
DISPLAY '\n';
DISPLAY "Test de la boucle while :";
DISPLAY "Afficher les entiers de 1 à 10 2 fois";
a:=1;
WHILE (a<=10) DO
	BEGIN
		b:=1;
		WHILE (b<=2) DO
			BEGIN
				DISPLAY a;
				b:=b+1
			END;
		a:=a+1
	END;
DISPLAY '\n';
DISPLAY "Test de la boucle for :";
DISPLAY "Afficher les entiers de 1 à 10 2 fois";
FOR a:=1 TO 10 DO
	BEGIN
		FOR b:=3 DOWNTO 2 DO
			BEGIN
				DISPLAY a
			END
	END;
DISPLAY '\n';
DISPLAY "Test du case sur float : (fonctionne avec tout les types de variables)";
DISPLAY "Afficher le cas de 1.0, 2.0 et 3.0";
intD:=2.0;
CASE intD OF
	1.0: DISPLAY 1.0;
	2.0: DISPLAY 2.0;
	3.0: DISPLAY 3.0;
	DEFAULT: DISPLAY "Autre"
END;
DISPLAY '\n';
DISPLAY "assignation d'un boolen à TRUE (possible a FALSE aussi)";
boolVal:=TRUE;
DISPLAY boolVal;
DISPLAY '\n';
DISPLAY "Test d'operation de int et float";
a:=1;
intD:=2.5;
DISPLAY "on a a=1 et intD=2.5";
DISPLAY "intD + a";
DISPLAY intD+a;
DISPLAY "intD - a";
DISPLAY intD-a;
DISPLAY "intD * a";
DISPLAY intD*a;
DISPLAY "intD / a";
DISPLAY intD/a;
DISPLAY '\n';

DISPLAY "Comparaison d'entier et de float";
a:=1;
intD:=2.5;
DISPLAY "on a a=1 et intD=2.5";
DISPLAY "intD > a";
DISPLAY intD>a;
DISPLAY "intD < a";
DISPLAY intD<a;
DISPLAY "intD >= a";
DISPLAY intD>=a;
DISPLAY "intD <= a";
DISPLAY intD<=a.