# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The types set on the view transition in the `types` array can be accessed via the {{domxref("ViewTransition.types", "types")}} property of the {{domxref("ViewTransition")}} object returned by the `startViewTransition()` method. The `types` property is a {{domxref("ViewTransitionTypeSet")}}. This is a [Set-like object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis), which means you can modify the types applied to a view transition on-the-fly using methods available on it such as `clear()`, `add()`, and `delete()`.

> [!NOTE]
> For brevity, we've not shown all of the {{cssxref("@keyframes")}} definition code for the animations referenced above. You can find these in the [source code](https://github.com/mdn/dom-examples/tree/main/view-transitions/spa-gallery-transition-types).

> [!NOTE]
> The `determineTransitionType()` function can return `undefined` if neither the `backwards` or `forwards` conditions are true. This can occur if the user reloads the page, in which case the current page and destination page are the same page, therefore the index values are the same.

