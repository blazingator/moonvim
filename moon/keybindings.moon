import cmd from vim
import nvim_set_keymap from vim.api

nvim_set_keymap 'n', '<c-s>', ':w<CR>', {noremap: true, silent: false}

nvim_set_keymap 'n', 'q',':q<CR>', {noremap: true,silent: false}

cmd [[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]]

cmd [[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Left>  :vertical resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize +2<CR>
]]

-- Mover linha/bloco de texto no modo visual
nvim_set_keymap 'x', 'K', ':move \'<-2<CR>gv-gv', {noremap: true, silent: true}
nvim_set_keymap 'x', 'J', ':move \'>+1<CR>gv-gv', {noremap: true, silent: true}
