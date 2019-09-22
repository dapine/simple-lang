let _ =
    try
        let lexbuf = Lexing.from_channel stdin
        in
        while true do
            let result = Lang.Parser.main Lang.Lexer.token lexbuf
            in
            print_endline (Lang.Syntax.string_of_expr result); flush stdout
        done
    with Lang.Lexer.Eof -> exit 0
