;; vim: ft=query
;; extends

(interface_declaration
  name: (type_identifier) @y9nika.declaration)

(method_definition
  name: (property_identifier) @y9nika.declaration)

(function_declaration
  name: (identifier) @y9nika.declaration)

(variable_declarator
  name: (identifier) @y9nika.declaration
  value: (arrow_function))

(type_alias_declaration
  name: (type_identifier) @y9nika.declaration)

(undefined) @y9nika.variable
