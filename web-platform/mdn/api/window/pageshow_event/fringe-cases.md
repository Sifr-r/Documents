# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Despite the name, the `pageshow` event does not fire when the page is actually _shown_ to the user. For example, it may be opened in a background tab or prerendered. If you are interested in responding to the page being shown to the user, use the following events:
>
> - {{domxref("window/pagereveal_event", "pagereveal")}}: Sent when a page is first rendered.
> - {{domxref("document/visibilitychange_event", "visibilitychange")}}: Sent each time a page's visibility changes.
> - {{domxref("document/prerenderingchange_event", "prerenderingchange")}}: Sent when a prerendered page is activated.

> [!NOTE]
> During the initial page load, the `pageshow` event fires _after_ the {{domxref("Window/load_event", "load")}} event.

