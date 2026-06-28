# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The arguments passed to this constructor are dynamically parsed and executed as JavaScript.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.
>
> You can mitigate this risk by always passing {{domxref("TrustedScript")}} objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
>
> See [Security considerations](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function#security_considerations) in the `Function()` constructor reference for more information.

> [!NOTE]
> `AsyncGeneratorFunction()` can be called with or without [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Both create a new `AsyncGeneratorFunction` instance.

