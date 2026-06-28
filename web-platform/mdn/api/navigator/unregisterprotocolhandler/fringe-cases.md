# Fringe Cases

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : The user agent blocked unregistration.
    This might happen if:
    - The scheme (protocol) is invalid, such as a scheme the browser handles itself (`https:`, `about:`, etc.)
    - The handler URL's {{Glossary("origin")}} does not match the origin of the page calling this API.
    - The browser requires that this function is called from a secure context.
    - The browser requires that the handler's URL be over HTTPS.
- `SyntaxError` {{domxref("DOMException")}}
  - : The `%s` placeholder is missing from the handler URL.

