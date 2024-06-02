VAR		a,b :	INTEGER;
		c1,c2:	CHAR;
		num, denum, frac, intD:		DOUBLE.
BEGIN
    a := 1; 
    b := 2 + 3; 
    c1 := 'x';
    c2 := 'y';  
    num := 3.14; 
    denum := 2.71;  
    frac := num / denum;  
    DISPLAY a;  
    DISPLAY b;  
    DISPLAY c1; 
    DISPLAY c2;  
    DISPLAY num;  
    DISPLAY denum;  
    DISPLAY frac;  

    IF a < b THEN  
        DISPLAY a
    ELSE
        DISPLAY b;

    WHILE a < b DO 
    BEGIN
        a := a + 1;
        DISPLAY a
    END;

    FOR a := 0 TO 5 DO
    BEGIN 
        b := b + a; 
        DISPLAY b
    END;

    BEGIN
        num := num + frac;
        denum := denum - frac
    END
END;
intD:=1.5 + 1;
CASE intD OF
	1.5: DISPLAY 1;
	2.5: DISPLAY 2;
	DEFAULT: DISPLAY 4
END.
