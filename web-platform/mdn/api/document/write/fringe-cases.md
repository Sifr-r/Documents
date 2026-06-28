# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Use of the `document.write()` method is strongly discouraged.
> Avoid using it, and where possible replace it in existing code.
>
> As [the HTML spec itself warns](<https://html.spec.whatwg.org/multipage/dynamic-markup-insertion.html#document.write()>):
>
> > This method has very idiosyncratic behavior.
> > In some cases, this method can affect the state of the [HTML parser](https://html.spec.whatwg.org/multipage/parsing.html#html-parser) while the parser is running, resulting in a DOM that does not correspond to the source of the document (e.g., if the string written is the string "`<plaintext>`" or "`<!--`").
> > In other cases, the call can clear the current page first, as if {{domxref("document.open()")}} had been called.
> > In yet more cases, the method is simply ignored, or throws an exception. Users agents are [explicitly allowed to avoid executing `script` elements inserted via this method](https://html.spec.whatwg.org/multipage/parsing.html#document-written-scripts-intervention).
> > And to make matters even worse, the exact behavior of this method can in some cases be dependent on network latency, which can lead to failures that are very hard to debug.
> > For all these reasons, use of this method is strongly discouraged.

> [!WARNING]
> This method parses its input as HTML, writing the result into the DOM.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, if the input originally came from an attacker.
>
> You can mitigate this risk by always passing `TrustedHTML` objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](#security_considerations) for more information.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : The method was called on an XML document, or called when the parser is currently executing a custom element constructor.
- `TypeError`
  - : A string is passed as one of the parameters when [Trusted Types are enforced](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and [no default policy has been defined](/en-US/docs/Web/API/TrustedTypePolicyFactory/createPolicy#creating_a_default_policy) for creating {{domxref("TrustedHTML")}} objects.

## Security Notes

The method is a possible vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, where potentially unsafe strings provided by a user are injected into the DOM without first being sanitized.
While the method may block {{HTMLElement("script")}} elements from executing when they are injected in some browsers (see [Intervening against document.write()](https://developer.chrome.com/blog/removing-document-write/) for Chrome), it is susceptible to many other ways that attackers can craft HTML to run malicious JavaScript.

You can mitigate these issues by always passing {{domxref("TrustedHTML")}} objects instead of strings, and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive.
This ensures that the input is passed through a transformation function, which has the chance to [sanitize](/en-US/docs/Web/Security/Attacks/XSS#sanitization) the input to remove potentially dangerous markup (such as {{htmlelement("script")}} elements and event handler attributes), before it is injected.

