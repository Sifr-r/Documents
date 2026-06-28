# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The DOM methods presented here are part of the Document Object Model (Core) level 1 specification. DOM level 1 includes both methods for generic document access and manipulation (DOM 1 Core) as well as methods specific to HTML documents (DOM 1 HTML).

> [!NOTE]
> `createTextNode()` and `appendChild()` is a simple way to include white space between the words _hello_ and _world_. Another important note is that the `appendChild` method will append the child after the last child, just like the word _world_ has been added after the word _hello_. So if you want to append a text node between _hello_ and _world_, you will need to use `insertBefore` instead of `appendChild`.

> [!NOTE]
> At the end of the script, there is a new line of code. The table's `border` property was set using another DOM method, `setAttribute()`. `setAttribute()` has two arguments: the attribute name and the attribute value. You can set any attribute of any element using the `setAttribute` method.

> [!NOTE]
> If your object is a text node, you can use the data attribute and retrieve the text content of the node.

