VAR 
     b,z   : BOOLEAN ; 
     a,c,d : INTEGER.
z:=(8==3)||(4==2*2);
b:=(5/65+2)<(7%5);
a:=0;
IF z THEN BEGIN a:=1; c:=3 END ELSE BEGIN a:=3;c:=4 END;
    BEGIN a:=a+1;c:=c+1;
    WHILE a<2 DO 
        BEGIN a:=a+1;c:=c+1 END 
    END;
DISPLAY a;
DISPLAY c;
DISPLAY d.