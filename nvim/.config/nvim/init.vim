"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              basic configuration                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set cursorline
set cursorcolumn
set number relativenumber
set shiftwidth=4
set tabstop=4
set noexpandtab
set softtabstop=0
set ignorecase
set smartcase
set nohlsearch
set wrap linebreak
set noshowmode
set wildmenu
set wildmode=list:longest

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  key maps                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ' '

inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   plugins                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'hashivim/vim-terraform'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

set termguicolors
set background=dark
colorscheme gruvbox

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
	let g:airline_symbols.maxlinenr = ''
endif

" set Jenkinsfile type to groovy
augroup set_jenkins_groovy
au!
au BufNewFile,BufRead *.jenkinsfile,*.Jenkinsfile,Jenkinsfile,jenkinsfile setf groovy
augroup END

lua require'lsp-config'
