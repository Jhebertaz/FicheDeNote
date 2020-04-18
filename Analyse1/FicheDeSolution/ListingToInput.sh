#!/bin/bash

{ shopt -s nullglob; for file in Exercice/*; do echo "\\input{${file//'.tex'}}"; done; } > inputs.tex

