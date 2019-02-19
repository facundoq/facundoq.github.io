#!/bin/bash
rm index.html; pandoc --from gfm --to html -c style.css -T "Sign Language Datasets Survey" --standalone index.md > index.html
