all:	test
clean:
		rm *.o *.s
		rm tokeniser.cpp
tokeniser.cpp:	tokeniser.l
		flex++ -d -o tokeniser.cpp tokeniser.l
tokeniser.o:	tokeniser.cpp
		g++ -c tokeniser.cpp
compilateur:	compilateur.cpp tokeniser.o
		g++ -ggdb -o compilateur compilateur.cpp tokeniser.o
test:		compilateur test2.p
		./compilateur <test2.p >test.s
		gcc -ggdb -no-pie test.s -o test


