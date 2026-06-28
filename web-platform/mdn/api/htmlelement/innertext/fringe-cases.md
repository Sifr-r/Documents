# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `innerText` is easily confused with {{domxref("Node.textContent")}}, but there are important differences between the two.
> Basically, `innerText` is aware of the rendered appearance of text, while `textContent` is not.

> [!WARNING]
> Setting `innerText` on a node removes _all_ of the node's children and replaces them with a single text node with the given string value.

