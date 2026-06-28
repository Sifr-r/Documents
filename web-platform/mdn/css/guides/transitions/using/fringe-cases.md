# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `auto` value is often a very complex case. The specification recommends not animating from and to `auto`. Some user agents, like those based on Gecko, implement this requirement and others, like those based on WebKit, are less strict. Using animations with `auto` may lead to unpredictable results, depending on the browser and its version, and should be avoided.

> [!NOTE]
> Care should be taken when using a transition immediately after:
>
> - adding the element to the DOM using `.appendChild()`
> - removing an element's `display: none;` property.
>
> This is treated as if the initial state had never occurred and the element was always in its final state. One way to overcome this limitation is to apply a `setTimeout()` of a handful of milliseconds before changing the CSS property you intend to transition to.

> [!NOTE]
> The `transitionend` event doesn't fire if the transition is aborted before the transition is completed because either the element is made {{cssxref("display", "display: none")}} or the animating property's value is changed.

