# Directory Tree Listing Script

This batch script recursively lists directories and files starting from a specified root directory while excluding certain files and folders. By default, it skips files named `.gitignore` and directories named `.dist` or `.git`.

## Features

- **Recursive Listing:** Traverses directories recursively.
- **Exclusion Rules:** Ignores `.gitignore` files and skips directories named `.dist` and `.git`.
- **Customizable Root Directory:** Uses a default path if no argument is provided, or accepts a custom folder as an argument.

## How It Works

1. **Root Directory Selection:**  
   - If a folder is passed as the first argument, the script sets `ROOT_DIR` to that folder.
   - If no folder is provided, it defaults to `\\set\default\path\here`.

2. **Printing the Directory Tree:**  
   The script calls the `:PrintTree` function, which:
   - Prints the current directory.
   - Lists files in the current directory (ignoring `.gitignore`).
   - Recursively processes subdirectories (excluding `.dist` and `.git`).

## Usage

Open a Command Prompt, navigate to the directory containing the script, and run:

<code-language-used>batch
TLF.bat [root_directory]
</code-language-used>

- **Without Arguments:**  
  If you run the script without arguments, it will use the default path.

<code-language-used>batch
TLF.bat
</code-language-used>

- **With a Specific Directory:**  
  To list the tree for a specific folder, provide the folder path as an argument.

<code-language-used>batch
TLF.bat "C:\MyProjects"
</code-language-used>

## Example

Assuming you have a directory `C:\ExampleFolder` that you want to list:

1. Open Command Prompt.
2. Navigate to the folder where `TLF.bat` is located.
3. Execute the command:

<code-language-used>batch
TLF.bat "C:\ExampleFolder"
</code-language-used>

The script will then output the directory structure of `C:\ExampleFolder`, indenting each subdirectory level and excluding `.gitignore`, `.dist`, and `.git`.

## Customization

- **Default Path:**  
  Edit the line `SET "ROOT_DIR=\\set\default\path\here"` to change the default directory.

- **Exclusion Criteria:**  
  To modify which files or directories to exclude, adjust the conditions within the loops that filter for `.gitignore`, `.dist`, and `.git`.

  use > to output the result to a file, like TLF.bat "somepath" > output.txt
  

## License

This script is provided "as-is" without any warranty. Use it at your own risk.

---

What additional features or modifications do you think would improve the functionality of this script for your projects?

What potential use cases do you envision for integrating this script into your daily development tasks?
