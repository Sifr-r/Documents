# Fringe Cases

## Warnings & Notes

> [!NOTE]
> It's possible for the returned promise to _neither_ resolve nor reject, as the user is not required to make a choice at all and may ignore the request.

    > [!NOTE]
    > Older versions of the specification used `SecurityError` for this instead; `SecurityError` has taken on a new meaning.

    > [!NOTE]
    > Because this error can occur even when the user has not yet granted permission to use the underlying device, it can potentially be used as a [fingerprinting](/en-US/docs/Glossary/Fingerprinting) surface.

> [!NOTE]
> If the current document isn't loaded securely, `navigator.mediaDevices` will be `undefined`, and you cannot use `getUserMedia()`.
> See [Security](#security) for more information on this and other security issues related to using `getUserMedia()`.

> [!NOTE]
> In certain cases, it may be necessary to release the current camera facing mode before you can switch to a different one.
> To ensure the camera switch, it is advisable to free up the media resources by invoking the "stop()" method on the track before requesting a different facing mode.

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : Although the user and operating system both granted access to the hardware device, and no hardware issues occurred that would cause a `NotReadableError` {{domxref("DOMException")}}, throw if some problem occurred which prevented the device from being used.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if current document is not fully active.

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if one or more of the requested source devices cannot be used at this time.
    This will happen if the browsing context is insecure (that is, the page was loaded using HTTP rather than HTTPS).
    It also happens if the user has specified that the current browsing instance is not permitted access to the device, the user has denied access for the current session, or the user has denied all access to user media devices globally.
    On browsers that support managing media permissions with [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), this error is returned if Permissions Policy is not configured to allow access to the input source(s).

    > [!NOTE]

- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if no media tracks of the type specified were found that satisfy the given constraints.
- `NotReadableError` {{domxref("DOMException")}}
  - : Thrown if, although the user granted permission to use the matching devices, a hardware error occurred at the operating system, browser, or Web page level which prevented access to the device.
- `OverconstrainedError` {{domxref("DOMException")}}
  - : Thrown if the specified constraints resulted in no candidate devices which met the criteria requested.
    The error is an object of type `OverconstrainedError`, and has a `constraint` property whose string value is the name of a constraint which was impossible to meet, and a `message` property containing a human-readable string explaining the problem.

    > [!NOTE]

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if user media support is disabled on the {{domxref("Document")}} on which `getUserMedia()` was called.
    The mechanism by which user media support is enabled and disabled is left up to the individual user agent.
- {{jsxref("TypeError")}}
  - : Thrown if the list of constraints specified is empty, or has all constraints set to `false`.
    This can also happen if you try to call `getUserMedia()` in an insecure context, since {{domxref("navigator.mediaDevices")}} is `undefined` in an insecure context.

## Security Notes

There are a number of ways security management and controls in a {{Glossary("user agent")}} can cause `getUserMedia()` to return a security-related error.

#### Permissions Policy

The two [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) directives that apply to `getUserMedia()` are `camera` and `microphone`.

For example, this HTTP header will enable use of a camera by the document and any embedded {{HTMLElement("iframe")}} elements that are loaded from the same origin:

```http
Permissions-Policy: camera=(self)
```

This will request access to the microphone for the current origin and the specific origin `https://developer.mozilla.org`:

```http
Permissions-Policy: microphone=(self "https://developer.mozilla.org")
```

If you're using `getUserMedia()` within an `<iframe>`, you can request permission just for that frame, which is clearly more secure than requesting a more general permission.
Here, indicate we need the ability to use both camera and microphone:

```html
<iframe src="https://mycode.example.net/etc" allow="camera; microphone">
</iframe>
```

#### Encryption based security

The `getUserMedia()` method is only available in [secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
A secure context is one the browser is reasonably confident contains a document which was loaded securely, using HTTPS/TLS, and has limited exposure to insecure contexts.
If a document isn't loaded in a secure context, the {{domxref("navigator.mediaDevices")}} property is `undefined`, making access to `getUserMedia()` impossible.

Attempting to access `getUserMedia()` in this situation will result in a {{jsxref("TypeError")}}.

#### Document source security

Because of the obvious security concern associated with `getUserMedia()` if used unexpectedly or without security being carefully managed, it can only be used in secure contexts.
There are a number of insecure ways to load a document that might, in turn, attempt to call `getUserMedia()`.
The following are examples of situations in which `getUserMedia()` is not permitted to be called:

- A document loaded into a sandboxed {{HTMLElement("iframe")}} element cannot call `getUserMedia()` unless the `<iframe>` has its [`sandbox`](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox) attribute set to `allow-same-origin`.
- A document loaded using a `data://` or `blob://` URL which has no origin (such as when one of these URLs is typed by the user into the address bar) cannot call `getUserMedia()`.
  These kinds of URLs loaded from JavaScript code inherit the script's permissions.
- Any other situation in which there is no origin, such as when the [`srcdoc`](/en-US/docs/Web/HTML/Reference/Elements/iframe#srcdoc) attribute is used to specify the contents of a frame.

