;; vim: ft=query
;; extends

(object_declaration
  (type_identifier) @y9nika.definition)

(parameter
  (simple_identifier) @y9nika.local)

(variable_declaration
  (simple_identifier) @y9nika.local)

(class_parameter
  (simple_identifier) @y9nika.local)

(string_literal) @y9nika.local

(boolean_literal) @y9nika.local
(integer_literal) @y9nika.local
(long_literal) @y9nika.local
(unsigned_literal) @y9nika.local
(real_literal) @y9nika.local

(line_comment) @Comment
(multiline_comment) @Comment

(function_declaration
  (simple_identifier) @y9nika.definition)

(class_declaration
  (type_identifier) @y9nika.definition)

