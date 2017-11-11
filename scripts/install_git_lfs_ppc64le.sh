#!/usr/bin/env bash

set -eu

_main() {
  local tmpdir
  tmpdir="$(mktemp -d git_lfs_install.XXXXXX)"

  cd "$tmpdir"
  export GOPATH=$PWD
  go get github.com/github/git-lfs || true
  cd src/github.com/github/git-lfs
  ./script/bootstrap
  cd bin
  cp git-lfs /usr/bin
  cd /tmp
  rm -rf "$tmpdir"
}

_main "$@"
