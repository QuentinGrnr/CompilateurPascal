// tokeniser.h : shared definition for tokeniser.l and compilateur.cpp

enum TOKEN {FEOF, UNKNOWN, NUMBER, KEYWORD, ID, STRINGCONST, RBRACKET, LBRACKET, RPARENT, LPARENT, COMMA, 
SEMICOLON, COLON, DOT, ADDOP, MULOP, RELOP, NOT, ASSIGN};

////////////////////////// Notes //////////////////////////
// \" => je veux un guillemet
// [^\n"]+ => tout sauf un guillemet ou un retour a la ligne une ou plusieurs fois
// * => zero ou plusieurs fois
// + => une ou plusieurs fois
///////////////////////////////////////////////////////////