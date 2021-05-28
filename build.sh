#!/bin/sh

PROJ_DIR=$HOME/Documentos/moonvim
SRC_DIR=$PROJ_DIR/moon
LUA_DIR=$PROJ_DIR/lua
PLUG_CONFIG=$LUA_DIR/plug-config

moonc moon
moonc moon/plug-config

if [ ! -d $LUA_DIR ]; then
  mkdir $LUA_DIR;
fi
if [ ! -d $LUA_DIR/plug-config ]; then
  mkdir $LUA_DIR/plug-config;
fi

mv moon/*.lua lua

mv moon/plug-config/*.lua lua/plug-config 
