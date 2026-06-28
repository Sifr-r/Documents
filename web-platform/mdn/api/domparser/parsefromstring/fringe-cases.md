# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This method parses its input as HTML, writing the result into the DOM.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, if the input originally came from an attacker.
>
> You can mitigate this risk by always passing `TrustedHTML` objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](#security_considerations) for more information.

> [!NOTE]
> The [`Document.parseHTMLUnsafe()`](/en-US/docs/Web/API/Document/parseHTMLUnsafe_static) static method provides an ergonomic alternative for parsing HTML markup into a {{domxref("Document")}}.

> [!NOTE]
> The browser may actually return an {{domxref("HTMLDocument")}} or {{domxref("XMLDocument")}} object.
> These derive from {{domxref("Document")}} and add no attributes: they are essentially equivalent.

## Exceptions

- [`TypeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError)
  - : This is thrown when:
    - `mimeType` is passed a value that is not one of the [allowed values](#mimetype).
    - `input` is passed a string value when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.

## Security Notes

This method parses its input into a separate in-memory DOM, disabling any {{htmlelement("script")}} elements and stopping event handlers from running.
While the returned document is effectively inert, event handlers and scripts in its DOM will be able to run if they are inserted into the visible DOM.
The method is therefore a possible vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, where potentially unsafe input is first parsed into a `Document` without being sanitized, and then injected into the visible/active DOM where code is able to run.

You should mitigate this risk by always passing {{domxref("TrustedHTML")}} objects instead of strings, and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive.
This ensures that the input is passed through a transformation function, which has the chance to [sanitize](/en-US/docs/Web/Security/Attacks/XSS#sanitization) the input to remove potentially dangerous markup (such as {{htmlelement("script")}} elements and event handler attributes), before it is injected.

Using `TrustedHTML` makes it possible to audit and check that sanitization code is effective in just a few places, rather than scattered across all your injection sinks.
You should not need to pass a sanitizer to the method when using `TrustedHTML`.

Note that even if you sanitize the input of elements and attributes that can execute code, you still need to be careful when taking any user input.
For example, your page might use data in an XML document to fetch files that it then executes.

