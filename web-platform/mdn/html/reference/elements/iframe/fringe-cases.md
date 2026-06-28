# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Because each browsing context is a complete document environment, every `<iframe>` in a page requires increased memory and other computing resources. While theoretically you can use as many `<iframe>`s as you like, check for performance problems.

    > [!NOTE]
    > A Permissions Policy specified by the `allow` attribute implements a further restriction on top of the policy specified in the {{httpheader("Permissions-Policy")}} header. It doesn't replace it.

    > [!NOTE]
    > This attribute is considered a legacy attribute and redefined as `allow="fullscreen *"`.

    > [!NOTE]
    > This attribute is considered a legacy attribute and redefined as `allow="payment *"`.

        > [!NOTE]
        > When `allow-same-origin` is present, a same-origin parent document can still access and interact with the iframe's DOM even if `allow-scripts` is not set. The `allow-scripts` token only controls script execution within the embedded browsing context and does not affect DOM access from the parent.

    > [!NOTE]
    >
    > - When the embedded document has the same origin as the embedding page, it is **strongly discouraged** to use both `allow-scripts` and `allow-same-origin`, as that lets the embedded document remove the `sandbox` attribute — making it no more secure than not using the `sandbox` attribute at all.
    > - Sandboxing is useless if the attacker can display content outside a sandboxed `iframe` — such as if the viewer opens the frame in a new tab. Such content should be also served from a _separate origin_ to limit potential damage.

    > [!NOTE]
    > When redirecting the user, opening a popup window, or opening a new tab from an embedded page within an `<iframe>` with the `sandbox` attribute, the new browsing context is subject to the same `sandbox` restrictions. This can create issues — for example, if a page embedded within an `<iframe>` without a `sandbox="allow-forms"` or `sandbox="allow-popups-to-escape-sandbox"` attribute set on it opens a new site in a separate tab, form submission in that new browsing context will silently fail.

    > [!NOTE]
    > The `about:blank` page uses the embedding document's URL as its base URL when resolving any relative URLs, such as anchor links.

    > [!NOTE]
    > The `about:srcdoc` page uses the embedding document's URL as its base URL when resolving any relative URLs, such as anchor links.

> [!NOTE]
> The {{cssxref("object-fit")}} property has no effect on `<iframe>` elements.

