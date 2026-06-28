# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If you try to delete a directory which contains one or more files that can't be
> removed, or if an error occurs while deletion of a number of files is underway, some
> files may not be deleted. You should provide an `errorCallback` to watch
> for and handle this, perhaps by trying again.

## Exceptions

If an error occurs and an `errorCallback` was specified, it gets called with
a single parameter: a {{domxref("DOMException")}} object describing the error. The
{{domxref("DOMException.code")}} specifies what type of error occurred, as follows:

- `DOMException.INVALID_MODIFICATION_ERR`
  - : An attempt was made to remove the root directory; this is not permitted.
- `DOMException.NO_MODIFICATION_ALLOWED_ERR`
  - : The file system's state doesn't permit modification.
- `DOMException.NOT_FOUND_ERR`
  - : The directory represented by the {{domxref("FileSystemDirectoryEntry")}} no longer
    exists.
- `DOMException.NOT_READABLE_ERR`
  - : The directory is not accessible; perhaps it's in use by another application or is
    locked at the operating system level.
- `DOMException.SECURITY_ERR`
  - : The directory could not be removed for security reasons. Possible reasons include:
    - The directory and/or its contents may not be safe to access from a Web
      application.
    - Too many file system calls are being made.
    - Other security concerns as raised by the user agent or the operating system.

> [!NOTE]

