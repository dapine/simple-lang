{
    open Parser
    exception Eof
}

rule token = parse
    | [' ' '\t'] { token lexbuf }
    | ['\n'] { EOL }
    | ['0'-'9']+ as lxm { INT (int_of_string lxm) }
    | "true" as lxm { BOOL (bool_of_string lxm) }
    | "false" as lxm { BOOL (bool_of_string lxm) }
    | '+' { PLUS }
    | '-' { MINUS }
    | '*' { TIMES }
    | '/' { DIV }
    | '(' { LPAREN }
    | ')' { RPAREN }
    | "and" { AND }
    | "or" { OR }
    | "not" { NOT }
    | eof { raise Eof }
