;; vim: ft=query
;; extends

(function_declarator
  declarator: (qualified_identifier
                name: (identifier) @y9nika.definition))

;; TODO there's probably a lot of duplicates here

(function_definition
  declarator: (function_declarator
                declarator: (destructor_name (identifier) @y9nika.definition)))

(function_definition
  declarator: (function_declarator
                declarator: (field_identifier) @y9nika.definition))

(function_definition
  declarator: (function_declarator
                declarator: (qualified_identifier
                              name: (destructor_name
                                      (identifier) @y9nika.definition))))

(declaration
  declarator: (function_declarator
                declarator:
                  (destructor_name (identifier) @y9nika.definition)))

(field_declaration
  declarator: (function_declarator
                declarator: (field_identifier) @y9nika.definition))

(field_declaration
  declarator: (pointer_declarator
                declarator: (function_declarator
                              declarator:
                                (field_identifier) @y9nika.definition)))

(function_declarator
 declarator: (field_identifier) @y9nika.definition)

(function_declarator
     declarator: (qualified_identifier
                   name: (identifier) @y9nika.definition))
(function_declarator
     declarator: (qualified_identifier
                   name: (qualified_identifier
                           name: (identifier) @y9nika.definition)))
((function_declarator
     declarator: (qualified_identifier
                   name: (identifier) @y9nika.definition))
 (#lua-match? @y9nika.definition "^[A-Z]"))

(labeled_statement
  label: (statement_identifier) @y9nika.definition)

(type_definition
  declarator: (type_identifier) @y9nika.definition)

(preproc_def
  name: (identifier) @y9nika.definition)

(class_specifier
  name: (type_identifier) @y9nika.definition)

(struct_specifier
  name: (type_identifier) @y9nika.definition)
