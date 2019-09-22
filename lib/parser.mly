%{
%}

%token <int> INT
%token <bool> BOOL
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token AND OR NOT
%token EOL

%left PLUS MINUS
%left TIMES DIV
%left AND OR
%nonassoc UMINUS
%nonassoc UNOT

%start main

%type <Syntax.expr> main
%%
main:
    expr EOL { $1 }
;

expr:
    | INT { Syntax.Int $1 }
    | BOOL { Syntax.Bool $1 }
    | LPAREN expr RPAREN { Syntax.Paren $2 }
    | expr PLUS expr { Syntax.Plus ($1, $3) }
    | expr MINUS expr { Syntax.Minus ($1, $3) }
    | expr TIMES expr { Syntax.Times ($1, $3) }
    | expr DIV expr { Syntax.Div ($1, $3) }
    | expr AND expr { Syntax.And ($1, $3) }
    | expr OR expr { Syntax.Or ($1, $3) }
    | NOT expr %prec UNOT { Syntax.Not $2 }
    | MINUS expr %prec UMINUS { Syntax.Negate $2 }
