;; extends
(list_lit
  value: (sym_lit) @_keyword.function
  (#any-of? @_keyword.function "fn" "fn*" "defn" "defn-")
  value: (sym_lit)? @y9nika.declaration
  value: (vec_lit)
  (str_lit)? @comment)

(list_lit
  value: (sym_lit) @_keyword.function
  (#any-of? @_keyword.function "fn" "fn*" "defn" "defn-")
  value: (sym_lit)? @y9nika.declaration
  value: (list_lit))

(list_lit
  value: (sym_lit) @_keyword.function
  (#eq? @_keyword.function "defmacro")
  value: (sym_lit)? @y9nika.declaration
  value: (vec_lit)
  (str_lit)? @comment)

(list_lit
  value: (sym_lit) @_include
  (#eq? @_include "ns")
  value: (sym_lit) @y9nika.declaration)

(list_lit
  value: (kwd_lit) @y9nika.variable)
(vec_lit
  value: (kwd_lit) @y9nika.variable)
(map_lit
  value: (kwd_lit) @y9nika.variable)
