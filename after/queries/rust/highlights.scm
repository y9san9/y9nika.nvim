;; vim: ft=query
;; extends

(struct_item
  name: (type_identifier) @y9nika.definition)
(enum_item
  name: (type_identifier) @y9nika.definition)

(impl_item
  type: (type_identifier) @y9nika.definition)

(impl_item
  type: (scoped_type_identifier
          path: (scoped_identifier)
          name: (type_identifier) @y9nika.definition))

(impl_item
  body: (declaration_list
          (type_item
            name: (type_identifier) @y9nika.definition)))
(impl_item
  type: (generic_type
          type: (type_identifier) @y9nika.definition))

(trait_item
  name: (type_identifier) @y9nika.definition)

(trait_item
  body: (declaration_list
          (associated_type
            name: (type_identifier) @y9nika.definition)))

(trait_item
  body: (declaration_list
          (function_signature_item
            name: (identifier) @y9nika.definition)))

(function_item
  name: (identifier) @y9nika.definition)

(macro_definition
  name: (identifier) @y9nika.definition)

(for_expression
  "in" @y9nika.punctuation)
(type_arguments
  "<" @y9nika.punctuation)
(type_arguments
  ">" @y9nika.punctuation)
(type_parameters
  "<" @y9nika.punctuation)
(type_parameters
  ">" @y9nika.punctuation)
