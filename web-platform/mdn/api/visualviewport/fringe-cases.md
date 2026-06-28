# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Only the top-level window has a visual viewport that's distinct from the layout viewport.
> Therefore, it's generally only the `VisualViewport` object of the top-level window that's useful.
> For an {{htmlelement("iframe")}}, visual viewport metrics like {{domxref("VisualViewport.width")}} always correspond to layout viewport metrics like {{domxref("Element.clientWidth", "document.documentElement.clientWidth")}}.

> [!NOTE]
> This technique should be used with care; emulating `position: device-fixed` in this way can result in the fixed element flickering during scrolling.

