# PowerShell, Go and Python scripts to copy files from a source directory to multiple destination directories

![banner](https://github.com/valorisa/Copy_files_in_bulk/assets/13067566/50990d63-3804-410e-90da-a0c19871a43a)

## Copy_files_in_bulk

These are PowerShell, Go and Python scripts that copy files from a source directory to multiple destination directories.

## Here’s a step-by-step explanation of the initial PowerShell version

1. Define Variables : The script first prompts the user to enter the full path of the input file and the list of destination directories, separated by commas.

2. Correct UMDF Directory Path : The script replaces “C:\Windows\System32\UMDF” with “C:\Windows\System32\Drivers\UMDF” in the list of destination directories.

3. Check Input File : The script checks if the input file exists. If it doesn’t, it throws an error and exits.

4. Process Input File : The script reads the input file line by line. For each line, it does the following :

5. Trim Spaces and Line Breaks : It removes any leading or trailing spaces and line breaks from the line.

6. Check Source File : It checks if the file exists in the source directory.

7. Take Ownership of File : If the file exists, it changes the ownership of the file to “domain\administrator”.

8. Copy File to Destination Directories: It then loops through each destination directory and does the following :

9. Check Destination Directory : It checks if the destination directory exists.

10. Take Ownership of Directory : If the directory exists, it changes the ownership of the directory to “domain\administrator”.

11. Copy File to Directory : It copies the file to the destination directory.

12. Check Destination File : It checks if the file already exists in the destination directory.

13. Confirm Overwrite : If the file exists, it prompts the user to confirm whether they want to overwrite the file. If the user enters anything other than “Y” (for Yes), it skips copying the file to that directory.

14. End of Script : The script ends after processing all lines in the input file and all destination directories.

This script is useful for situations where you need to copy files to multiple directories and want to automate the process. It also includes error checking and user prompts to ensure the correct files are copied and existing files are not accidentally overwritten. Please note that this script changes the ownership of files and directories to “domain\administrator”, so it should be run with appropriate permissions.
