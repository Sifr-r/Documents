# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > The `NodeFilter.SHOW_ATTRIBUTE` constant is only effective when the root is an attribute node. Since the parent of any `Attr` node is always `null`, {{DOMXref("TreeWalker.nextNode()")}} and {{DOMXref("TreeWalker.previousNode()")}} will never return an `Attr` node. To traverse `Attr` nodes, use {{DOMXref("Element.attributes")}} instead.

