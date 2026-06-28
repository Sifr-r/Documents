# Fringe Cases

## Warnings & Notes

> [!WARNING]
    > This directive is intended to replace [`report-uri`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/report-uri); in browsers that support `report-to`, the `report-uri` directive is ignored.
    > However until `report-to` is broadly supported you should specify both headers as shown (where `endpoint_name` is the name of a separately provided endpoint):
    >
    > ```http
    > Content-Security-Policy: …; report-uri https://endpoint.example.com; report-to endpoint_name
    > ```

> [!NOTE]
> Nonce source expressions are only applicable to {{htmlelement("script")}} and {{htmlelement("style")}} elements.

> [!NOTE]
> Hash source expressions are only applicable to {{htmlelement("script")}} and {{htmlelement("style")}} elements.

> [!NOTE]
> Developers should avoid using `trusted-types-eval` or these methods unless absolutely necessary.
> Trusted types ensure that the input passes through a transformation function — they don't ensure that the transformation makes the input safe (and this can be very hard to get right).

> [!WARNING]
> Developers should avoid `'unsafe-eval'`, because it defeats much of the purpose of having a CSP.
> ['trusted-types-eval'](#trusted-types-eval) provides a "potentially" safer alternative if using these methods is necessary.

> [!WARNING]
> Developers should avoid `'unsafe-inline'`, because it defeats much of the purpose of having a CSP.

> [!WARNING]
> The `'unsafe-hashes'` value is unsafe.
>
> In particular, it enables an attack in which the content of the inline event handler attribute is injected into the document as an inline `<script>` element. Suppose the inline event handler is:
>
> ```html
> <button onclick="transferAllMyMoney()">Transfer all my money</button>
> ```
>
> If an attacker can inject an inline `<script>` element containing this code, the CSP will allow it to execute automatically.
>
> However, `'unsafe-hashes'` is much safer than `'unsafe-inline'`.

