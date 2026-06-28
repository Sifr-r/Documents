# Fringe Cases

## Warnings & Notes

> [!NOTE]
> An {{domxref("Attr")}} node always returns `false` for `isConnected`, even when its {{domxref("Attr.ownerElement", "ownerElement")}} is connected.
> This is because, even though an attribute is associated with an element via `ownerElement`, it is not part of the node tree — it has no parent node, and it is its own root node.
> Since `isConnected` is only true when a node's root is a document, an `Attr` node is never considered connected.

