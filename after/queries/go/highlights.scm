;; vim: ft=query
;; extends

(package_clause
  (package_identifier) @y9nika.declaration)

(const_declaration
  (const_spec
    name: (identifier) @y9nika.declaration))

(function_declaration
  name: (identifier) @y9nika.declaration)

(method_declaration
  name: (field_identifier) @y9nika.declaration)
