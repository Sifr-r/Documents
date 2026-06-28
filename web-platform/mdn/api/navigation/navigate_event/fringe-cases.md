# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Before the Navigation API was available, to do something similar you'd have to listen for all click events on links, run `event.preventDefault()`, perform the appropriate {{domxref("History.pushState()")}} call, then set up the page view based on the new URL. And this wouldn't handle all navigations — only user-initiated link clicks.

