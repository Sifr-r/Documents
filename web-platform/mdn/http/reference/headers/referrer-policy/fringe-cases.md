# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The header name {{HTTPHeader("Referer")}} is a misspelling of the word "referrer". The `Referrer-Policy` header does not share this misspelling.

    > [!NOTE]
    > This is the default policy if no policy is specified, or if the provided value is invalid (see spec revision [November 2020](https://github.com/whatwg/fetch/pull/1066)). Previously the default was `no-referrer-when-downgrade`.

    > [!WARNING]
    > This policy will leak potentially-private information from HTTPS resource URLs to insecure origins. Carefully consider the impact of this setting.

> [!WARNING]
> As seen above, the `noreferrer` link relation is written without a dash. When you specify the referrer policy for the entire document with a {{HTMLElement("meta")}} element, it should be written _with_ a dash: `<meta name="referrer" content="no-referrer">`.

> [!NOTE]
> Specifying multiple values is only supported in the `Referrer-Policy` HTTP header, and not in the `referrerpolicy` attribute.

