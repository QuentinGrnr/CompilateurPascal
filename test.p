VAR		a,b :	INTEGER;
		c1,c2:	CHAR;
		num, denum, frac:		DOUBLE.
c1:='f';
c2:='a';
num:=1.0;
denum:=1.0;
frac:=num/denum; 
a:=1;
WHILE frac>0.1 DO
BEGIN
	DISPLAY c1;
	DISPLAY '=';
	DISPLAY frac;
	DISPLAY '\n';
	DISPLAY c2;
	DISPLAY '=';
	DISPLAY a;
	DISPLAY '\n';
	denum:=denum+1.0;
	frac:=num/denum;
	a:=a+1;
	DISPLAY (a>3);
	DISPLAY '\n'
END;
FOR b:= 0 TO 10 DO
     FOR a:=10 DOWNTO 1 DO
     BEGIN
          DISPLAY a;
          DISPLAY '*'; 
          DISPLAY b;
          DISPLAY '=';
          DISPLAY a*b;
          DISPLAY '\n'
     END;
CASE c1 OF
	'a': DISPLAY 'a';
	'b': DISPLAY 'b';
	'c': DISPLAY 'c';
	'd': DISPLAY 'd';
	'e': DISPLAY 'e';
	'f': DISPLAY 'f';
	'g': DISPLAY 'g';
	'h': DISPLAY 'h';
	'i': DISPLAY 'i';
	'j': DISPLAY 'j';
	'k': DISPLAY 'k';
	'l': DISPLAY 'l';
	'm': DISPLAY 'm';
	'n': DISPLAY 'n';
	'o': DISPLAY 'o';
	'p': DISPLAY 'p';
	'q': DISPLAY 'q';
	'r': DISPLAY 'r';
	's': DISPLAY 's';
	't': DISPLAY 't';
	'u': DISPLAY 'u';
	'v': DISPLAY 'v';
	'w': DISPLAY 'w';
	'x': DISPLAY 'x';
	'y': DISPLAY 'y';
	'z': DISPLAY 'z'
END;

CASE 1 OF
	1: DISPLAY '1';
	2: DISPLAY '2';
	3: DISPLAY '3'
END.
