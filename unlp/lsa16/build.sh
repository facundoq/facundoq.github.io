#!/bin/bash
rm index.html; pandoc --from gfm --to html -c style.css -T "LSA16 - Argentinian Sign Language Handshape Dataset - UNLP" --standalone index.md > index.html
