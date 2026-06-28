# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The state of being disabled applies to the element with `aria-disabled="true"` and all of its focusable descendants. Take care when using this attribute on container elements. Particularly in the case where a container may have both form controls and links - where the intent may be to expose the form controls as being in the disabled state, but <strong>not</strong> to communicate the links as being "disabled".

> [!NOTE]
> If you are using CSS's [`pointer-events: none;`](/en-US/docs/Web/CSS/Reference/Properties/pointer-events) to make an element non-clickable, make sure you disable interactivity with JavaScript as well. `pointer-events: none;` prevents mouse clicks, but does not prevent the element from being activated via the keyboard.

