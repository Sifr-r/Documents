# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This method parses its input as HTML or XML, writing the result into the DOM.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, if the input originally came from an attacker.
>
> You can reduce the risk by assigning {{domxref("TrustedHTML")}} objects instead of strings, and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive.
> This ensures that the input is passed through a transformation function, which has the chance to [sanitize](/en-US/docs/Web/Security/Attacks/XSS#sanitization) the input to remove potentially dangerous markup, such as {{htmlelement("script")}} elements and event handler attributes.

## Exceptions

This method may raise a {{domxref("DOMException")}} of one of the following types:

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Thrown if `position` is `"beforebegin"` or `"afterend"` and the element either does not have a parent or its parent is the `Document` object.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if:
    - `position` is not one of the four listed values.
    - The input is XML that is not well-formed.
- `TypeError`
  - : Thrown if the property is set to a string when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.

## Security Notes

The method does not perform any sanitization to remove XSS-unsafe elements such as {{htmlelement("script")}}, or event handler content attributes.

When inserting HTML into a page using `insertAdjacentHTML()`, you should pass {{domxref("TrustedHTML")}} objects instead of strings, and [enforce trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive.
This ensures that the input is passed through a transformation function, which has the chance to [sanitize](/en-US/docs/Web/Security/Attacks/XSS#sanitization) the input to remove potentially dangerous markup before it is injected.

The {{domxref("Element.insertAdjacentText()")}} method or {{domxref("Node.textContent")}} should be used when you know that the user provided content should be plain text.
This inserts the input as raw text instead of parsing it as HTML.

