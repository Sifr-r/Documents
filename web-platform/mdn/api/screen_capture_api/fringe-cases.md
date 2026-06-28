# Fringe Cases

## Security Notes

Websites that support [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) (either using the HTTP {{HTTPHeader("Permissions-Policy")}} header or the {{HTMLElement("iframe")}} attribute [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow)) can specify a desire to use the Screen Capture API using the directive {{HTTPHeader("Permissions-Policy/display-capture", "display-capture")}}:

```html
<iframe allow="display-capture" src="/some-other-document.html">…</iframe>
```

A site can also specify a desire to use the [Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control) via the {{HTTPHeader("Permissions-Policy/captured-surface-control", "captured-surface-control")}} directive. Specifically, the {{domxref("CaptureController.forwardWheel", "forwardWheel()")}}, {{domxref("CaptureController.increaseZoomLevel", "increaseZoomLevel()")}}, {{domxref("CaptureController.decreaseZoomLevel", "decreaseZoomLevel()")}}, and {{domxref("CaptureController.resetZoomLevel", "resetZoomLevel()")}} methods are controlled by this directive.

The default allowlist for both directives is `self`, which permits any content within the same origin use Screen Capture.

These methods are considered _powerful features_, which means that even if permission is allowed via a `Permissions-Policy`, the user will still be prompted for permission to use them. The [Permissions API](/en-US/docs/Web/API/Permissions_API) can be used to query the aggregate permission (from both the website and the user) for using the listed features.

In addition, the specification requires that a user has recently interacted with the page to use these features — this means that [transient activation](/en-US/docs/Glossary/Transient_activation) is required. See the individual method pages for more details.

