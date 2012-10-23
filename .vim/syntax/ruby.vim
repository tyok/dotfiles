syn match rubyParen "("
syn match rubyParen ")"
syn match rubyParen "{"
syn match rubyParen "}"
syn match rubyParen "\["
syn match rubyParen "\]"
syn match rubyDot "\."
syn match rubyHashRocket "=>"

hi def link rubyParen Delimiter
hi def link rubyDot Delimiter
hi def link rubyHashRocket Delimiter
