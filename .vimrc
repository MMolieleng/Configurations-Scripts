set showmode
set smarttab
set number
set mouse=a
set visualbell
set noerrorbells
set autoindent
set copyindent
syntax on
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
set colorcolumn=80
match OverLength /\%81v.\+/
