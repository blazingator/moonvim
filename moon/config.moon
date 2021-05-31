import cmd, g from vim

cmd 'autocmd BufNewFile,BufRead *.moon set ft=moon'
cmd 'autocmd VimEnter * packadd barbar.nvim'

-- Nord config
g.nord_contrast = true
g.nord_borders = false
--g.nord_disable_background = false

-- NvimTree
g.nvim_tree_follow = 1
g.nvim_tree_icons =
  symlink: '',
  git: {unstaged: "", staged: "✓", unmerged: "", renamed: "➜", untracked: ""},

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
  .cmd 'set ts=2'
  .cmd 'set sw=2'
  .cmd 'set expandtab'
