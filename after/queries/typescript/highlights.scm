;; vim: ft=query
;; extends

;; Declarations

(interface_declaration
  name: (type_identifier) @y9nika.declaration)

(class_declaration
  name: (type_identifier) @y9nika.declaration)

(type_alias_declaration
  name: (type_identifier) @y9nika.declaration)

(enum_declaration
  name: (identifier) @y9nika.declaration)

(function_declaration
  name: (identifier) @y9nika.declaration)

(method_definition
  name: (property_identifier) @y9nika.declaration)

(method_signature
  name: (property_identifier) @y9nika.declaration)

(variable_declarator
  name: (identifier) @y9nika.declaration
  value: [
    (arrow_function)
    (function_expression)
  ])

;; Variables

(variable_declarator
  name: (identifier) @y9nika.variable)

(variable_declarator
  name: (array_pattern
    (identifier) @y9nika.variable))

(variable_declarator
  name: (object_pattern
    [
      (shorthand_property_identifier_pattern)
      (pair_pattern
        key: (property_identifier))
    ] @y9nika.variable))

(property_signature
  name: (property_identifier) @y9nika.variable)

(public_field_definition
  name: (property_identifier) @y9nika.variable)

(method_signature
  parameters: (formal_parameters
    (required_parameter
      pattern: (identifier) @y9nika.variable)))

(method_signature
  parameters: (formal_parameters
    (optional_parameter
      pattern: (identifier) @y9nika.variable)))

[
  (null)
  (undefined)
] @y9nika.variable
