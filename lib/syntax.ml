type expr =
    | Int of int
    | Paren of expr
    | Plus of expr * expr
    | Minus of expr * expr
    | Times of expr * expr
    | Div of expr * expr
    | Negate of expr

let rec string_of_expr = function
    | Int n -> string_of_int n
    | Paren e -> "(" ^ string_of_expr e ^ ")"
    | Plus (e1, e2) -> string_of_expr e1 ^ " + " ^ string_of_expr e2
    | Minus (e1, e2) -> string_of_expr e1 ^ " - " ^ string_of_expr e2
    | Times (e1, e2) -> string_of_expr e1 ^ " * " ^ string_of_expr e2
    | Div (e1, e2) -> string_of_expr e1 ^ " / " ^ string_of_expr e2
    | Negate e -> "-" ^ string_of_expr e
