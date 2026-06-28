# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > `originalOpener` is set once when the context is created. It never changes and always retains the opener's context ID. This differs from the JavaScript [`window.opener`](/en-US/docs/Web/API/Window/opener) property, which references the window that opened the current window — it becomes `null` if the [`rel=noopener`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noopener) attribute is used on the link or if the [`noopener`](/en-US/docs/Web/API/Window/open#noopener) window feature is specified in {{domxref("window.open()")}}.

