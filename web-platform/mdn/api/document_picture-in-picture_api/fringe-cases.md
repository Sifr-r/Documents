# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can run code when the always-on-top window is programmatically opened, using the {{domxref("DocumentPictureInPicture.enter_event", "enter")}} event. However, this event isn't fired when the browser itself (rather than your code) triggers moving content into the always-on-top window. This can occur, for example, due to the content being occluded, by the displayed tab being switched, or by the user selecting a "picture-in-picture" option from some relevant content's context menu or the browser chrome.
>
> To run code in response to such actions, set up a media session action handler using {{domxref("MediaSession.setActionHandler()")}} with a `type` of `enterpictureinpicture`.

