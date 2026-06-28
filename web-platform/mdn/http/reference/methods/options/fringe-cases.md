# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Both {{HTTPStatus("200", "200 OK")}} and {{HTTPStatus("204", "204 No Content")}} are [permitted status codes](https://fetch.spec.whatwg.org/#ref-for-ok-status), but some browsers incorrectly believe `204 No Content` applies to the resource and do not send a subsequent request to fetch it.

