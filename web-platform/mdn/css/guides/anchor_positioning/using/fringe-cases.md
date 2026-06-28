# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The methods above associate an anchor with an element, but they are not yet tethered. To tether them together, the positioned element needs to be positioned relative to its anchor, which is done with CSS.

> [!NOTE]
> CSS anchor positioning also provides mechanisms for specifying fallback positions if the positioned element's default position causes it to overflow the viewport. See the [Fallback options and conditional hiding](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding) guide for details.

> [!NOTE]
> The anchor element must be a visible DOM node for the association and positioning to work. If it is hidden (for example via [`display: none`](/en-US/docs/Web/CSS/Reference/Properties/display#none)), the positioned element will be positioned relative to its nearest positioned ancestor. We discuss how to hide an anchor-positioned element when its anchor disappears in [Conditional hiding using `position-visibility`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding#conditionally_hiding_anchor-positioned_elements).

    > [!NOTE]
    > Specifying an `<anchor-name>` positions the element relative to that anchor, but does not provide element association. While you can position an element's sides relative to multiple anchors by specifying [different `<anchor-name>` values](/en-US/docs/Web/CSS/Reference/Values/anchor#positioning_an_element_relative_to_multiple_anchors) inside different `anchor()` functions on the same element, the positioned element is only associated with a single anchor.

> [!NOTE]
> See the [`<position-area>`](/en-US/docs/Web/CSS/Reference/Values/position-area_value) value reference page for a detailed description of all the available values. Mixing a logical value with a physical value will invalidate the declaration.

