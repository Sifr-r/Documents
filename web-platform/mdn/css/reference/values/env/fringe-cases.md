# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Be careful using `env(preferred-text-scale)` when `<meta name="text-scale" content="scale">` is set as this will result in text scaling being applied twice when combined with relative sizes, such as `em` and `rem`. For example, when the `<meta>` is set, a declaration such as `font-size: calc(2rem * env(preferred-text-scale))` will cause small font sizes to be made even smaller and large font sizes larger.

> [!NOTE]
> Using `position:fixed` makes sure the header does not scroll with the rest of the content, and instead stays aligned with the window control buttons, even on device/browsers that support elastic overscroll (also known as rubber banding).

