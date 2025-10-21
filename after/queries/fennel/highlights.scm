;; vim: ft=query
;; extends

; (fn
;   name: (symbol) @y9nika.definition)
;   ; TODO: add this when https://github.com/nvim-treesitter/nvim-treesitter/issues/1788 is fixed
;   ; docstring: (string)? @y9nika.comment
; (fn
;   name: (multi_symbol (symbol) @y9nika.definition))

; (global
;   (binding
;     (symbol) @y9nika.definition))

(list
  (symbol) @function.macro
  (#match? @function.macro "^macro$")
  (symbol) @y9nika.definition)

