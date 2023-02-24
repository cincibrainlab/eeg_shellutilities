# eeg_ShellUtilities

## To use these scripts, you will need to have access to a Unix-like terminal. Here's how to get started:

Clone or download the repository containing the scripts to your local machine.
Open a terminal and navigate to the directory containing the scripts.
Make the scripts executable by running chmod +x find_SET_files.sh and chmod +x find_SET_files_with_subdirs.sh.

To run the scripts, specify the directory path and subdirectory string (for script 2) as arguments. For example:

```bash
./find_SET_files.sh /path/to/directory
./find_SET_files_with_subdirs.sh /path/to/directory subdir_string
```

These commands will search for files in the specified directory and its subdirectories that have the extensions "set" or "fdt" and the string "

## Script 1: find_SET_files.sh

This shell script searches for all files in a directory and its subdirectories that have the extensions "set" or "fdt" and a custom keyword in the filename. You can specify the directory to search and the custom keyword by passing them as arguments when running the script. The script uses the find command to locate the files and prints their paths to the terminal.

To use the script, first save the code below to a file, such as find_SET_files.sh. Then make the file executable by running chmod +x find_SET_files.sh. To run the script, specify the directory path as an argument:

```bash
./find_custom_files.sh /path/to/directory custom_keyword
```

Here is the code for the script:

```bash
#!/bin/bash

# Get the directory path and custom keyword as command line arguments
dir_path="$1"
custom_keyword="$2"

# Use find command to locate files with "set" or "fdt" extension and custom keyword in filename
find "$dir_path" -type f \( -name "*$custom_keyword*set" -o -name "*$custom_keyword*fdt" \) -print

```

## Script 2: find_SET_files_with_subdirs.sh

This shell script is an extension of the previous script, and allows you to search for files only in subdirectories that contain a certain string, with a custom keyword in the filename. You can specify the directory to search, the subdirectory string, and the custom keyword by passing them as arguments when running the script. The script uses the find command to locate the subdirectories and the files, and prints the paths of the files to the terminal.

To use the script, first save the code below to a file, such as find_custom_files_with_subdirs.sh. Then make the file executable by running chmod +x find_custom_files_with_subdirs.sh. To run the script, specify the directory path, the subdirectory string, and the custom keyword as arguments:

```bash
./find_custom_files_with_subdirs.sh /path/to/directory subdir_string custom_keyword
```

Here is the code for the script:
```bash
#!/bin/bash

# Get the directory path, subdirectory string, and custom keyword as command line arguments
dir_path="$1"
subdir_string="$2"
custom_keyword="$3"

# Use find command to locate subdirectories that contain the subdirectory string
# Then search for files with "set" or "fdt" extension and custom keyword in filename in these subdirectories
find "$dir_path" -type d -name "*$subdir_string*" -exec sh -c 'find "$0" -type f \( -name "*'"$custom_keyword"'*set" -o -name "*'"$custom_keyword"'*fdt" \) -print' {} \;

```

## Script 3: copy_custom_files.sh

This shell script searches for all files in a directory and its subdirectories that have the extensions "set" or "fdt" and a custom keyword in the filename. You can specify the directory to search, the custom keyword, and the destination directory by passing them as arguments when running the script. The script uses the find and cp commands to locate the files and copy them to the destination directory.

To use the script, first save the code below to a file, such as copy_custom_files.sh. Then make the file executable by running chmod +x copy_custom_files.sh. To run the script, specify the directory path, the custom keyword, and the destination directory as arguments:

```bash
./copy_custom_files.sh /path/to/directory custom_keyword /path/to/destination
```

```bash
#!/bin/bash

# Display help if the script is run without arguments
if [ $# -lt 3 ]; then
  echo "Usage: $0 /path/to/directory custom_keyword /path/to/destination"
  exit 1
fi

# Get the directory path, custom keyword, and destination directory as command line arguments
dir_path="$1"
custom_keyword="$2"
dest_dir="$3"

# Use find command to locate files with "set" or "fdt" extension and custom keyword in filename
# Then copy the files to the destination directory
find "$dir_path" -type f \( -name "*$custom_keyword*set" -o -name "*$custom_keyword*fdt" \) -exec cp {} "$dest_dir" \+
```


## Script 4: copy_custom_files_with_subdirs.sh

This shell script is an extension of the previous script, and allows you to search for files only in subdirectories that contain a certain string, with a custom keyword in the filename. You can specify the directory to search, the subdirectory string, the custom keyword, and the destination directory by passing them as arguments when running the script. The script uses the find and cp commands to locate the subdirectories and the files, and copy the files to the destination directory.

To use the script, first save the code below to a file, such as copy_custom_files_with_subdirs.sh. Then make the file executable by running chmod +x copy_custom_files_with_subdirs.sh. To run the script, specify the directory path, the subdirectory string, the custom keyword, and the destination directory as arguments:

```bash
./copy_custom_files_with_subdirs.sh /path/to/directory subdir_string custom_keyword /path/to/destination
```

Here is the code for the script:

```bash
#!/bin/bash

# Display help if the script is run without arguments
if [ $# -lt 4 ]; then
  echo "Usage: $0 /path/to/directory subdir_string custom_keyword /path/to/destination"
  exit 1
fi

# Get the directory path, subdirectory string, custom keyword, and destination directory as command line arguments
dir_path="$1"
subdir_string="$2"
custom_keyword="$3"
dest_dir="$4"

# Use find command to locate subdirectories that contain the subdirectory string
# Then search for files with "set" or "fdt" extension and custom keyword in filename in these subdirectories
# Then copy the files to the destination directory
find "$dir_path" -type d -name "*$subdir_string*" -print0 | xargs -0 -I{} sh -c 'find "{}" -type
```

In these modified scripts, the custom keyword is specified as an additional argument, and it is used in the find command to locate files with the extensions "set" or "fdt" and the custom keyword in the filename. The custom keyword is passed as a shell variable using single quotes around the variable expansion to prevent word splitting.

Now you can use these scripts to search for files with custom keywords in addition to custom file extensions.
