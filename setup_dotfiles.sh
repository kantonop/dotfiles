#!/usr/bin/env bash

for d in $(ls -d */ | tr -d /); do
	echo "stowing $d"
	stow -D $d
	stow $d
done
