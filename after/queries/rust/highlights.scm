;; vim: ft=query
;; extends

(struct_item
  name: (type_identifier) @y9nika.declaration)
(enum_item
  name: (type_identifier) @y9nika.declaration)

(impl_item
  type: (type_identifier) @y9nika.declaration)

(impl_item
  type: (scoped_type_identifier
          path: (scoped_identifier)
          name: (type_identifier) @y9nika.declaration))

(impl_item
  body: (declaration_list
          (type_item
            name: (type_identifier) @y9nika.declaration)))
(impl_item
  type: (generic_type
          type: (type_identifier) @y9nika.declaration))

(trait_item
  name: (type_identifier) @y9nika.declaration)

(trait_item
  body: (declaration_list
          (associated_type
            name: (type_identifier) @y9nika.declaration)))

(trait_item
  body: (declaration_list
          (function_signature_item
            name: (identifier) @y9nika.declaration)))

(function_item
  name: (identifier) @y9nika.declaration)

(macro_definition
  name: (identifier) @y9nika.declaration)

(for_expression
  "in" @y9nika.muted)
(type_arguments
  "<" @y9nika.muted)
(type_arguments
  ">" @y9nika.muted)
(type_parameters
  "<" @y9nika.muted)
(type_parameters
  ">" @y9nika.muted)
