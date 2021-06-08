![bann][banner]

Minha Configuração do Neovim nightly usando [Moonscript](http://moonscript.org)

Uma adpatação do [LunarVim](https://github.com/ChristianChiarulli/LunarVim)

# Screenshot
![shot1][shot]

# O que tem nessa configuração
- [Neovim 0.5.0+](https://github.com/neovim/neovim)
- Os arquivos de configuração escritos em Moonscript e compilados para Lua
- [Packer.nvim](https://github.com/wbthomason/packer.nvim) como gerenciador de plugins

# Como usar
Tenha certerza que está usando a versão nightly do [Neovim](https://github.com/neovim/neovim/releases/tag/nightly) e tenha o interpretador Lua 5.1 e o [Luarocks](https://luarocks.org) instalado no seu sistema


Tendo o luarocks utilizavel você pode instalar o compilador do Moonscript:
```sh
  luarocks install moonscript # talvez precise de executar como sudo
```

Em seguida:
```
  git clone https://github.com/blazingator/moonvim ~/Documentos/moonvim
  ln -s ~/Documentos/moonvim ~/.config/nvim
  # e dentro da pasta de configuração
  ./build.sh
```

# Personalizando a configurção
Se você quiser perzonalizar essa configuração aqui está alguns links

- [Nvim-LuaGuide](https://github.com/npxbr/nvim-lua-guide)
- [Documentação de Lua](https://www.lua.org/manual/5.1/)
- [Documentação do Moonscript](https://moonscript.org/reference)
- [LunarVim](https://github.com/ChristianChiarulli/LunarVim) que foi de onde eu peguei inspirações

[shot]: shot.png
[banner]: banner.png
