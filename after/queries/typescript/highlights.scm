;; vim: ft=query
;; extends

(interface_declaration
  name: (type_identifier) @y9nika.definition)

(method_definition
  name: (property_identifier) @y9nika.definition)

(function_declaration
  name: (identifier) @y9nika.definition)

(variable_declarator
  name: (identifier) @y9nika.definition
  value: (arrow_function))

(type_alias_declaration
  name: (type_identifier) @y9nika.definition)

(undefined) @y9nika.local
