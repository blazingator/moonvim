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

  return ok, err, code

cmd 'autocmd BufWritePost plugins.moon PackerCompile' -- Autocompilação se houver mudanças no arquivo plugins.moon
cmd 'autocmd FileType moon packadd moonscript-vim'

packer = require 'packer'
use = packer.use
packer.startup ->
  use 'wbthomason/packer.nvim'

  -- LSP plugins
  use {'neovim/nvim-lspconfig', opt: true}
  use {'kabouzeid/nvim-lspinstall', opt: true}

  -- Autocomplete
  use {'hrsh7th/nvim-compe', opt: true}
  use {'hrsh7th/vim-vsnip', opt: true}
  use {'rafamadriz/friendly-snippets', opt: true}

  use {'nvim-lua/plenary.nvim', opt: true}
  use {'nvim-lua/popup.nvim', opt: true}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run: ':TSUpdate'}
  use {'windwp/nvim-ts-autotag', opt: true}
  use {'andymass/vim-matchup', opt: true}

  -- Explorador de arquivos
  use 'kyazdani42/nvim-tree.lua'

  use {'windwp/nvim-autopairs', opt: true}
  use {'terrortylor/nvim-comment', opt: true}

  use {'lewis6991/gitsigns.nvim', opt: true}

  -- Keymappings
  use {'folke/which-key.nvim', opt: true}

  -- sintaxe
  use {'leafo/moonscript-vim', ft: 'moon'}

  -- Colorscheme
  use {'shaunsingh/nord.nvim', opt: true}

  -- devicons
  use {'kyazdani42/nvim-web-devicons', opt: true}

  -- Statusline e abas
  use {'glepnir/galaxyline.nvim', opt: true}
  use {'romgrk/barbar.nvim', opt: true}

  require_plugin 'nvim-lspconfig'
  require_plugin 'nvim-lspinstall'
  require_plugin 'friendly-snippets'
  require_plugin 'popup.nvim'
  require_plugin 'plenary.nvim'
  require_plugin 'nvim-compe'
  require_plugin 'vim-vsnip'
  require_plugin 'nvim-treesitter'
  require_plugin 'nvim-ts-autotag'
  require_plugin 'vim-matchup'
  require_plugin 'nvim-tree.lua'
  require_plugin 'nvim-autopairs'
  require_plugin 'nvim-comment'
  require_plugin 'gitsigns.nvim'
  require_plugin 'which-key.nvim'
  require_plugin 'nord.nvim'
  require_plugin 'nvim-web-devicons'
  require_plugin 'galaxyline.nvim'
  --require_plugin 'barbar.nvim'
