;; vim: ft=query
;; extends

(function_definition
  name: (word) @y9nika.declaration)

(command
  name: (word) @function.builtin
  (#match? @function.builtin "^set$")
  argument: (word) @parameter
  (#any-of? @parameter "-g" "--global" "-U" "--universal" "-x" "--export")
  argument: (word) @y9nika.declaration
  argument: (_))

