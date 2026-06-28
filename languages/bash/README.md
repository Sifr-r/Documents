# Bash / Shell

Bash 5+ reference for shell scripting, automation, and DevOps.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, variables, control flow, functions, subshells |
| [scripting.md](scripting.md) | Common patterns, error handling, file ops, text processing |

## Quick Reference

```bash
# Variables
name="Alice"
readonly CONST="fixed"
echo "Hello $name"

# Default values
echo "${VAR:-default}"    # use default if unset
echo "${VAR:=default}"    # set if unset
echo "${VAR:?error}"      # error if unset

# Arrays
arr=("a" "b" "c")
echo "${arr[0]}"
echo "${arr[@]}"          # all elements
echo "${#arr[@]}"         # length

# Conditionals
if [[ -f "$file" ]]; then
    echo "exists"
elif [[ -d "$dir" ]]; then
    echo "directory"
fi

# Loops
for item in "${arr[@]}"; do echo "$item"; done
for i in {1..10}; do echo "$i"; done
while read -r line; do echo "$line"; done < file.txt

# Functions
myfunc() {
    local arg=$1
    echo "Hello $arg"
}
```