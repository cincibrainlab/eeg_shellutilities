#!/bin/bash

# Display help if the script is run without arguments
if [ $# -lt 3 ]; then
  echo "Usage: $0 /path/to/directory custom_keyword /path/to/destination"
  exit 1
fi

# Get the directory path, custom keyword, and destination directory as 
command line arguments
dir_path="$1"
custom_keyword="$2"
dest_dir="$3"

# Use find command to locate files with "set" or "fdt" extension and 
custom keyword in filename
# Then copy the files to the destination directory
find "$dir_path" -type f \( -name "*$custom_keyword*set" -o -name 
"*$custom_keyword*fdt" \) -exec cp {} "$dest_dir" \+

