VAR		a,b,c :	INTEGER;
		c1,c2:	CHAR;
		num, denum, frac, intD:		DOUBLE;
		test:	BOOLEAN.
intD:=1.5 + 1;
DISPLAY intD; (*Result => 2.5*)
intD:= 9 - intD;
intD:= intD - 10.5;
DISPLAY intD; (*Result => -4.0*)
intD:= 1.5 * 2;
DISPLAY intD; (*Result => 3.0*)
intD:= 3 / 2;
DISPLAY intD; (*Result => 0 car division de deux entiers*)
intD:= 3.0 / 2;
DISPLAY intD; (*Result => 1.5*)
test:= 3.0 == 3;
DISPLAY test; (*Result => TRUE*)
test:= 3.0 != 3;
DISPLAY test; (*Result => FALSE*)
test:= 3.0 < 3;
DISPLAY test; (*Result => FALSE*)
test:= 3.0 <= 3;
DISPLAY test; (*Result => TRUE*)
test:= 3.0 > 3;
DISPLAY test; (*Result => FALSE*)
test:= 3.0 >= 3;
DISPLAY test; (*Result => TRUE*)
test:= 3.0 < 3.5;
DISPLAY test; (*Result => TRUE*)
num:= 3.0 - 8.0;
test:= num > 0;
DISPLAY test. (*Result => TRUE*)