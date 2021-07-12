require'nvim-treesitter.configs'.setup {
  ensure_installed: O.treesitter.ensure_installed
  ignore_install: O.treesitter.ignore_install
  matchup:
    enable: true
  highlight:
    enable: O.treesitter.highlight.enabled
  context_commentstring:
    enable: true
    config:
      css: '// %s'
  indent:
    enable: {"javascriptreact"}
  autotag:
    enable: true
}
