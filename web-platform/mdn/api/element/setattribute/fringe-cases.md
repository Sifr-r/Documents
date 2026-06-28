# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This method can take attribute values that are parsed as HTML, a script, or as a script URL, depending on the attribute.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, if the value originally came from an attacker.
>
> You can mitigate this risk by always passing the appropriate trusted type object ({{domxref("TrustedHTML")}}, {{domxref("TrustedScript")}}, or {{domxref("TrustedScriptURL")}}) instead of strings for those attributes that require them, and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](#security_considerations) for more information.

    > [!NOTE]
    > Earlier versions of the specification were more restrictive, requiring that the `qualifiedName` be a valid [XML name](https://www.w3.org/TR/xml/#dt-name).

## Exceptions

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Thrown if either the [`prefix`](#prefix) or [`localName`](#localname) is not valid:
    - The `prefix` must have at least one character, and cannot contain ASCII whitespace, `NULL`, `/`, or `>` (U+0000, U+002F, or U+003E, respectively).
    - The `localName` must have at least one character, and may not contain ASCII whitespace, `NULL`, `/`, `=` or `>` (U+0000, U+002F, U+003D, or U+003E, respectively).

    > [!NOTE]

- `TypeError`
  - : Thrown if [`value`](#value) is passed a string instead of a trusted type object (for those attributes that require them) when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.

## Security Notes

[Some attributes](#value) can be used as a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, where potentially unsafe strings provided by a user are injected into the DOM without first being sanitized, or scripts are run that might contain malicious code.

For example, the following code shows how a potentially untrusted string provided by a user would be executed when the button is pressed.

```js
const button = document.querySelector("button");
const potentiallyUnsafeString = "alert(1)";
button.setAttribute("onclick", potentiallyUnsafeString);
```

You might similarly inject untrusted HTML into the DOM by setting the {{domxref("HTMLIFrameElement.srcdoc")}} attribute, or by supplying an untrusted URL to the {{domxref("HTMLScriptElement.src")}} or {{domxref("SVGScriptElement.href")}} attributes.

You can mitigate these issues by always assigning the appropriate trusted type object ({{domxref("TrustedHTML")}}, {{domxref("TrustedScript")}}, or {{domxref("TrustedScriptURL")}}) for each property instead of strings, and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive.
This ensures that the input is passed through a transformation function which might, for example, remove potentially dangerous markup from HTML before it is injected.

