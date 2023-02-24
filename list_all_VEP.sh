#!/bin/bash

# Get the directory path as a command line argument
dir_path="$1"

# Use find command to locate files with "set" or "fdt" extension and "VEP" in filename
find "$dir_path" -type f \( -name "*VEP*set" -o -name "*VEP*fdt" \) -print
