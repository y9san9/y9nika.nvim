;; vim: ft=query
;; extends

(variable_declaration
  (assignment_statement
    (variable_list
      name: (identifier) @y9nika.variable)))

(variable_declaration
  (variable_list
    name: (identifier) @y9nika.variable))

(function_declaration
  name: (identifier) @y9nika.declaration)

(assignment_statement
  (variable_list
    name: (dot_index_expression
            field: (identifier) @y9nika.declaration))
  (expression_list
    value: (function_definition)))

(assignment_statement
  (variable_list
    name: (identifier) @y9nika.declaration)
  (expression_list
    value: (function_definition)))

(function_declaration
  name: (dot_index_expression
          field: (identifier) @y9nika.declaration))
