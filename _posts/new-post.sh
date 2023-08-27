#!/bin/bash

echo -n "Enter a title for your post and press [ENTER]: "
read INPUT

if [ -z "$INPUT" ]; then
    echo "Post title is required"
    exit 1
fi

# Remove special characters and replace spaces with hyphens
CLEAN_TITLE=$(echo "$INPUT" | tr -d '[:punct:]' | tr ' ' '-')
LOWER=$(echo "$CLEAN_TITLE" | tr '[:upper:]' '[:lower:]')

echo -n "Enter a category for your post and press [ENTER]: "
read CATEGORY

if [ -z "$CATEGORY" ]; then
    echo "Post category is required"
    exit 1
fi

DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%T")
FILENAME=$(printf "%s-%s.md" "$DATE" "$LOWER")

touch "$FILENAME"

cat > "$FILENAME" << EOL
---
layout: post
title:  $INPUT
date:   $DATE $TIME
category: $CATEGORY
---
EOL
