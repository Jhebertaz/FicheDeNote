#!/bin/bash

{ shopt -s nullglob; for file in Exercice/Exemple/*; do echo "\\input{${file//'.tex'}}\newpage\setcounter{subsection}{0}"; done; } > inputs.tex

