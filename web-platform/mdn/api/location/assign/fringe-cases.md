# Fringe Cases

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the {{Glossary("origin")}} of the script calling the method is not the {{Glossary("Same-origin policy", "same origin")}} of the page originally described by the {{domxref("Location")}} object, mostly when the script is hosted on a different domain. Browsers also throttle navigations and may throw this error, generate a warning, or ignore the call if it's called too frequently.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if the provided `url` parameter is not a valid URL.

