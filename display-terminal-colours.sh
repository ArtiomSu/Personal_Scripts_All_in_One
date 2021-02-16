#!/usr/bin/env zsh
echo "here is all colours available for the terminal"

for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"



