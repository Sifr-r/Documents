# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This method parses its input as HTML or XML, writing the result into a {{domxref("DocumentFragment")}} that might subsequently be injected into the DOM.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, if the input originally came from an attacker.
>
> You can reduce the risk by assigning {{domxref("TrustedHTML")}} objects instead of strings, and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive.
> This ensures that the input is passed through a transformation function, which has the chance to [sanitize](/en-US/docs/Web/Security/Attacks/XSS#sanitization) the input to remove potentially dangerous markup, such as {{htmlelement("script")}} elements and event handler attributes.

## Exceptions

- `TypeError`
  - : Thrown if the property is set to a string when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.

## Security Notes

The method does not perform any sanitization of the input to remove XSS-unsafe elements such as {{htmlelement("script")}}, or event handler content attributes.
If the input is provided by a user, and the returned {{domxref("DocumentFragment")}} is subsequently injected into the DOM, this method can become a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.

For example, the following code would inject the potentially dangerous user-provided string into the DOM.

```js example-bad
const untrustedCode = "<script>alert('Potentially evil code!');</script>";

const range = document.createRange();
// Make the parent of the first div in the document become the context node
range.selectNode(document.getElementsByTagName("div").item(0));
const documentFragment = range.createContextualFragment(untrustedCode);
document.body.appendChild(documentFragment);
```

When inserting HTML into a page using `createContextualFragment()`, you should pass {{domxref("TrustedHTML")}} objects instead of strings, and [enforce trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive.
This ensures that the input is passed through a transformation function, which has the chance to [sanitize](/en-US/docs/Web/Security/Attacks/XSS#sanitization) the input to remove potentially dangerous markup before it is injected.

