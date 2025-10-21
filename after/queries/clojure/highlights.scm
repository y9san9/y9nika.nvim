;; extends
(list_lit
  value: (sym_lit) @_keyword.function
  (#any-of? @_keyword.function "fn" "fn*" "defn" "defn-")
  value: (sym_lit)? @y9nika.definition
  value: (vec_lit)
  (str_lit)? @comment)

(list_lit
  value: (sym_lit) @_keyword.function
  (#any-of? @_keyword.function "fn" "fn*" "defn" "defn-")
  value: (sym_lit)? @y9nika.definition
  value: (list_lit))

(list_lit
  value: (sym_lit) @_keyword.function
  (#eq? @_keyword.function "defmacro")
  value: (sym_lit)? @y9nika.definition
  value: (vec_lit)
  (str_lit)? @comment)

(list_lit
  value: (sym_lit) @_include
  (#eq? @_include "ns")
  value: (sym_lit) @y9nika.definition)

(list_lit
  value: (kwd_lit) @y9nika.local)
(vec_lit
  value: (kwd_lit) @y9nika.local)
(map_lit
  value: (kwd_lit) @y9nika.local)
