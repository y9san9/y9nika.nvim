;; vim: ft=query
;; extends

(class_declaration
  name: (type_identifier) @y9nika.declaration)

(class_declaration
  name: (user_type
    (type_identifier) @y9nika.declaration))

(protocol_declaration
  name: (type_identifier) @y9nika.declaration)

(function_declaration
  name: (simple_identifier) @y9nika.declaration)

(protocol_function_declaration
  name: (simple_identifier) @y9nika.declaration)

(parameter
  name: (simple_identifier) @y9nika.variable)

(property_declaration
  name: (pattern
    bound_identifier: (simple_identifier) @y9nika.variable))

(protocol_property_declaration
  name: (pattern
    bound_identifier: (simple_identifier) @y9nika.variable))

[
  "break"
  "continue"
] @y9nika.marker

[
  "lazy"
  "init"
] @y9nika.muted

"nil" @y9nika.variable
