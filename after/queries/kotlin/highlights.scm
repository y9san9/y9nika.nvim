;; vim: ft=query
;; extends

(object_declaration
  (type_identifier) @y9nika.declaration)

(parameter
  (simple_identifier) @y9nika.variable)

(variable_declaration
  (simple_identifier) @y9nika.variable)

(class_parameter
  (simple_identifier) @y9nika.variable)

(line_comment) @y9nika.marker

(multiline_comment) @y9nika.marker

[
  "continue"
  "continue@"
  "break"
  "break@"
] @y9nika.marker

(function_declaration
  (simple_identifier) @y9nika.declaration)

(class_declaration
  (type_identifier) @y9nika.declaration)

