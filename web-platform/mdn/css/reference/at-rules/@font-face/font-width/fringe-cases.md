# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `font-width` descriptor is the modern replacement for the {{cssxref("@font-face/font-stretch")}} descriptor, which is a legacy alias. While `font-width` is the specification's preferred name, `font-stretch` currently has broader browser support. Check the [fallback example](#providing_a_font-stretch_fallback) and [browser compatibility](#browser_compatibility) table for details.

> [!NOTE]
> You can automate this fallback pattern using the [postcss-preset-env](https://preset-env.cssdb.org/) plugin for PostCSS, which includes the [postcss-font-width-property](https://github.com/csstools/postcss-plugins/tree/main/plugins/postcss-font-width-property) transform to convert `font-width` declarations to `font-stretch` automatically.

