# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Support for the rule was added with {{domxref("CSSNestedDeclarations")}}.
> Browsers that [do not support this interface](/en-US/docs/Web/API/CSSNestedDeclarations#browser_compatibility) may parse nested rules in the wrong order.

> [!WARNING]
> This is not possible in CSS nesting: when a [combinator](/en-US/docs/Learn_web_development/Core/Styling_basics/Combinators) is not used, the nested selector is treated as a [type selector](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors). Allowing concatenation would break this.

