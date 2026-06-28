# Fringe Cases

## Warnings & Notes

> [!WARNING]
> When the `code` parameter is used, this method dynamically executes its value as JavaScript.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.
>
> You can mitigate this risk by always assigning {{domxref("TrustedScript")}} objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](#security_considerations) for more information.

> [!NOTE]
> In Node.js, any timeout larger than 2,147,483,647 ms results in immediate execution.

## Exceptions

- {{jsxref("SyntaxError")}}
  - : The `code` can't be parsed as a script.
- {{jsxref("TypeError")}}
  - : Thrown if the `code` parameter is set to a string when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.
    It is also thrown if the first parameter is not one of the supported types: a function, string or `TrustedScript`.

## Security Notes

The method can be used to execute arbitrary input passed in the `code` parameter.
If the input is a potentially unsafe string provided by a user, this is a possible vector for [Cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.

For example, the following code shows how `setTimeout()` might execute `untrustedCode` provided by a user:

```js example-bad
const untrustedCode = "alert('Potentially evil code!');";
const id = setTimeout(untrustedCode, 1000);
```

Websites with a [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) that specifies [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) or [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src) will prevent such code running by default.
You can specify [`unsafe-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-eval) in your CSP to allow `setTimeout()` to execute, but this is unsafe as it disables one of the main protections of CSP.
See [Inline JavaScript](/en-US/docs/Web/HTTP/Guides/CSP#inline_javascript) in the CSP guide.

If you must allow the scripts to run via `setTimeout()` you can mitigate these issues by always assigning {{domxref("TrustedScript")}} objects instead of strings, and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive.
This ensures that the input is passed through a transformation function.

To allow `setTimeout()` to run, you will additionally need to specify the [`trusted-types-eval` keyword](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#trusted-types-eval) in your CSP `script-src` directive.
This acts in the same way as `unsafe-eval`, but _only_ allows the method to evaluate if trusted types are enabled (if you were to use `unsafe-eval` it would allow execution even on browsers that do not support trusted types).

For example, the required CSP for your site might look like this:

```http
Content-Security-Policy: require-trusted-types-for 'script'; script-src '<your_allowlist>' 'trusted-types-eval'
```

The behavior of the transformation function will depend on the specific use case that requires a user provided script.
If possible you should lock the allowed scripts to exactly the code that you trust to run.
If that is not possible, you might allow or block the use of certain functions within the provided string.

