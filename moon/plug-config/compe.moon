vim.o.completeopt = 'menuone,noselect'

require'compe'.setup {
  enabled: true
  autocomplete: true
  debug: false
  min_length: 1
  preselect: 'enable'
  throttle_time: 80
  source_timeout: 200
  incomplete_delay: 400
  max_abbr_width: 100
  max_kind_width: 100
  max_menu_width: 100
  documentation: true

  source:
    path: kind: "   (Path)"
    buffer: kind: "   (Buffer)"
    calc: kind: "   (Calc)"
    nvim_lsp: kind: "   (LSP)"
    nvim_lua: false
    vsnip: kind: "   (Snippet)"
    ultisnips: false
    spell: kind: "   (Spell)"
    tags: false
    vim_dadbod_completion: true
    emoji: kind: " ﲃ  (Emoji)", filetypes: {"markdown", "text"}
}

t = (str) ->
  return vim.api.nvim_replace_termcodes str, true, true, true

check_back_space = ->
  col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.')\sub(col,col)\match '%s'
    return true
  else
    return false


_G.tab_complete = ->
  if vim.fn.pumvisible! == 1
    return t '<C-n>'
  elseif vim.fn.call('vsnip#available', {1}) == 1
    return t '<Plug>(vsnip-expand-or-jump)'
  elseif check_back_space!
    return t '<Tab>'
  else
    return vim.fn['compe#complete']!
_G.s_tab_complete = ->
  if vim.fn.pumvisible! == 1
    return t '<C-p>'
  elseif vim.fn.call('vsnip#jumpable', {-1}) == 1
    return t '<Plug>(vsnip-jump-prev)'
  else
    return t '<S-Tab>'

-- Teclas de atalho
with vim.api
  .nvim_set_keymap 'i', '<Tab>', 'v:lua.tab_complete()', {expr: true}
  .nvim_set_keymap 's', '<Tab>', 'v:lua.tab_complete()', {expr: true}
  .nvim_set_keymap 'i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr: true}
  .nvim_set_keymap 's', '<S-Tab>', 'v:lua.s_tab_complete()', {expr: true}
  .nvim_set_keymap 'i', '<CR>', 'compe#confirm(\'<CR>\')', {expr: true, silent: true, noremap: true}
  .nvim_set_keymap 'i', '<C-Space>', 'compe#complete()', {expr: true, silent: true, noremap: true}
  .nvim_set_keymap 'i', '<C-e>', 'compe#close(\'<C-e>\')', {expr: true, silent: true, noremap: true}
  .nvim_set_keymap 'i', '<C-f>', 'compe#scroll({"delta": -4})', {expr: true, silent: true, noremap: true}
  .nvim_set_keymap 'i', '<C-d>', 'compe#scroll({"delta": -4})', {expr: true, silent: true, noremap: true}
