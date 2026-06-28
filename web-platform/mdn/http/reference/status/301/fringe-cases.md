# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In the [Fetch Standard](https://fetch.spec.whatwg.org/#http-redirect-fetch), when a user agent receives a `301` in response to a {{HTTPMethod("POST")}} request, it uses the {{HTTPMethod("GET")}} method in the subsequent redirection request, as permitted by the HTTP [specification](#specifications).
> To avoid user agents modifying the request, use {{HTTPStatus("308", "308 Permanent Redirect")}} instead, as altering the method after a `308` response is prohibited.

