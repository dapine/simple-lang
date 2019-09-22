%{
%}

%token <int> INT
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token EOL

%left PLUS MINUS
%left TIMES DIV
%nonassoc UMINUS

%start main

%type <Syntax.expr> main
%%
main:
    expr EOL { $1 }
;

expr:
    | INT { Syntax.Int $1 }
    | LPAREN expr RPAREN { Syntax.Paren $2 }
    | expr PLUS expr { Syntax.Plus ($1, $3) }
    | expr MINUS expr { Syntax.Minus ($1, $3) }
    | expr TIMES expr { Syntax.Times ($1, $3) }
    | expr DIV expr { Syntax.Div ($1, $3) }
    | MINUS expr %prec UMINUS { Syntax.Negate $2 }
