# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Although `insertRule()` is exclusively a method of
> {{domxref("CSSStyleSheet")}}, it actually inserts the rule into
> `{{domxref("CSSStyleSheet", "", "", "1")}}.cssRules` — its internal
> {{domxref("CSSRuleList")}}.

## Exceptions

- `IndexSizeError` {{domxref("DOMException")}}
  - : Thrown if `index` > `{{domxref("CSSRuleList", "", "", "1")}}.length`.
- `HierarchyRequestError` {{domxref("DOMException")}}
  - : Thrown if `rule` cannot be inserted at the specified index due to some CSS constraint; for instance: trying to insert an {{cssxref("@import")}} at-rule after a style rule.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if more than one rule is given in the `rule` parameter.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if `rule` is {{cssxref("@namespace")}} and the [rule-list](/en-US/docs/Web/CSS/Reference/Values/rule-list) contains at-rules other than `@import` and `@namespace` at-rules.

