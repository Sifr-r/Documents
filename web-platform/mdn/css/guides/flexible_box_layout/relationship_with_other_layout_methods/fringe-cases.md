# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Some browsers incorrectly remove some elements with `display: contents` from the accessibility tree (but descendants will remain), removing those elements' semantics while maintaining their child content. This means the element itself may not be announced by screen readers. See [`display: contents`](/en-US/docs/Web/CSS/Reference/Properties/display#display_contents) and [`display: contents` considered harmful](https://ericwbailey.design/published/display-contents-considered-harmful/).

