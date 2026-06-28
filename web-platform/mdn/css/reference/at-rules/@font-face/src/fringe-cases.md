# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > For OpenType and TrueType fonts, `<font-face-name>` is used to match either the Postscript name or the full font name in the name table of locally available fonts. Which type of name is used varies by platform and font, so you should include both of these names to assure proper matching across platforms. Platform substitutions for a given font name must not be used.

    > [!NOTE]
    > Locally available fonts may have been preinstalled on the user's device, or may have been actively installed by the user.
    >
    > While the set of preinstalled fonts is likely to be the same for all users of a particular device, the set of user-installed fonts is not. By discovering the set of user-installed fonts, a site can therefore build a {{glossary("fingerprinting", "fingerprint")}} for the device, helping the site to track users across the web.
    >
    > To prevent this, user agents may ignore user-installed fonts when using `local()`.

> [!NOTE]
> The {{domxref("Local Font Access API", "Local Font Access API", "", "nocode")}} can be used to access the user's locally installed font data — this includes higher-level details such as names, styles, and families, as well as the raw bytes of the underlying font files.

> [!NOTE]
> Values within descriptors that the browser considers invalid are ignored.
> Some browsers will ignore the whole descriptor if any item is invalid, even if only one item is invalid.
> This may affect design of fallbacks.
> See [Browser compatibility](#browser_compatibility) for more information.

> [!NOTE]
>
> - `format(svg)` stands for [SVG fonts](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Using_fonts), and `tech(color-SVG)` stands for [OpenType fonts with SVG table](https://learn.microsoft.com/en-us/typography/opentype/spec/svg) (also called OpenType-SVG color fonts), which are completely different.
> - The `opentype` and `truetype` values are equivalent whether the font file uses cubic bezier curves (within CFF/CFF2 table) or quadratic bezier curves (within glyph table).

