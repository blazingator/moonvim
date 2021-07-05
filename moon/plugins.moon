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
  use {'folke/trouble.nvim', opt: true}

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
  use {'JoosepAlviste/nvim-ts-context-commentstring', opt: true}

  -- Explorador de arquivos
  use 'kyazdani42/nvim-tree.lua'
  -- use {'ahmedkhalf/lsp-rooter.nvim', opt: true}

  -- Terminal
  -- use {'numToStr/FTerm.nvim', opt: true}
  use {'voldikss/vim-floaterm', opt: true}

  -- Ferramentas para edição
  use {'windwp/nvim-autopairs', opt: true}
  use {'terrortylor/nvim-comment', opt: true}
  --use {'Yggdroot/indentLine', opt: true}
  use {'lukas-reineke/indent-blankline.nvim', opt: true, branch: 'lua'}
  
  -- Git Signs
  use {'lewis6991/gitsigns.nvim', opt: true}
  -- Markdown preview
  use {'iamcco/markdown-preview.nvim', run: 'cd app && npm install', opt: true}

  -- Keymappings
  use {'folke/which-key.nvim', opt: true}

  -- sintaxe
  use {'leafo/moonscript-vim', ft: 'moon'}

  -- Colorizer.lua
  use {'norcalli/nvim-colorizer.lua', opt: true}

  -- Colorscheme
  --use {'shaunsingh/nord.nvim', opt: true}
  use {'folke/tokyonight.nvim', opt: true}

  -- devicons
  use {'kyazdani42/nvim-web-devicons', opt: true}

  -- Statusline e abas
  use {'glepnir/galaxyline.nvim', opt: true}
  use {'romgrk/barbar.nvim', opt: true}

  require_plugin 'nvim-lspconfig'
  require_plugin 'nvim-lspinstall'
  require_plugin 'trouble.nvim'
  require_plugin 'friendly-snippets'
  require_plugin 'popup.nvim'
  require_plugin 'plenary.nvim'
  require_plugin 'nvim-compe'
  require_plugin 'vim-vsnip'
  require_plugin 'nvim-treesitter'
  require_plugin 'nvim-ts-autotag'
  require_plugin 'vim-matchup'
  require_plugin 'nvim-tree.lua'
  -- require_plugin 'ahmedkhalf/lsp-rooter.nvim'
  require_plugin 'vim-floaterm'
  require_plugin 'nvim-autopairs'
  require_plugin 'nvim-comment'
  require_plugin 'indent-blankline.nvim'
  require_plugin 'nvim-ts-context-commentstring'
  require_plugin 'gitsigns.nvim'
  require_plugin 'markdown-preview.nvim'
  require_plugin 'which-key.nvim'
  require_plugin 'tokyonight.nvim'
  require_plugin 'nvim-colorizer.lua'
  require_plugin 'nvim-web-devicons'
  require_plugin 'galaxyline.nvim'
  --require_plugin 'barbar.nvim'

  if O.extras
    use {'nacro90/numb.nvim', opt: true}
    use {'windwp/nivm-spectre', opt: true}
    -- folke/todo-comments.nvim
    -- gennaro-tedesco/nvim-jq
    -- TimUntersberger/neogit
    -- folke/lsp-colors.nvim
    -- simrat39/symbols-outline.nvim

    -- Git
    -- use {'tpope/vim-fugitive', opt = true}
    -- use {'tpope/vim-rhubarb', opt = true}
    -- pwntester/octo.nvim

    -- Easily Create Gists
    -- use {'mattn/vim-gist', opt = true}
    -- use {'mattn/webapi-vim', opt = true} 
