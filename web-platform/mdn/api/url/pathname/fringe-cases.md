# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Percent-encoding trailing spaces in opaque paths is not widely implemented. Some browsers implement the old behavior of stripping trailing spaces from `pathname` whenever the `hash` and `search` properties are both empty strings. In these browsers, setting `hash` or `search` may change the `pathname` as well. In even older browsers, the trailing space remains after removing hash and search, causing [serialization and parsing to not round-trip](#pathname_with_opaque_path).

