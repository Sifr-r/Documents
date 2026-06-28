# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When we talk about third-party cookies in the content of the Storage Access API, we implicitly mean [_unpartitioned_](/en-US/docs/Web/API/Storage_Access_API#unpartitioned_versus_partitioned_cookies) third-party cookies.

> [!NOTE]
> `requestStorageAccess()` requests are automatically denied unless the embedded content is currently processing a user gesture such as a tap or click ({{Glossary("transient activation")}}), or if permission was already granted previously. If permission was not previously granted, `requestStorageAccess()` requests must be run inside a user gesture-based event handler, as shown above.

> [!NOTE]
> Unlike with `requestStorageAccess()`, Chrome doesn't check for an interaction in a top-level document within the last 30 days when `requestStorageAccessFor()` is called because the user is already on the page. See [Browser-specific variations > Chrome](/en-US/docs/Web/API/Storage_Access_API#chrome) for more details of this behavior.

