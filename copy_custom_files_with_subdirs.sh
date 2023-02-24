#!/bin/bash

# Display help if the script is run without arguments
if [ $# -lt 4 ]; then
  echo "Usage: $0 /path/to/directory subdir_string custom_keyword 
/path/to/destination"
  exit 1
fi

# Get the directory path, subdirectory string, custom keyword, and 
destination directory as command line arguments
dir_path="$1"
subdir_string="$2"
custom_keyword="$3"
dest_dir="$4"

# Use find command to locate subdirectories that contain the subdirectory 
string
# Then search for files with "set" or "fdt" extension and custom keyword 
in filename in these subdirectories
# Then copy the files to the destination directory
find "$dir_path" -type d -name "*$subdir_string*" -print0 | xargs -0 -I{} 
sh -c 'find "{}" -type f \( -name "*'"$custom_keyword"'*set" -o -name 
"*'"$custom_keyword"'*fdt" \) -print0 | xargs -0 -I{} cp -- {} "$0"' 
"$dest_dir"

