# Bash — Core Syntax & Scripting

## Variables

```bash
# Assignment (NO spaces around =)
name="Alice"
num=42

# Reference
echo "$name"       # Alice
echo "${name}"     # Alice (safer)

# Special variables
echo "$0"          # script name
echo "$1" "$2"     # positional args
echo "$#"          # number of args
echo "$@"          # all args (as separate)
echo "$*"          # all args (as single string)
echo "$?"          # last exit code
echo "$$"          # PID
echo "$!"          # last background PID

# Defaults & substitution
echo "${VAR:-default}"   # use default if unset/null
echo "${VAR:=default}"   # assign default if unset
echo "${VAR:?error msg}" # error if unset
echo "${VAR:+value}"     # use value if VAR is set
echo "${#VAR}"           # length
echo "${VAR#prefix}"     # remove shortest prefix
echo "${VAR##prefix}"    # remove longest prefix
echo "${VAR%suffix}"     # remove shortest suffix
echo "${VAR%%suffix}"    # remove longest suffix
echo "${VAR/old/new}"    # replace first match
echo "${VAR//old/new}"   # replace all matches

# Arrays
arr=("a" "b" "c")        # declare
echo "${arr[0]}"          # first element
echo "${arr[@]}"          # all elements
echo "${!arr[@]}"         # all indices
echo "${#arr[@]}"         # array length
arr+=("d")                # append
unset arr[0]              # remove element

# Associative arrays (Bash 4+)
declare -A map=([key1]=val1 [key2]=val2)
echo "${map[key1]}"
echo "${!map[@]}"         # all keys
```

## Control Flow

```bash
# if/elif/else
if [[ "$a" -eq "$b" ]]; then
    echo "equal"
elif [[ "$a" -gt "$b" ]]; then
    echo "greater"
else
    echo "less"
fi

# Numeric comparisons
[[ "$a" -eq "$b" ]]  # equal
[[ "$a" -ne "$b" ]]  # not equal
[[ "$a" -lt "$b" ]]  # less than
[[ "$a" -le "$b" ]]  # less or equal
[[ "$a" -gt "$b" ]]  # greater than
[[ "$a" -ge "$b" ]]  # greater or equal

# String comparisons
[[ "$a" == "$b" ]]   # equal
[[ "$a" != "$b" ]]   # not equal
[[ -z "$a" ]]        # zero length
[[ -n "$a" ]]        # non-zero length
[[ "$a" =~ regex ]]  # regex match

# File tests
[[ -f "$f" ]]  # regular file exists
[[ -d "$d" ]]  # directory exists
[[ -e "$p" ]]  # exists (any type)
[[ -r "$f" ]]  # readable
[[ -w "$f" ]]  # writable
[[ -x "$f" ]]  # executable
[[ -s "$f" ]]  # non-empty
[[ "$f1" -nt "$f2" ]]  # newer than
[[ "$f1" -ot "$f2" ]]  # older than

# Logical operators
[[ "$a" && "$b" ]]  # AND
[[ "$a" || "$b" ]]  # OR
[[ ! "$a" ]]        # NOT

# case
case "$var" in
    start) echo "starting" ;;
    stop|shutdown) echo "stopping" ;;
    *) echo "unknown" ;;
esac

# Loops
for i in {1..10}; do echo "$i"; done
for ((i=0; i<10; i++)); do echo "$i"; done
for item in "${arr[@]}"; do echo "$item"; done

while read -r line; do
    echo "$line"
done < file.txt

until [[ "$x" -eq 0 ]]; do
    ((x--))
done
```

## Functions

```bash
# Definition
greet() {
    local name="$1"    # local variable
    echo "Hello, $name!"
}

# With return value
add() {
    local result=$(($1 + $2))
    echo "$result"       # output = return value
}
sum=$(add 3 5)           # capture output

# Exit code return
is_even() {
    (($1 % 2 == 0))
    return $?             # 0=success (even), 1=failure (odd)
}
if is_even 4; then echo "even"; fi
```

## I/O & Redirection

```bash
# Redirect stdout
cmd > file.txt           # overwrite
cmd >> file.txt          # append

# Redirect stderr
cmd 2> error.log

# Redirect both
cmd &> all.log           # Bash 4+
cmd > all.log 2>&1       # POSIX

# Redirect stdin
cmd < input.txt

# Here documents
cat <<EOF
multi-line
text
EOF

# Here string
cmd <<< "input string"

# Pipelines
cmd1 | cmd2 | cmd3
cmd1 | while read -r line; do echo "$line"; done

# Process substitution
diff <(sort file1.txt) <(sort file2.txt)
```

## Error Handling

```bash
# Exit on error
set -e              # exit on any error
set -u              # exit on undefined variable
set -o pipefail     # exit on pipe failure
set -euo pipefail   # all three

# Trap errors
trap 'echo "Error on line $LINENO"' ERR

# Cleanup on exit
trap 'rm -f "$TMPFILE"' EXIT

# Check command result
if ! cmd; then
    echo "Command failed: $?" >&2
    exit 1
fi
```

## See Also

- [scripting.md](scripting.md) — patterns, file ops, text processing