#!/bin/bash

# Display help if the script is run without arguments
if [ $# -eq 0 ]; then
  echo "Search for files only in subdirectories that contain a certain string, with a custom keyword in the filename" 
  echo "Usage: $0 /path/to/directory subdir_string custom_keyword"
  exit 1
fi

# Get the directory path, subdirectory string, and custom keyword as command line arguments
dir_path="$1"
subdir_string="$2"
custom_keyword="$3"

# Use find command to locate subdirectories that contain the subdirectory string
# Then search for files with "set" or "fdt" extension and custom keyword in filename in these subdirectories
find "$dir_path" -type d -name "*$subdir_string*" -exec sh -c 'find "$0" -type f \( -name "*'"$custom_keyword"'*set" -o -name "*'"$custom_keyword"'*fdt" \) -print' {} \;
