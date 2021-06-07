--import setup from require "which-key"
import g from vim
import nvim_set_keymap from vim.api

require'which-key'.setup {
  plugins:
    marks: true
    registers: true
    presets:
      operators: true -- adc. ajuada para operadores como d, y, ... e os registra para motion/text object
      motions: true -- adc. ajuda para movimentos
      text_objects: true -- ajuda para text objects provocado depois de entrar um operador
      windows: true -- teclas padrão para <c-w>
      nav: true -- teclas mistas para trabalhar com janelas
      z: true -- teclas para folds, digitação e outros prefixado por z
      g: true -- teclas para prefixado com g
  -- adc. operadores que irão provocar motion e text object completion
  -- para habilitar todos operadores nativos, defina o preset/operators acima
  operators: gc: 'Comments'
  key_labels:
    -- sobrescreve a etiqueta para mostrar algumas teclas. Não afeta WK de outra forma
    ["<space>"]: 'SPC'
    ["<cr>"]: 'RET'
    ["<tab>"]: 'TAB'
  icons:
    breadcrumb: "»" -- simbolo usado na area de linha de comando que mostra sua atual combinação de teclas
    separator: "➜" -- simbolo usado entre uma tecla e sua etiqueta
    group: "+" -- simbolo prefixado a um groupo
  window:
    border: 'none' -- none, single, double, shadow
    position: 'bottom' -- bottom, top
    margin: {1,0,1,0} -- margen extra da janela [top,right,bottom,left]
    padding: {2,2,2,2} -- espaçamento extra no interior da janela [top,right,bottom,left]
  layout:
    height: min: 4, max: 25 -- altura min. e max. das colunas
    width: min: 20, max: 50 -- largura min. e max. das colunas
    spacing: 3 -- espaço entre as colunas
    align: 'left' -- alinha as colunas à esquerda, centro ou direita
  ignore_missing: false -- esconde as teclas que não tem etiqueta
  hidden: { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "} -- esconde o boilerplate de mapeamento
  show_help: true -- mostra ajuda na linha de comando quando o popup esta visivel
  triggers: 'auto' -- configura automaticamente os triggers
  trigger_blacklist:
    -- lista de modo / prefixos que não devem ser indexados pelo WhichKey
    -- isso é mais relevante para teclas que iniciam com um atalho nativo
    -- a maioria das pessoas não precisam alterar isso
    i: {'j', 'k'}
    v: {'j', 'k'}
}

opts =
  mode: 'n'
  prefix: '<leader>'
  buffer: nil -- atalhos globais. Especifique um nº de buffer para teclas locais
  silent: true -- usa `silent` quando criar os atalhos
  noremap: true -- usa `noremap` quando criar os atalhos
  nowait: false -- usa `nowait` quando criar os atalhos

-- Configurar a tecla Leader
nvim_set_keymap 'n', '<Space>', '<NOP>', {noremap: true, silent: true}
g.mapleader = ' '

-- Build moonscript config
getPwd = vim.cmd('pwd')
if getPwd == '/home/vinicius/Documentos/moonvim'
  nvim_set_keymap 'n', '<Leader><F2>', ':!zsh build.sh<CR>', {noremap: true, silent: true}

-- NVimTree
nvim_set_keymap 'n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap: true, silent: true}

-- Comentarios
nvim_set_keymap 'n', '<leader>/', ':CommentToggle<CR>', {noremap: true, silent: true}
nvim_set_keymap 'v', '<leader>/', ':CommentToggle<CR>', {noremap: true, silent: true}

mappings = {
  ["/"]: "Comment"
  ["e"]: "Explorer"
  ["<F2>"]: "Build config"
  d:
    name: "+Diagnostics"
    t: {'<cmd>TroubleToggle<cr>','Toggle Trouble.nvim'}
    w: {'<cmd>TroubleToggle lsp_workspace_diagnostics <cr>','Workspace Diagnostics'}
    d: {'<cmd>TroubleToggle lsp_document_diagnostics<cr>', 'Document Diagnostics'}
    q: {'<cmd>TroubleToggle quickfix<cr>', 'quickfix'}
    l: {'<cmd>TroubleToggle loclist<cr>', 'location list'}
    r: {'<cmd>TroubleToggle lsp_references<cr>', 'references'}
  g:
    name: "+Git"
    j: {"<cmd>NextHunk<cr>","Next hunk"}
    k: {"<cmd>PrevHunk<cr>", "Prev Hunk"}
    p: {"<cmd>PreviewHunk<cr>", "Preview Hunk"}
    r: {"<cmd>ResetHunk<cr>", "Reset Hunk"}
    R: {"<cmd>ResetBuffer<cr>", "Reset Buffer"}
    s: {"<cmd>StageHunk<cr>", "Stage Hunk"}
    u: {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"}
    -- o: {"<cmd>Telescope git_status<cr>", "Open changed file"}
    -- b: {"<cmd>Telescope git_branches<cr>", "Checkout branch"}
    -- c: {"<cmd>Telescope git_commits<cr>", "Checkout commit"}
    -- C: {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"}
  l:
    name: "+LSP"
    -- a: {"<cmd>Lspsaga code_action<cr>", "Code Action"}
    -- A: {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"}
    -- d: {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"}
    -- D: {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"}
    -- f: {"<cmd>LspFormatting<cr>", "Format"}
    i: {"<cmd>LspInfo<cr>", "Info"}
    -- l: {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"}
    -- L: {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"}
    -- p: {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"}
    -- q: {"<cmd>Telescope quickfix<cr>", "Quickfix"}
    -- r: {"<cmd>Lspsaga rename<cr>", "Rename"}
    -- t: {"<cmd>LspTypeDefinition<cr>", "Type Definition"}
    -- x: {"<cmd>cclose<cr>", "Close Quickfix"}
    -- -- s: {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"}
    -- S: {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"}
  t:
    name: "+Terminal"
    n: {"<cmd>lua require('FTerm').open()<cr>", "Open a new Terminal"}
    t: {"<cmd>lua require('FTerm').toggle()<cr>", "Toggle terminal window"}
}

wk = require 'which-key'
wk.register(mappings, opts)
