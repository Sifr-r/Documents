# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This feature is currently opposed by two browser vendors. See the [Standards positions](/en-US/docs/Web/API/Topics_API#standards_positions) section below for details of opposition.

> [!NOTE]
> An [Enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox#enrollment) is required to use this feature in your applications.

> [!NOTE]
> `browsingTopics()` does not rely on HTTP headers to send topics and mark topics as observed like the other Topics API enabling features, but it is somewhat less performant. You are advised to use one of the HTTP header-using features, falling back to `browsingTopics()` only in situations where the headers cannot be modified.

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if:
    - Usage of the [Topics API](/en-US/docs/Web/API/Topics_API) is disallowed by a {{httpheader('Permissions-Policy/browsing-topics','browsing-topics')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
    - The calling site does not have the Topics API included in a successful [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox#enrollment).

