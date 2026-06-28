# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The {{domxref("Node.cloneNode()")}} can be used to make a copy
> of the node before appending it under the new parent. Note that the copies made with
> `cloneNode()` will not be automatically kept in sync.

    > [!NOTE]
    > `referenceNode` is **not** an optional parameter.
    > You must explicitly pass a {{domxref("Node")}} or `null`.
    > Failing to provide it or passing invalid values may [behave](https://crbug.com/419780) [differently](https://bugzil.la/119489) in different browser versions.

> [!NOTE]
> There is no `insertAfter()` method.
> It can be emulated by combining the `insertBefore` method
> with {{domxref("Node.nextSibling")}}.
>
> In the previous example, `sp1` could be inserted after `sp2` using:
>
> ```js
> parentDiv.insertBefore(sp1, sp2.nextSibling);
> ```
>
> If `sp2` does not have a next sibling, then it must be the last child —
> `sp2.nextSibling` returns `null`, and `sp1` is inserted
> at the end of the child node list (immediately after `sp2`).

## Exceptions

Pre-insert validity

