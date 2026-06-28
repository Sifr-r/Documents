# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If an HTML element renders and has `tabindex` attribute with any valid integer value, the element can be focused with JavaScript (by calling the [`focus()`](/en-US/docs/Web/API/HTMLElement/focus) method) or visually by clicking with the mouse. The particular `tabindex` value controls whether the element is `tabbable` (i.e., reachable via sequential keyboard navigation, usually with the <kbd>Tab</kbd> key).

  > [!NOTE]
  > `tabindex="-1"` may be useful for elements that should not be navigated to directly using the <kbd>Tab</kbd> key, but need to have keyboard focus set to them. Examples include an off-screen modal window that should be focused when it comes into view, or a form submission error message that should be immediately focused when an errant form is submitted.

  > [!WARNING]
  > You are recommended to only use `0` and `-1` as `tabindex` values. Avoid using `tabindex` values greater than `0` and CSS properties that can change the order of focusable HTML elements ([Ordering flex items](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Ordering_items)). Doing so makes it difficult for people who rely on using keyboard for navigation or assistive technology to navigate and operate page content. Instead, write the document with the elements in a logical sequence.

> [!WARNING]
> The tabindex attribute must not be used on the {{HTMLElement("dialog")}} element.

