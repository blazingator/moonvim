import fn, api, cmd from vim

exec = api.nvim_command

install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob install_path) > 0
  exec '!git clone https://github.com/wbthomason/packer.nvim ' .. install_path
  exec 'packadd packer.nvim'

require_plugin = (plugin) ->
  plugin_prefix = fn.stdpath('data') .. '/site/pack/packer/opt/'

  plugin_path = plugin_prefix .. plugin .. '/'

  ok, err, code = os.rename(plugin_path, plugin_path)

  if not ok
    if code == 13
      return true

  if ok
    cmd 'packadd ' .. plugin

  ok, err, code

cmd 'autocmd BufWritePost plugins.moon PackerCompile' -- Autocompilação se houver mudanças no arquivo plugins.moon
cmd 'autocmd FileType moon packadd moonscript-vim'

packer = require 'packer'

return packer.startup(
  (use) ->
    use 'wbthomason/packer.nvim'

    use {'neovim/nvim-lspconfig', opt: true}
    use {'kabouzeid/nvim-lspinstall', opt: true}

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run: ':TSUpdate'}

    -- Explorador de arquivos
    use 'kyazdani42/nvim-tree.lua'

    use {'lewis6991/gitsigns.nvim', opt: true}

    -- sintaxe
    use {'leafo/moonscript-vim', opt: true}

    -- Colorscheme
    use {'shaunsingh/nord.nvim', opt: true}

    require_plugin 'nvim-lspconfig'
    require_plugin 'nvim-lspinstall'
    require_plugin 'nvim-treesitter'
    require_plugin 'nvim-tree.lua'
    require_plugin 'nord.nvim'
)
