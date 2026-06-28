# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The `baseVal` property can be used to set the non-animated value of a reflected attribute.
> In the case of {{domxref("SVGScriptElement/href","SVGScriptElement.href.baseVal")}} this property represents the URL of an external script loaded into the SVG script element.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.
>
> You can mitigate this risk by having a [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) that restricts the locations from which scripts can be loaded, and by always assigning {{domxref("TrustedScriptURL")}} objects instead of strings, and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](/en-US/docs/Web/API/SVGScriptElement/href#security_considerations) in {{domxref("SVGScriptElement.href")}} for more information.

## Exceptions

- `TypeError`
  - : Thrown if the reflected attribute's element is {{domxref("SVGScriptElement")}}, and the property is set to a string when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types), and no default policy is defined.

