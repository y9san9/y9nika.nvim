; @y9nika.declaration

(function_definition
  (signature
    (typed_expression
      (call_expression
        (identifier) @y9nika.declaration)))

(assignment
  left: (identifier) @y9nika.declaration
  right: (function_definition))

(parametrized_type_expression
  (identifier) @y9nika.declaration)

(typed_expression
  (identifier) @y9nika.declaration)

; @y9nika.variable

(const_statement
  (assignment
    (identifier) @y9nika.variable))

(argument_list
  (identifier) @y9nika.variable)

(for_binding
  (identifier) @y9nika.variable)

(comprehension_expression
  (identifier) @y9nika.variable)

(assignment
  (identifier) @y9nika.variable)

(open_tuple
  (identifier) @y9nika.variable)

(string_interpolation
  (identifier) @y9nika.variable)

((identifier) @y9nika.variable
 (#eq? @y9nika.variable "nothing"))


; @y9nika.marker

(line_comment) @y9nika.marker

[
 (return_statement)
 (break_statement)
 (continue_statement)
] @y9nika.marker
