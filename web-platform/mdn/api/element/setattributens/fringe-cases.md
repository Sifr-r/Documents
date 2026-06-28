# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This method can take attribute values that are parsed as HTML, a script, or as a script URL, depending on the attribute.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, if the value originally came from an attacker.
>
> You can mitigate this risk by always passing the appropriate trusted type object ({{domxref("TrustedHTML")}}, {{domxref("TrustedScript")}}, or {{domxref("TrustedScriptURL")}}) instead of strings for those attributes that require them, and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](/en-US/docs/Web/API/Element/setAttribute#security_considerations) in {{domxref("Element.setAttribute()")}} for more information.

    > [!NOTE]
    > Earlier versions of the specification were more restrictive, requiring that the `qualifiedName` be a valid [XML name](https://www.w3.org/TR/xml/#dt-name).

## Exceptions

- `NamespaceError` {{domxref("DOMException")}}
  - : Thrown if the [`namespaceURI`](#namespaceuri) value is:
    - not a valid namespace URI.
    - set to the empty string when `prefix` has a value.
    - not the value `http://www.w3.org/XML/1998/namespace` or `http://www.w3.org/2000/xmlns/` when [`prefix`](#prefix) is set to `xml` or `xmlns`, respectively.
- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Thrown if either the [`prefix`](#prefix) or [`localName`](#localname) is not valid:
    - The `prefix` must have at least one character, and cannot contain ASCII whitespace, `NULL`, `/`, or `>` (U+0000, U+002F, or U+003E, respectively).
    - The `localName` must have at least one character, and may not contain ASCII whitespace, `NULL`, `/`, `=` or `>` (U+0000, U+002F, U+003D, or U+003E, respectively).

    > [!NOTE]

- `TypeError`
  - : Thrown if [`value`](#value) is passed a string instead of a trusted type object (for those attributes that require them) when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.

