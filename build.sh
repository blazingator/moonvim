#!/bin/bash

PROJ_DIR=$HOME/Documentos/moonvim
SRC_DIR=$PROJ_DIR/moon
LUA_DIR=$PROJ_DIR/lua
PLUG_CONFIG=$LUA_DIR/plug-config
LSP_CONFIG=$LUA_DIR/lsp

# Compila os arquivos .moon
moonc $SRC_DIR
#moonc $SRC_DIR/plug-config

DIRS=$(ls -l $SRC_DIR | grep drw | awk '{print $9}')

## Verifica se as subpastas existem dentro de LUA_DIR
if [ ! -d $LUA_DIR ]; then
  mkdir $LUA_DIR;
fi
for d in $DIRS; do
  if [ ! -d $LUA_DIR/$d ]; then
    mkdir $LUA_DIR/$d
  fi
done

## Move os arquivos lua para LUA_DIR
mv $SRC_DIR/*.lua $LUA_DIR
for d in $DIRS; do
  mv $SRC_DIR/$d/*.lua $LUA_DIR/$d
done
