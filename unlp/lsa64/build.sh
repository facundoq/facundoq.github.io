#!/bin/bash
rm index.html; pandoc --from gfm --to html -c style.css -T "LSA64 - Argentinian Sign Language Dataset - UNLP" --standalone index.md > index.html
