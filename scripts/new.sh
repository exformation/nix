#!/usr/bin/env bash

set -e

# Check if the right number of arguments are passed
if [ "$#" -ne 2 ]; then
	echo "Usage: new <language> <project-name>"
	exit 1
fi

LANGUAGE=$1
PROJECT_NAME=$2

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# NOTE: don't want to have to make a template repo for every project?
gh repo create "$PROJECT_NAME" --private --clone # --template exformation/

# NOTE: get the flake.nix, .gitignore, etc.
wget github:exformation/project-templates/"$LANGUAGE" .

#
nix flake init # -t github:NixOS/flake-templates/$LANGUAGE

# Use project specific tools to setup the rest
case $LANGUAGE in
py)
	# Python specific setup
	;;
nvim)
	# Neovim specific setup
	;;
rs)
	# Rust specific setup
	cargo init
	;;
*)
	echo "Unsupported language: $LANGUAGE"
	exit 1
	;;
esac

gg
