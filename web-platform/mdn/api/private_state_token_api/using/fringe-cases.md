# Fringe Cases

## Warnings & Notes

> [!NOTE]
   > Private state tokens are not a replacement for CAPTCHAs or other trust establishing mechanisms. Private state tokens provide a way to _convey_ trust in a user, not _establish_ trust in a user.

> [!NOTE]
> This process is run by Google and controls token issuance via Chromium browsers; other implementations may choose to use a different process.

> [!NOTE]
> You can also issue token operation requests using:
>
> - {{domxref("XMLHttpRequest")}} with the `privateToken` specified inside an {{domxref("XMLHttpRequest.setPrivateToken()")}} call
> - {{htmlelement("iframe")}} elements with the `privateToken` included as a string inside the [`privateToken`](/en-US/docs/Web/HTML/Reference/Elements/iframe#privatetoken) attribute.

