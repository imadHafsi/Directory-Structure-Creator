# Directory-Structure-Creator-from-Text-File

This repository contains a shell script that reads a text file line by line, removes spaces, and creates a directory structure where the first word in each line is the parent directory and the subsequent words are subdirectories. Unacceptable characters in directory names are replaced with underscores (`_`).

## Features
- Reads a text file line by line.
- Removes spaces from each line.
- Creates directories based on the processed line content.
- Handles carriage return characters from files created in Windows.
- Replaces unacceptable characters in directory names with underscores (`_`).

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/imadHafsi/directory-structure-creator.git
    cd directory-structure-creator
    ```

2. Make the script executable:
    ```sh
    chmod +x create_directories.sh
    ```

3. Run the script by passing the path to your text file as an argument:
    ```sh
    ./create_directories.sh path/to/your/file.txt
    ```

## Example

Given a text file `file.txt` with the following content:

parent1 subdir1 subdir@2
parent2 subdir#3 subdir$4
parent3 subdir%5

The script will create the following directory structure:

parent1/
  subdir1/
  subdir_2/
parent2/
  subdir_3/
  subdir_4/
parent3/
  subdir_5/

## Contributing

Feel free to submit issues or pull requests if you have suggestions or improvements.
