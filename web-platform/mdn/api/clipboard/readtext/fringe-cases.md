# Fringe Cases

## Warnings & Notes

> [!NOTE]
> To read non-text contents from the clipboard, use the {{domxref("Clipboard.read", "read()")}} method instead.
> You can write text to the clipboard using {{domxref("Clipboard.writeText", "writeText()")}}.

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the access to read the clipboard is not allowed.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if the clipboard indicates that it contains data that can be represented as a text but is unable to provide a textual representation.

## Security Notes

Reading from the clipboard can only be done in a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Additional security requirements are covered in the [Security consideration](/en-US/docs/Web/API/Clipboard_API#security_considerations) section of the API overview topic.

