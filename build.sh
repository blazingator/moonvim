#!/bin/bash

PROJ_DIR=$HOME/Documentos/moonvim
SRC_DIR=$PROJ_DIR/moon
LUA_DIR=$PROJ_DIR/lua
PLUG_CONFIG=$LUA_DIR/plug-config
LSP_CONFIG=$LUA_DIR/lsp

moonc $SRC_DIR
moonc $SRC_DIR/plug-config

if [ ! -d $LUA_DIR ]; then
  mkdir $LUA_DIR;
fi
if [ ! -d $LUA_DIR/plug-config ]; then
  mkdir $LUA_DIR/plug-config;
fi
if [ ! -d $LSP_CONFIG ]; then
  mkdir $LUA_DIR/lsp
fi
  
mv $SRC_DIR/*.lua $LUA_DIR

mv $SRC_DIR/plug-config/*.lua $LUA_DIR/plug-config 
mv $SRC_DIR/lsp/*.lua $LUA_DIR/lsp
