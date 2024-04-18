[a,b,c,z]
z:=(8==3)||(4==2*2);
b:=(5/65+2)<(7%5);
a:=0;
IF z THEN BEGIN a:=1;b:=2 END ELSE BEGIN a:=3;b:=4 END;
FOR c:=1 TO 2 DO 
    BEGIN a:=a+1;b:=b+1;
    WHILE a<2 DO 
        BEGIN a:=a+1;b:=b+1 END 
    END.