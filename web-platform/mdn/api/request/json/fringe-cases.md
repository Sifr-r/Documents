# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown for one of the following reasons:
    - The request body is [disturbed or locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - There was an error decoding the body content (for example, because the {{httpheader("Content-Encoding")}} header is incorrect).
- {{jsxref("SyntaxError")}}
  - : The request body cannot be parsed as JSON.

