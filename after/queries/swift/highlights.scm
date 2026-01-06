;; vim: ft=query
;; extends

(class_declaration
  name: (type_identifier) @y9nika.declaration)

(function_declaration
  name: (simple_identifier) @y9nika.declaration)

(parameter
  name: (simple_identifier) @y9nika.variable)

(property_declaration
  name: (pattern
    bound_identifier: (simple_identifier) @y9nika.variable))

"nil" @y9nika.variable

"init" @y9nika.muted
