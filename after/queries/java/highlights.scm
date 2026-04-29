;; vim: ft=query
;; extends

(class_declaration
  name: (identifier) @y9nika.declaration)
(constructor_declaration
  name: (identifier) @y9nika.declaration)
(method_declaration
  name: (identifier) @y9nika.declaration)
(package_declaration
  (scoped_identifier) @y9nika.declaration)
(record_declaration
  name: (identifier) @y9nika.declaration)
(interface_declaration
  name: (identifier) @y9nika.declaration)
(enum_declaration
  name: (identifier) @y9nika.declaration)

(formal_parameter
  name: (identifier) @y9nika.variable)
(spread_parameter
  (variable_declarator
    name: (identifier) @y9nika.variable))
(inferred_parameters
  (identifier) @y9nika.variable)
(local_variable_declaration
  declarator: (variable_declarator
    name: (identifier) @y9nika.variable))
(field_declaration
  declarator: (variable_declarator
    name: (identifier) @y9nika.variable))
(enhanced_for_statement
  name: (identifier) @y9nika.variable)
(catch_formal_parameter
  name: (identifier) @y9nika.variable)
(lambda_expression
  parameters: (identifier) @y9nika.variable)

(line_comment) @y9nika.marker
(block_comment) @y9nika.marker

[
  "continue"
  "break"
  "yield"
] @y9nika.marker

