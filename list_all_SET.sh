#!/bin/bash

# Display help if the script is run without arguments
if [ $# -eq 0 ]; then
  echo "searches for all files in a directory and its subdirectories that have the extensions \"set\" or \"fdt\" and a custom keyword in the filename"
  echo "Usage: $0 /path/to/directory custom_keyword"
  exit 1
fi

# Get the directory path and custom keyword as command line arguments
dir_path="$1"
custom_keyword="$2"

# Use find command to locate files with "set" or "fdt" extension and custom keyword in filename
find "$dir_path" -type f \( -name "*$custom_keyword*set" -o -name "*$custom_keyword*fdt" \) -print
