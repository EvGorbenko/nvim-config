let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['eslint', 'tsserver', 'prettier'],
\   'html': []
\  }

let g:ale_linter_aliases = {
\  'typescript.tsx': 'typescript',
\  'typescriptreact': 'typescript'
\  }

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': ['eslint'],
\   'typescript': ['tslint', 'prettier'],
\   'typescriptreact': ['tslint', 'prettier'],
\   'typescript.tsx': ['tslint', 'prettier']
\   }

nmap <leader>d <Plug>(ale_fix)

" Use a slightly slimmer error pointer
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F

let g:ale_fix_on_save = 1

" Use CTRL-k and CTRL-j to navigate errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
