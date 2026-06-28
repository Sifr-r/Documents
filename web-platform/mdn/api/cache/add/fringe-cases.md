# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `add()` will overwrite any key/value pair previously stored in the cache that matches the request.

## Exceptions

- {{jsxref("TypeError")}}
  - : The URL scheme is not `http` or `https`.

    The Response status is not in the 200 range (i.e., not a successful response.) This occurs if the request does not return successfully, but also if the request is a _cross-origin no-cors_ request (in which case the reported status is always 0.)

