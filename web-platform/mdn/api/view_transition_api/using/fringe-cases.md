# Fringe Cases

## Warnings & Notes

> [!NOTE]
     > An active view transition has an associated {{domxref("ViewTransition")}} instance (for example, returned by `startViewTransition()` in the case of same-document (SPA) transitions). The `ViewTransition` object includes several promises, allowing you to run code in response to different parts of the view transition process being reached. See [Controlling view transitions with JavaScript](#controlling_view_transitions_with_javascript) for more information.

> [!NOTE]
> If the document's [page visibility state](/en-US/docs/Web/API/Page_Visibility_API) is `hidden` (for example if the document is obscured by a window, the browser is minimized, or another browser tab is active) during a {{domxref("Document.startViewTransition()", "document.startViewTransition()")}} call, the view transition is skipped entirely.

> [!NOTE]
> It is possible to target different DOM elements with different custom view transition animations by setting a different {{cssxref("view-transition-name")}} on each one. In such cases, a `::view-transition-group()` is created for each one. See [Different animations for different elements](#different_animations_for_different_elements) for an example.

> [!NOTE]
> As you'll see later, to customize the outbound and inbound animations you need to target the {{cssxref("::view-transition-old()")}} and {{cssxref("::view-transition-new()")}} pseudo-elements with your animations, respectively.

> [!NOTE]
> Currently MPA view transitions can only be created between same-origin documents, but this restriction may be relaxed in future implementations.

> [!NOTE]
> This is also a good option for safeguarding your code — `::view-transition-group()` also animates and you could end up with different durations for the `group`/`image-pair` pseudo-elements versus the `old` and `new` pseudo-elements.

> [!NOTE]
> You can use `*` as the identifier in a pseudo-element to target all snapshot pseudo-elements, regardless of what name they have. For example:
>
> ```css
> ::view-transition-group(*) {
>   animation-duration: 2s;
> }
> ```

> [!NOTE]
> [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/) contains several other customization examples.

     > [!NOTE]
     > If the navigation has a cross-origin URL anywhere in the redirect chain, the `activation` property returns `null`.

> [!NOTE]
> We remove the `view-transition-name` values after snapshots have been taken in each case. If we left them set, they would persist in the page state saved in the [bfcache](/en-US/docs/Glossary/bfcache) upon navigation. If the back button was then pressed, the `pagereveal` event handler of the page being navigated back to would then attempt to set the same `view-transition-name` values on different elements. If multiple elements have the same `view-transition-name` set, the view transition is skipped.

> [!NOTE]
> In order to block rendering, `script`, `link`, and `style` elements with `blocking="render"` must be in the `head` of the document.

