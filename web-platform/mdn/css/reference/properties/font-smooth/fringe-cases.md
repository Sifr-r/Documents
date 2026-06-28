# Fringe Cases

## Warnings & Notes

> [!NOTE]
> WebKit implements a similar property, but with different values: **`-webkit-font-smoothing`**. It only works on macOS.
>
> - `auto` - Let the browser decide (Uses subpixel anti-aliasing when available; this is the default)
> - `none` - Turn font smoothing off; display text with jagged sharp edges.
> - `antialiased` - Smooth the font on the level of the pixel, as opposed to the subpixel. Switching from subpixel rendering to anti-aliasing for light text on dark backgrounds makes it look lighter.
> - `subpixel-antialiased` - On most non-retina displays, this will give the sharpest text.

> [!NOTE]
> Firefox implements a similar property, but with different values: **`-moz-osx-font-smoothing`**. It only works on macOS.
>
> - `auto` - Allow the browser to select an optimization for font smoothing, typically `grayscale`.
> - `grayscale` - Render text with grayscale anti-aliasing, as opposed to the subpixel. Switching from subpixel rendering to anti-aliasing for light text on dark backgrounds makes it look lighter.

