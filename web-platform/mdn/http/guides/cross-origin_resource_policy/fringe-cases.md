# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The policy is only effective for [`no-cors`](https://fetch.spec.whatwg.org/#concept-request-mode) requests, which are issued by default for CORS-safelisted methods/headers.

> [!NOTE]
> Due to a [bug in Chrome](https://crbug.com/1074261), setting Cross-Origin-Resource-Policy can break PDF rendering, preventing visitors from being able to read past the first page of some PDFs. Exercise caution using this header in a production environment.

    > [!WARNING]
    > This is less secure than an {{Glossary("origin")}}. The [algorithm for checking if two origins are same site](https://html.spec.whatwg.org/multipage/origin.html#same-site) is defined in the HTML standard and involves checking the _registrable domain_.

