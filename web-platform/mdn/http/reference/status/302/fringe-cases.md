# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In the [Fetch Standard](https://fetch.spec.whatwg.org/#http-redirect-fetch), when a user agent receives a `302` in response to a {{HTTPMethod("POST")}} request, it uses the {{HTTPMethod("GET")}} method in the subsequent redirection request, as permitted by the HTTP [specification](#specifications).
> To avoid user agents modifying the request, use {{HTTPStatus("307", "307 Temporary Redirect")}} instead, as altering the method after a `307` response is prohibited.
>
> In cases where you want any request method to be changed to {{HTTPMethod("GET")}}, use {{HTTPStatus("303", "303 See Other")}}.
> This is useful when you want to give a response to a {{HTTPMethod("PUT")}} method that is not the uploaded resource but a confirmation message such as: "you successfully uploaded XYZ".

