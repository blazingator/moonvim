#!/bin/sh

PROJ_DIR=$(pwd)
SRC_DIR=$PROJ_DIR/moon
LUA_DIR=$PROJ_DIR/lua

moonc moon

mv moon/*.lua lua
