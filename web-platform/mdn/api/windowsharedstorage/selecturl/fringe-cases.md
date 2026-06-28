# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The [URL Selection output gate](/en-US/docs/Web/API/Shared_Storage_API#url_selection) is used to select a URL from a provided list to display to the user, based on shared storage data.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if:
    - The worklet module has not yet been added with {{domxref("Worklet.addModule", "addModule()")}}.
    - `urls` is empty or exceeds the maximum allowed length (which is browser-specific).
    - An object's `url` property contains an invalid URL.
    - Shared storage is disabled (for example, via a browser setting).
    - The calling site does not have the Shared Storage API included in a successful [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox#enrollment).

