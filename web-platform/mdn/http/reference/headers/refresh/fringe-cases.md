# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Even though it's present in the HTTP response, the `Refresh` header is still handled by the HTML loading machinery and happens after HTTP or JavaScript redirects. See [redirection order of precedence](/en-US/docs/Web/HTTP/Guides/Redirections#order_of_precedence) for more information.

> [!NOTE]
> When a refresh redirects to a new page, the {{httpheader("Referer")}} header is included in the request for the new page (if permitted by the {{httpheader("Referrer-Policy")}}), and {{domxref("document.referrer")}} is set to the referrer URL after navigating.

> [!NOTE]
> See the [`http-equiv="refresh"`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv#refresh) attribute in the HTML reference for important information about accessibility implications of automatic redirects.

