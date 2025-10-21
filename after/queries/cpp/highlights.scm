;; vim: ft=query
;; extends

(function_declarator
  declarator: (qualified_identifier
                name: (identifier) @y9nika.declaration))

;; TODO there's probably a lot of duplicates here

(function_definition
  declarator: (function_declarator
                declarator: (destructor_name (identifier) @y9nika.declaration)))

(function_definition
  declarator: (function_declarator
                declarator: (field_identifier) @y9nika.declaration))

(function_definition
  declarator: (function_declarator
                declarator: (qualified_identifier
                              name: (destructor_name
                                      (identifier) @y9nika.declaration))))

(declaration
  declarator: (function_declarator
                declarator:
                  (destructor_name (identifier) @y9nika.declaration)))

(field_declaration
  declarator: (function_declarator
                declarator: (field_identifier) @y9nika.declaration))

(field_declaration
  declarator: (pointer_declarator
                declarator: (function_declarator
                              declarator:
                                (field_identifier) @y9nika.declaration)))

(function_declarator
 declarator: (field_identifier) @y9nika.declaration)

(function_declarator
     declarator: (qualified_identifier
                   name: (identifier) @y9nika.declaration))
(function_declarator
     declarator: (qualified_identifier
                   name: (qualified_identifier
                           name: (identifier) @y9nika.declaration)))
((function_declarator
     declarator: (qualified_identifier
                   name: (identifier) @y9nika.declaration))
 (#lua-match? @y9nika.declaration "^[A-Z]"))

(labeled_statement
  label: (statement_identifier) @y9nika.declaration)

(type_definition
  declarator: (type_identifier) @y9nika.declaration)

(preproc_def
  name: (identifier) @y9nika.declaration)

(class_specifier
  name: (type_identifier) @y9nika.declaration)

(struct_specifier
  name: (type_identifier) @y9nika.declaration)
