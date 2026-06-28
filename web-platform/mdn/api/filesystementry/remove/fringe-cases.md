# Fringe Cases

## Exceptions

- `DOMException.INVALID_MODIFICATION_ERR`
  - : The specified entry was the file system's root directory, or the specified entry is
    a directory which isn't empty.
- `DOMException.INVALID_STATE_ERR`
  - : The file system's cached state is inconsistent with its state on disk, so the file
    could not be deleted for safety reasons.
- `DOMException.NO_MODIFICATION_ALLOWED_ERR`
  - : The file system's state doesn't permit removing the file or directory.
- `DOMException.NOT_FOUND_ERR`
  - : The file or directory doesn't exist.
- `DOMException.SECURITY_ERR`
  - : The entry couldn't be removed due to permissions or other access constraints, or
    because there are too many calls being made on file resources.

