#!/bin/bash

# Get the directory path and subdirectory string as command line arguments
dir_path="$1"
subdir_string="$2"

# Use find command to locate subdirectories that contain the subdirectory string
# Then search for files with "set" or "fdt" extension and "VEP" in filename in these subdirectories
find "$dir_path" -type d -name "*$subdir_string*" -exec sh -c 'find "$0" -type f \( -name "*VEP*set" -o -name "*VEP*fdt" \) -print' {} \;
