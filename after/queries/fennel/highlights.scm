;; vim: ft=query
;; extends

; (fn
;   name: (symbol) @y9nika.declaration)
;   ; TODO: add this when https://github.com/nvim-treesitter/nvim-treesitter/issues/1788 is fixed
;   ; docstring: (string)? @y9nika.marker
; (fn
;   name: (multi_symbol (symbol) @y9nika.declaration))

; (global
;   (binding
;     (symbol) @y9nika.declaration))

(list
  (symbol) @function.macro
  (#match? @function.macro "^macro$")
  (symbol) @y9nika.declaration)

