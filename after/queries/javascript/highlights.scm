;; vim: ft=query
;; extends

(variable_declarator
  name: (identifier) @y9nika.variable)

(function_declaration
  name: (identifier) @y9nika.declaration)

(variable_declarator
  name: (identifier) @y9nika.declaration
  value: (arrow_function))

[
  (null)
  (undefined)
] @y9nika.variable

