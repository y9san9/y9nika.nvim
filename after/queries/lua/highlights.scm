;; vim: ft=query
;; extends

(function_declaration
  name: (identifier) @y9nika.definition)

(assignment_statement
  (variable_list
    name: (dot_index_expression
            field: (identifier) @y9nika.definition))
  (expression_list
    value: (function_definition)))

(assignment_statement
  (variable_list
    name: (identifier) @y9nika.definition)
  (expression_list
    value: (function_definition)))

(function_declaration
  name: (dot_index_expression
          field: (identifier) @y9nika.definition))

(table_constructor
  (field name: (identifier) @y9nika.local))
