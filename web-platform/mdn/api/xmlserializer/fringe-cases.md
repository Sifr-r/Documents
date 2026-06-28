# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The resulting XML string is not guaranteed to be well-formed XML.

> [!NOTE]
> In the real world, you should usually instead call {{domxref("Document.importNode", "importNode()")}} method to import the new node into the DOM, then call one of the following methods to add the node to the DOM tree:
>
> - The {{domxref("Element.append()")}}/{{domxref("Element.prepend()")}} and {{domxref("Document.append()")}}/{{domxref("Document.prepend()")}} methods.
> - The {{domxref("Element.replaceWith")}} method (to replace an existing node with the new one)
> - The {{domxref("Element.insertAdjacentElement()")}} method.

