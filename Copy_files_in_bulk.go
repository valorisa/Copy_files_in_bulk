package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print("Please enter the full path of the input file: ")
	inputFile, _ := reader.ReadString('\n')

	fmt.Print("Please enter the list of destination directories, separated by commas: ")
	destinationDirs, _ := reader.ReadString('\n')

	destinationDirs = strings.ReplaceAll(destinationDirs, "C:\\Windows\\System32\\UMDF", "C:\\Windows\\System32\\Drivers\\UMDF")

	file, err := os.Open(strings.TrimSpace(inputFile))
	if err != nil {
		fmt.Println("The input file does not exist.")
		os.Exit(1)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := strings.TrimSpace(scanner.Text())

		if _, err := os.Stat(line); err == nil {
			// The file exists in the source directory
			// TODO: Take ownership of the file

			for _, destinationDir := range strings.Split(destinationDirs, ",") {
				destinationDir = strings.TrimSpace(destinationDir)

				if _, err := os.Stat(destinationDir); err == nil {
					// The destination directory exists
					// TODO: Take ownership of the directory

					// TODO: Copy the file to the destination directory
				}
			}
		}
	}

	if err := scanner.Err(); err != nil {
		fmt.Fprintln(os.Stderr, "Error reading the file:", err)
	}
}
