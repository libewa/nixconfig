set mouse=a
set shiftwidth=2
set foldcolumn=1
set foldmethod=indent

set foldlevelstart=99
set lcs=tab:>->,lead:·,trail:·,extends:>,precedes:<,nbsp:¦

map <C-p> :NvimTreeToggle<CR>
map <C-d> :NvimTreeFocus<CR>
map <C-Space> :Telescope<CR>
map <C-S-Space> :Telescope<Space>commands<CR>
map <C-y> :q<CR>
map <C-s> :w<CR>
map <C-ü> :terminal