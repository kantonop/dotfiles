#!/usr/bin/env bash

function make_source() {
	case `grep -Fx "[[ -f $HOME/$1 ]] && source $HOME/$1" "$HOME/.bashrc" >/dev/null; echo $?` in
	  0)
		echo "$1 is already being sourced"
		;;
	  1)
		echo "adding source for $1"
		echo "" >> $HOME/.bashrc
		echo "[[ -f $HOME/$1 ]] && source $HOME/$1" >> $HOME/.bashrc
		;;
	  *)
		echo "Cannot determine if it is sourced, exiting"
		exit 1
		;;
	esac
}

for d in $(ls -d */ | tr -d /); do
	echo "stowing $d"
	stow -D $d
	stow $d
done

FILES_TO_SOURCE="bashrc"
for file in $FILES_TO_SOURCE; do
	make_source $file
done
