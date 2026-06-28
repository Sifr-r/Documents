# Fringe Cases

## Warnings & Notes

> [!NOTE]
> See [Fingerprinting](https://web.dev/learn/privacy/fingerprinting/) on web.dev for additional useful information.

> [!NOTE]
> The tips provided below make for a better, more privacy-aware user experience, but many of them are required by law to comply with regulations, for example the [GDPR](https://gdpr.eu/) in the EU. You should make sure to find out what regulations apply to you in your locale, and what you need to do to comply with them.

> [!NOTE]
> The {{httpheader("Clear-Site-Data")}} HTTP response header is very useful for clearing short-lived user data — it instructs the browser to clear out its cache and/or cookies and/or storage (e.g., [Web Storage](/en-US/docs/Web/API/Web_Storage_API) or [IndexedDB](/en-US/docs/Web/API/IndexedDB_API) data). For example, you might get your server to send it along with a "logged out confirmation" page so that once the user is logged out, their data is safely removed.

> [!NOTE]
> There are various tools out there that can help you build up a picture of what requests a site is making, for example the [Request Map Generator](https://requestmap.webperf.tools/).

  > [!NOTE]
  > See also [Referer header: privacy and security concerns](/en-US/docs/Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns).

  > [!NOTE]
  > See also our [Permissions-Policy guide](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) for more information and examples, and [permissionspolicy.com](https://www.permissionspolicy.com/) for useful tools including a policy generator.

> [!NOTE]
> See [Third parties](https://web.dev/learn/privacy/third-parties/) over on web.dev for additional useful information on auditing and more.

