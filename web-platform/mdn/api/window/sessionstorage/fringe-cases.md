# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Please refer to the [Using the Web Storage API](/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API) article for a full example.

## Exceptions

- `SecurityError`
  - : Thrown in one of the following cases:
    - The origin is not [a valid scheme/host/port tuple](/en-US/docs/Web/Security/Defenses/Same-origin_policy#definition_of_an_origin). This can happen if the origin uses the `file:` or `data:` schemes, for example.
    - The request violates a policy decision. For example, the user has configured the browsers to prevent the page from persisting data.

    Note that if the user blocks cookies, browsers will probably interpret this as an instruction to prevent the page from persisting data.

