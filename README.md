# Copy_files_in_bulk
These are PowerShell, Go and Python scripts that copies files from a source directory to multiple destination directories.

 Here’s a step-by-step explanation :

Define Variables : The script first prompts the user to enter the full path of the input file and the list of destination directories, separated by commas.

Correct UMDF Directory Path: The script replaces “C:\Windows\System32\UMDF” with “C:\Windows\System32\Drivers\UMDF” in the list of destination directories.

Check Input File : The script checks if the input file exists. If it doesn’t, it throws an error and exits.

Process Input File : The script reads the input file line by line. For each line, it does the following :

Trim Spaces and Line Breaks : It removes any leading or trailing spaces and line breaks from the line.

Check Source File : It checks if the file exists in the source directory.

Take Ownership of File : If the file exists, it changes the ownership of the file to “domain\administrator”.

Copy File to Destination Directories: It then loops through each destination directory and does the following :

Check Destination Directory : It checks if the destination directory exists.

Take Ownership of Directory : If the directory exists, it changes the ownership of the directory to “domain\administrator”.

Copy File to Directory : It copies the file to the destination directory.

Check Destination File : It checks if the file already exists in the destination directory.

Confirm Overwrite : If the file exists, it prompts the user to confirm whether they want to overwrite the file. If the user enters anything other than “O” (for Oui, or Yes), it skips copying the file to that directory.

End of Script : The script ends after processing all lines in the input file and all destination directories.

This script is useful for situations where you need to copy files to multiple directories and want to automate the process. It also includes error checking and user prompts to ensure the correct files are copied and existing files are not accidentally overwritten. Please note that this script changes the ownership of files and directories to “domain\administrator”, so it should be run with appropriate permissions.
