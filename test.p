VAR		a,b,c :	INTEGER;
		c1,c2:	CHAR;
		num, denum, frac:		DOUBLE.
c1:='f';
c2:='a';
num:=1.0;
denum:=1.0;
frac:=num/denum; 
a:=1;
c:=2;
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
CASE c OF
	1: DISPLAY 1;
	2: DISPLAY 2;
	3: DISPLAY 3;
	4: DISPLAY 4
END;
CASE c1 OF
	'a': DISPLAY 'a';
	'b': DISPLAY 'b';
	'd': DISPLAY 'd';
	DEFAULT: DISPLAY 'p'

END.
