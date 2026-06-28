# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In this context "transition" refers to the transition between one history entry and another. It isn't related to CSS transitions.

> [!NOTE]
> You can also call {{domxref("Event.preventDefault", "preventDefault()")}} to stop the navigation entirely for most [navigation types](/en-US/docs/Web/API/NavigateEvent/navigationType#value); cancellation of traverse navigations is not yet implemented.

> [!NOTE]
> Before the Navigation API was available, to do something similar you'd have to listen for all click events on links, run `e.preventDefault()`, perform the appropriate {{domxref("History.pushState()")}} call, then set up the page view based on the new URL. And this wouldn't handle all navigations — only user-initiated link clicks.

> [!NOTE]
> The Navigation API only exposes history entries created in the current browsing context that have the same origin as the current page (e.g., not navigations inside embedded {{htmlelement("iframe")}}s, or cross-origin navigations), providing an accurate list of all previous history entries just for your app. This makes traversing the history a much less fragile proposition than with the older {{domxref("History API", "", "", "nocode")}}.

> [!NOTE]
> Check out the [Navigation API live demo](https://mdn.github.io/dom-examples/navigation-api/) ([view demo source](https://github.com/mdn/dom-examples/tree/main/navigation-api)).

