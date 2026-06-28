# Fringe Cases

## Warnings & Notes

> [!NOTE]
> "Document-scoped view transitions" refer to same-document view transitions, that is, transitions initiated via the {{domxref("Document.startViewTransition()")}} method.
>
> Element-scoped view transitions are initiated via the same method, called on an individual element (see {{domxref("Element.startViewTransition()")}}). Element-scoped view transitions are not available for cross-document transitions.

> [!NOTE]
> You can opt a view transition out of self-participation by setting `view-transition-name: none` on the transition root element. However, this can result in undesirable behavior, such as the transition spilling out of the root in clipping cases. If you choose to do this, test carefully and make sure the scope does not clip its contents.

