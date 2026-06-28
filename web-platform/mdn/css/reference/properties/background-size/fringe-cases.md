# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In Gecko, background images created using the [`element()`](/en-US/docs/Web/CSS/Reference/Values/element) function are currently treated as images with the dimensions of the element, or of the background positioning area if the element is SVG, with the corresponding intrinsic proportion. This is non-standard behavior.

  > [!NOTE]
  > SVG images have a [`preserveAspectRatio`](/en-US/docs/Web/SVG/Reference/Attribute/preserveAspectRatio) attribute that defaults to the equivalent of `contain`; an explicit `background-size` causes `preserveAspectRatio` to be ignored.

> [!NOTE]
> Background sizing for vector images that lack intrinsic dimensions or proportions is not yet fully implemented in all browsers.
> Be careful about relying on the behavior described above, and test in multiple browsers to be sure the results are acceptable.

