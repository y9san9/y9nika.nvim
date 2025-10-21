;; vim: ft=query
;; extends

(function_declarator
  declarator: (identifier) @y9nika.definition)
(preproc_function_def
  name: (identifier) @y9nika.definition)

(type_definition
  type: (struct_specifier
          name: (type_identifier) @y9nika.definition)
  declarator: (type_identifier) @y9nika.definition)

(type_definition
  type: (struct_specifier)
  declarator: (type_identifier) @y9nika.definition)

(type_definition
  type: (enum_specifier)
  declarator: (type_identifier) @y9nika.definition)
