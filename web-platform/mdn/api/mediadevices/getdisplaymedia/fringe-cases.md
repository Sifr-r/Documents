# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > You cannot set `monitorTypeSurfaces: "exclude"` at the same time as [`displaySurface: "monitor"`](/en-US/docs/Web/API/MediaTrackConstraints/displaySurface) as the two settings are contradictory.
        > Trying to do so will result in the `getDisplayMedia()` call failing with a `TypeError`.

> [!NOTE]
> For most of these options, a default value is not mandated by the spec. For standalone options, where a default is not mentioned, see the [Browser compatibility](#browser_compatibility) section for browser-specific defaults.

> [!NOTE]
> See the article [Capabilities, constraints, and settings](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints) for a lot more detail on how these options work.

> [!NOTE]
> Browser support for audio tracks varies, both in terms of whether or not they're supported at all by the media recorder and in terms of the audio sources supported.
> Check the [compatibility table](#browser_compatibility) for details for each browser.

> [!NOTE]
> The [Screen sharing controls](https://chrome.dev/screen-sharing-controls/) demo provides a complete implementation that allows you to create a screen capture with your choice of `getDisplayMedia()` constraints and options.

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : Thrown if an error or failure does not match any of the other exceptions listed here.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the call to `getDisplayMedia()` was not made from code running due to a {{glossary("transient activation")}}, such as an event handler.
    Or if the browser context is not fully active or does not focused.
    Or if the `controller` options has been already used in creating another {{domxref("MediaStream")}}.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the permission to access a screen area was denied by the user, or the current browsing instance is not permitted access to screen sharing (for example by a [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)).
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if no sources of screen video are available for capture.
- `NotReadableError` {{domxref("DOMException")}}
  - : Thrown if the user selected a screen, window, tab, or another source of screen data, but a hardware or operating system level error or lockout occurred, preventing the sharing of the selected source.
- `OverconstrainedError` {{domxref("DOMException")}}
  - : Thrown if, after creating the stream, applying any specified constraints fails because no compatible stream could be generated.
- {{jsxref("TypeError")}}
  - : Thrown if the specified `options` include values that are not permitted when calling `getDisplayMedia()`, for example a `video` property set to false, or if any specified {{domxref("MediaTrackConstraints")}} are not permitted.
    `min` and `exact` values are not permitted in constraints used in `getDisplayMedia()` calls.

## Security Notes

Because `getDisplayMedia()` could be used in nefarious ways, it can be a source of significant privacy and security concerns.
For that reason, the specification details measures browsers are required to take in order to fully support `getDisplayMedia()`.

- The specified options can't be used to limit the choices available to the user.
  Instead, they must be applied after the user chooses a source, in order to generate output that matches the options.
- The go-ahead permission to use `getDisplayMedia()` cannot be persisted for reuse.
  The user must be prompted for permission every time.
- [Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required.
  The user has to interact with the page or a UI element in order for this feature to work.
- Browsers are encouraged to provide a warning to users about sharing displays or windows that contain browsers, and to keep a close eye on what other content might be getting captured and shown to other users.

