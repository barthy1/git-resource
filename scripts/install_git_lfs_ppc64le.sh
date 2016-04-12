#!/bin/sh

set -eu
mkdir /tmp/git-lfs
cd /tmp/git-lfs
export GOPATH=$PWD
go get github.com/github/git-lfs || true
cd src/github.com/github/git-lfs
./script/bootstrap
cd bin
cp git-lfs /usr/bin
rm -rf /tmp/*
