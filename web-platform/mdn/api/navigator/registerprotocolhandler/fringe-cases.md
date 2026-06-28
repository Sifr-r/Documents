# Fringe Cases

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : The user agent blocked the registration.
    This might happen if:
    - The registered scheme (protocol) is invalid, such as a scheme the browser handles itself (`https:`, `about:`, etc.)
    - The handler URL's {{Glossary("origin")}} does not match the origin of the page calling this API.
    - The handler's URL's scheme is not `https`.

- `SyntaxError` {{domxref("DOMException")}}
  - : The `%s` placeholder is missing from the handler URL.

