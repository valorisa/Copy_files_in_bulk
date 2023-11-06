# Define variables
$input_file = Read-Host "Please enter the full path of the input file:"

# Get the list of destination directories
$destination_dirs = Read-Host "Please enter the list of destination directories, separated by commas:"

# Correct the UMDF directory path
$destination_dirs = $destination_dirs.Replace("C:\Windows\System32\UMDF", "C:\Windows\System32\Drivers\UMDF")

# Check if the input file exists
if (-not (Test-Path -Path $input_file)) {
    Write-Error "The input file does not exist."
    exit
}

# Go through the input file
Get-Content $input_file | ForEach-Object {

    # Remove spaces and line breaks
    $line = $_.Trim()

    # Check if the file exists in the source directory
    if (Test-Path -Path $line) {

        # Take ownership of the file
        $owner = "domain\administrator"
        Set-Owner -Path $line -Owner $owner

        # Copy the file to each destination directory
        foreach ($destination_dir in $destination_dirs) {

            # Check if the destination directory exists
            if (Test-Path -Path $destination_dir) {

                # Take ownership of the directory
                Set-Owner -Path $destination_dir -Owner $owner

                # Copy the file to the destination directory
                Copy-Item -Path $line -Destination $destination_dir -Force

                # Check if the file exists in the destination directory
                if (Test-Path -Path $destination_dir\$line) {

                    # Ask for confirmation for overwriting
                    $confirm = Read-Host "The file $line already exists in the destination directory. Do you want to overwrite it? (Y/N)"

                    # If the answer is no, do not copy the file
                    if ($confirm -ne "Y") {
                        continue
                    }

                }

            }

        }

    }

}
# End of script