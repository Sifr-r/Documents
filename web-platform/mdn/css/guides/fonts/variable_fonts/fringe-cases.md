# Fringe Cases

## Warnings & Notes

> [!NOTE]
> To use variable fonts on your operating system, you need to make sure that it is up to date. For example, Linux OSes need the latest Linux FreeType version, and macOS prior to High Sierra (10.13) does not support variable fonts. If your operating system is not up to date, you will not be able to use variable fonts in web pages or the Firefox Developer Tools.

> [!NOTE]
> The % symbol is not used when utilizing `font-variation-settings`.

> [!NOTE]
> Not all browsers have implemented the full syntax for font format, so test carefully. All browsers that support variable fonts will still render them if you set the format to just the file format, rather than format-variations (i.e., `woff2` instead of `woff2-variations`), but it's best to use the proper syntax if possible.

> [!NOTE]
> Supplying value ranges for `font-weight`, `font-stretch`, and `font-style` will keep the browser from attempting to render an axis outside that range if you are using the appropriate attribute (i.e., `font-weight` or `font-stretch`), but will not block you from supplying an invalid value via `font-variation-settings`, so use with care.

