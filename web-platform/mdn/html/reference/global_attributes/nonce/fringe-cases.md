# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Only use `nonce` for cases where you have no way around using unsafe inline script
> or style contents. If you don't need `nonce`, don't use it. If your script is static, you could also use a CSP hash instead.
> (See usage notes on [unsafe inline script](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src#unsafe_inline_script).)
> Always try to take full advantage of [CSP](/en-US/docs/Web/HTTP/Guides/CSP) protections and avoid nonces or unsafe inline scripts whenever possible.

