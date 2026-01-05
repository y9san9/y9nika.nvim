# TODO

That is a TODO-list for adding a new language support. It may be incomplete, but
that's better than nothing.

## @y9nika.variable

Treesitter does not have a builtin group for variables/parameters declaration.
Meaning that variable usages and parameters usages are highlighted the same as
declarations when using builtin highlight group.

To mitigate this, by default y9nika disables coloring of any
variables/parameters and a custom query needs to be implemented for a language.

Constants like numbers, booleans, strings are highlighted with @y9nika.variable
by default, but you may need to implement queries for keywords like 'null',
'undefined', etc.

## @y9nika.declaration

Declarations are class, interface, function names and other stuff that has its
place in global namespace and that is other than properties/variables. There is
the same problem, though. Treesitter doesn't distinguish between declaration and
usage. So you need to implement queries for these names manually.

## @y9nika.marker

By design these are highlight groups that needs to attract attention. Namely,
that is usually comments and control flow keywords (`return`, `continue`,
`break`). Comments and `return` highlighted fine with builtin queries, but
support for `continue` and `break` needs to be implemented manually since they
all live under the same section for loops.
