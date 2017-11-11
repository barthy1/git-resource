#!/bin/sh

set -eu

_main() {
  local tmpdir
  tmpdir="$(mktemp -d git_crypt_install.XXXXXX)"

  cd "$tmpdir"

  git clone https://www.agwa.name/git/git-crypt.git
  cd git-crypt
  make
  make install PREFIX=/usr/local
  cd ..
  rm -rf "$tmpdir"
}

_main "$@"
