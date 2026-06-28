# Fringe Cases

## Warnings & Notes

> [!WARNING]
> When the `code` parameter is used, this method dynamically executes its value as JavaScript.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.
>
> You can mitigate this risk by always assigning {{domxref("TrustedScript")}} objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](/en-US/docs/Web/API/Window/setTimeout#security_considerations) in `Window.setTimeout()` for more information.

## Exceptions

- {{jsxref("SyntaxError")}}
  - : The `code` can't be parsed as a script.
- {{jsxref("TypeError")}}
  - : Thrown if the `code` parameter is set to a string when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.
    It is also thrown if the first parameter is not one of the supported types: a function, string or `TrustedScript`.

