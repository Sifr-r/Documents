# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The argument passed to this function is dynamically parsed and executed as JavaScript.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.
>
> You can mitigate this risk by always passing {{domxref("TrustedScript")}} objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
>
> See [Security considerations](#security_considerations) for more information.

## Exceptions

- {{jsxref("SyntaxError")}}
  - : The `script` parameter cannot be parsed as a script.
- {{jsxref("TypeError")}}
  - : `script` is a string when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.

The method also throws any exception that occurs during evaluation of the code.

## Security Notes

The method can be used to execute arbitrary input with the privileges of the caller. If the input is a potentially unsafe string provided by a user, this is a possible vector for [Cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.

For example, the following code shows how `eval()` might execute `untrustedCode` provided by a user:

```js example-bad
const untrustedCode = "alert('Potentially evil code!');";
const adder = eval(untrustedCode);
```

Websites with a [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) that specifies [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) or [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src) will prevent such code running by default. If you must allow the scripts to run via `eval()`, you can mitigate the risks by always assigning a {{domxref("TrustedScript")}} instance instead of a string, and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive. This ensures that the input is passed through a transformation function.

To allow `eval()` to run, you additionally need to specify the [`trusted-types-eval` keyword](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#trusted-types-eval) in your CSP `script-src` directive. The [`unsafe-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-eval) keyword also allows `eval()`, but is much less safe then `trusted-types-eval` because it would allow execution even on browsers that do not support trusted types.

For example, the required CSP for your site might look like this:

```http
Content-Security-Policy: require-trusted-types-for 'script'; script-src '<your_allowlist>' 'trusted-types-eval'
```

The behavior of the transformation function implemented in your trusted types policy depends on the specific use case that requires a user provided script. If possible, you should lock the allowed scripts to exactly the code that you trust to run. If that is not possible, you might allow or block the use of certain functions within the provided input.

