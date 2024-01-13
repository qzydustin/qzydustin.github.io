#!/bin/bash

read -p "Enter a title for your post and press [ENTER]: " input

if [ -z "$input" ]; then
    echo "Post title is required."
    exit 1
fi

# Remove special characters, then replace spaces with hyphens and squeeze repeated hyphens into one
clean_title=$(echo "$input" | sed 's/[^a-zA-Z0-9 ]//g' | sed 's/  */-/g')

# Convert to lowercase
lower_title=$(echo "$clean_title" | tr '[:upper:]' '[:lower:]')

read -p "Enter a category for your post and press [ENTER]: " category

if [ -z "$category" ]; then
    echo "Post category is required."
    exit 1
fi

datetime=$(date +"%Y-%m-%d %T")
filename="${datetime:0:10}-${lower_title}.md"

touch "$filename" || { echo "Failed to create file: $filename"; exit 1; }

cat > "$filename" << EOL
---
layout: post
title:  $input
date:   $datetime
category: $category
---
EOL

echo "File created: $filename"
