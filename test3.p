VAR		a,b,c :	INTEGER;
		c1,c2:	CHAR;
		num, denum, frac, intD:		DOUBLE;
		test:	BOOLEAN.
intD:=1.5 + 1;
CASE intD OF
	1.5: DISPLAY 1;
	2.5: DISPLAY 2;
	3.5: DISPLAY 3;
	DEFAULT: DISPLAY 4
END.