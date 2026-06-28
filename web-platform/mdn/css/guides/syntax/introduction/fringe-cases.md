# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The content of a CSS declaration block, that is a list of semicolon-separated declarations, without the initial and closing braces, can be put inside an HTML [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) attribute.

> [!NOTE]
> It is important to note that even if a ruleset characterized by a group of selectors is a kind of shorthand replacing rulesets with a single selector each, this doesn't apply to the validity of the ruleset itself.
>
> This leads to an important consequence: if one single basic selector is invalid, like when using an unknown pseudo-element or pseudo-class, the whole _selector_ is invalid and therefore the entire rule is ignored (as invalid too).

