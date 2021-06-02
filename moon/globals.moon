export DATA_PATH = vim.fn.stdpath('data')

export O ={
  treesitter: {
    ensure_installed: "all"
    ignore_install: {"haskel","dart"}
    highlight: enabled: true
    playground: enabled: true
    rainbow: enabled: false
  }
}
