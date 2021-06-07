import cmd from vim
import nvim_set_keymap from vim.api

-- atalhos para o barbar(bufferline)
nvim_set_keymap 'n', '<TAB>', ':BufferNext<CR>', {noremap: true, silent: true}
nvim_set_keymap 'n', '<S-TAB>', ':BufferPrevious<CR>', {noremap: true, silent: true}
nvim_set_keymap 'n', '<S-x>', ':BufferClose<CR>', {noremap: true, silent: true}

-- Salva o buffer atual
nvim_set_keymap 'n', '<c-s>', ':w<CR>', {noremap: true, silent: false}
-- Fecha o buffer atual
nvim_set_keymap 'n', 'q',':q<CR>', {noremap: true, silent: true}

-- Terminal
nvim_set_keymap 'n', '<c-t>', '<cmd>lua require("FTerm").open()<CR>', {noremap: true, silent: true}

-- Navegação de janela de Terminal
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

-- Redimensionar janela
cmd [[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Left>  :vertical resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize +2<CR>
]]

-- Mover linha/bloco de texto no modo visual
nvim_set_keymap 'x', 'K', ':move \'<-2<CR>gv-gv', {noremap: true, silent: true}
nvim_set_keymap 'x', 'J', ':move \'>+1<CR>gv-gv', {noremap: true, silent: true}
