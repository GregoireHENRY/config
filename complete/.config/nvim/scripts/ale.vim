nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>
nnoremap ]A :ALEFirst<CR>
nnoremap [A :ALELast<CR>
let g:ale_disable_lsp = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {'rust': ['cargo', 'clippy'], 'markdown': ['mdl'], 'cpp': ['clang'], 'c': [], 'matlab': ['mlint'], 'python': ['flake8', 'mypy'], 'tex':['chktex'], 'vim': ['vimls']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'c': ['clang-format'], 'rust': ['rustfmt'], 'python': ['black', 'isort']}
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_clippy_options = ''
let g:ale_c_parse_makefile = 1
let g:ale_c_clangformat_options = '--style=LLVM'
let g:ale_python_mypy_options = '--ignore-missing-imports --follow-imports=silent --show-column-numbers --strict --cache-dir=/dev/null'
let g:ale_python_isort_options = '--multi-line-output=3 --include-trailing-comma --force-grid-wrap=0 --use-parentheses'
