# eeg_ShellUtilities

## To use these scripts, you will need to have access to a Unix-like terminal. Here's how to get started:

Clone or download the repository containing the scripts to your local machine.
Open a terminal and navigate to the directory containing the scripts.
Make the scripts executable by running chmod +x find_VEP_files.sh and chmod +x find_VEP_files_with_subdirs.sh.
To run the scripts, specify the directory path and subdirectory string (for script 2) as arguments. For example:
bash
Copy code
./find_VEP_files.sh /path/to/directory
./find_VEP_files_with_subdirs.sh /path/to/directory subdir_string
These commands will search for files in the specified directory and its subdirectories that have the extensions "set" or "fdt" and the string "


## Script 1: find_VEP_files.sh

This shell script searches for all files in a directory and its subdirectories that have the extensions "set" or "fdt" and the string "VEP" in the filename. You can specify the directory to search by passing it as an argument when running the script. The script uses the find command to locate the files and prints their paths to the terminal.

To use the script, first save the code below to a file, such as find_VEP_files.sh. Then make the file executable by running chmod +x find_VEP_files.sh. To run the script, specify the directory path as an argument:

bash
Copy code
./find_VEP_files.sh /path/to/directory
Here is the code for the script:

bash
Copy code
#!/bin/bash

### Get the directory path as a command line argument
dir_path="$1"

### Use find command to locate files with "set" or "fdt" extension and "VEP" in filename
find "$dir_path" -type f \( -name "*VEP*set" -o -name "*VEP*fdt" \) -print
Script 2: find_VEP_files_with_subdirs.sh

This shell script is an extension of the previous script, and allows you to search for files only in subdirectories that contain a certain string. You can specify the directory to search and the subdirectory string by passing them as arguments when running the script. The script uses the find command to locate the subdirectories and the files, and prints the paths of the files to the terminal.

To use the script, first save the code below to a file, such as find_VEP_files_with_subdirs.sh. Then make the file executable by running chmod +x 

## Script 2: find_VEP_files_with_subdirs.sh. 
To run the script, specify the directory path and subdirectory string as arguments:

bash
Copy code
./find_VEP_files_with_subdirs.sh /path/to/directory subdir_string

Here is the code for the script:

bash
Copy code
#!/bin/bash

# Get the directory path and subdirectory string as command line arguments
dir_path="$1"
subdir_string="$2"

# Use find command to locate subdirectories that contain the subdirectory string
# Then search for files with "set" or "fdt" extension and "VEP" in filename in these subdirectories
find "$dir_path" -type d -name "*$subdir_string*" -exec sh -c 'find "$0" -type f \( -name "*VEP*set" -o -name "*VEP*fdt" \) -print' {} \;
