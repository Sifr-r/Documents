# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Browsers consider specificity **after** determining [cascade origin and importance](/en-US/docs/Web/CSS/Guides/Cascade/Introduction). In other words, for competing property declarations, specificity is relevant and compared only between selectors from the one [cascade origin and layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer) that has precedence for the property. [Scoping proximity](/en-US/docs/Web/CSS/Reference/At-rules/@scope#how_scope_conflicts_are_resolved) and order of appearance become relevant when the selector specificities of the competing declarations in the cascade layer with precedence are equal.

