;; vim: ft=query
;; extends

(package_clause
  (package_identifier) @y9nika.declaration)

(function_declaration
  name: (identifier) @y9nika.declaration)

(method_declaration
  name: (field_identifier) @y9nika.declaration)

(type_declaration
  (type_spec
    name: (type_identifier) @y9nika.declaration))

(var_declaration
  (var_spec
    name: (identifier) @y9nika.variable))

(var_declaration
  (var_spec_list
    (var_spec
      name: (identifier) @y9nika.variable)))

(short_var_declaration
  left: (expression_list
    (identifier) @y9nika.variable))

(const_declaration
  (const_spec
    name: (identifier) @y9nika.variable))

(field_declaration
    name: (field_identifier) @y9nika.variable)

(parameter_list
  (parameter_declaration
    name: (identifier) @y9nika.variable))
