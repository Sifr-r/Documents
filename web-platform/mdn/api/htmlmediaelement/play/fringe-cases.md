# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Browsers released before 2019 may not return a value from
> `play()`.

> [!NOTE]
> The `play()` method may cause the user to be asked
> to grant permission to play the media, resulting in a possible delay before the
> returned promise is resolved. Be sure your code doesn't expect an immediate response.

## Exceptions

The promise's **rejection handler** is called with a {{domxref("DOMException")}} object
passed in as its sole input parameter (as opposed to a traditional exception being
thrown). Possible errors include:

- `NotAllowedError` {{domxref("DOMException")}}
  - : Provided if the user agent (browser) or operating system doesn't allow playback of media in the
    current context or situation. The browser may require the user to explicitly start
    media playback by clicking a "play" button, for example because of a [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- `NotSupportedError` {{domxref("DOMException")}}
  - : Provided if the media source (which may be specified as a {{domxref("MediaStream")}},
    {{domxref("MediaSource")}}, {{domxref("Blob")}}, or {{domxref("File")}}, for example)
    doesn't represent a supported media format.

Other exceptions may be reported, depending on browser implementation details, media
player implementation, and so forth.

