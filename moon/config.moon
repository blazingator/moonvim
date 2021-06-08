import cmd, g from vim

cmd 'autocmd BufNewFile,BufRead *.moon set ft=moon'
cmd 'autocmd VimEnter * packadd barbar.nvim'

-- Colorscheme
vim.cmd[[colorscheme tokyonight]]
-- g.tokyonight_style = 'night'
g.tokyonight_italic_keywords = false

-- NvimTree
g.nvim_tree_follow = 1
g.nvim_tree_icons =
  symlink: '',
  git: {unstaged: "", staged: "✓", unmerged: "", renamed: "➜", untracked: ""},

-- Vim matchup
g.matchup_matchpren_offscreen = method: 'popup'

with vim
  with .o
    .clipboard = 'unnamedplus' -- área de transferência
    .guifont = 'NotoSansMono Nerd Font:h12' -- fonte
    .mouse = 'a' -- habilita o uso do mouse
    .title = true -- titulo da janela
    .cmdheight = 2
    .fileencoding = 'utf-8' -- codificação dos arquivos
    .termguicolors = true -- necessário para o tema de cores
    .splitbelow = true -- split sempre em baixo
    .splitright = true -- vsplit sempre a direita
    .timeoutlen = 500
  with .wo
    .number = true -- numero das linhas
  -- indentação
  .cmd 'set ts=2'
  .cmd 'set sw=2'
  .cmd 'set expandtab'
