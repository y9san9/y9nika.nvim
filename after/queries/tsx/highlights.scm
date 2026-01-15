;; vim: ft=query
;; extends

[
 "<"
 ">"
 "</"
 "/>"
] @y9nika.muted

(jsx_closing_element
  name: (identifier) @y9nika.muted)

(jsx_opening_element
  name: (identifier) @y9nika.muted)

(jsx_self_closing_element
  name: (identifier) @y9nika.muted)

(jsx_text) @y9nika.variable
