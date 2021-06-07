export DATA_PATH = vim.fn.stdpath('data')

export O ={
  extras: false
  treesitter: {
    ensure_installed: "all"
    ignore_install: {"haskell","dart"}
    highlight: enabled: true
    playground: enabled: true
    rainbow: enabled: false
  }
}
