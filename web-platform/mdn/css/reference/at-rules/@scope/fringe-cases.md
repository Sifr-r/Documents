# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This kind of scoping — with an upper and lower bound — is commonly referred to as a **donut scope**.

> [!NOTE]
> It is important to understand that, while `@scope` allows you to isolate the application of selectors to specific DOM subtrees, it does not completely isolate the applied styles to within those subtrees. This is most noticeable with inheritance — properties that are inherited by children (for example {{cssxref("color")}} or {{cssxref("font-family")}}) will still be inherited, beyond any set scope limit.

> [!WARNING]
> The specificity of `&` inside `@scope` blocks is handled differently according to the browser engine and release version.
> Check [Browser compatibility](#browser_compatibility) for details.

> [!NOTE]
> Scoping proximity overrules source order but is itself overridden by other, higher-priority criteria such as [importance](/en-US/docs/Web/CSS/Reference/Values/important), [layers](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers), and [specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity).

