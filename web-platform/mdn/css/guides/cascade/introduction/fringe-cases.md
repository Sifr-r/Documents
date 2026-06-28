# Fringe Cases

## Warnings & Notes

> [!NOTE]
> **Transitions and animations**
>
> Property values set by animation {{cssxref('@keyframes')}} are more important than all normal styles (those with no [`!important`](/en-US/docs/Web/CSS/Guides/Cascade/Specificity#the_!important_exception) set).
>
> Property values being set in a {{cssxref('transition')}} take precedence over all other values set, even those marked with `!important`.

> [!NOTE]
> The declaration defined in the user CSS, while it may have greater specificity, is not chosen as the cascade algorithm's _origin and importance_ is applied before the _specificity_ algorithm. The declaration defined in a cascade layer, though it may come later in the code, will not take precedence either as normal styles in cascade layers have less precedence than normal unlayered styles. _Order of appearance_ only matters when both origin, importance, and specificity are equal.

> [!NOTE]
> The `!important` flag reverses the precedence of cascade layers. For this reason, try not to use `!important` to override external styles. Instead, use {{cssxref("@import")}} together with the `layer` keyword or `layer()` function to import external stylesheets (from frameworks, widget stylesheets, libraries, etc.) into layers. Importing stylesheets into a layer as the first declaration in your CSS demotes their precedence, and author-defined layers, defined later in your CSS, will have higher precedence. The `!important` flag should only be used sparingly, if ever, to guard required styles against later overrides, in the first declared layer.

> [!NOTE]
> There are no important animations, as property declarations in a {{cssxref('@keyframes')}} block that contain `!important` as part of the value are ignored.

