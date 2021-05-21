import cmd, g from vim

cmd 'autocmd BufNewFile,BufRead *.moon set ft=moon'

-- Example config in lua
g.nord_contrast = true
g.nord_borders = false
g.nord_disable_background = true

-- Load the colorscheme
import set from require 'nord'
set!

with vim
  with .o
    .clipboard = 'unnamedplus'
    .guifont = 'NotoSansMono Nerd Font:h12'
    .mouse = 'a'
    .title = true
    .cmdheight = 2
    .fileencoding = 'utf-8'
    .termguicolors = true
    .splitbelow = true
    .splitright = true
  with .wo
    .number = true
