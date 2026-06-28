# Fringe Cases

## Warnings & Notes

> [!NOTE]
> To see stored cookies (and other storage that a web page is using) you can use the [Storage Inspector](https://firefox-source-docs.mozilla.org/devtools-user/storage_inspector/index.html) in Firefox Developer Tools, or the [Application panel](https://developer.chrome.com/docs/devtools/progressive-web-apps) in Chrome Developer Tools.

> [!NOTE]
> Find out how to use the `Set-Cookie` header in various server-side languages/frameworks: [PHP](https://www.php.net/manual/en/function.setcookie.php), [Node.js](https://nodejs.org/docs/latest-v19.x/api/http.html#responsesetheadername-value), [Python](https://docs.python.org/3/library/http.cookies.html), [Ruby on Rails](https://api.rubyonrails.org/classes/ActionDispatch/Cookies.html).

  > [!NOTE]
  > `Expires` has been available for longer than `Max-Age`, however `Max-Age` is less error-prone, and takes precedence when both are set. The rationale behind this is that when you set an `Expires` date and time, they're relative to the client the cookie is being set on. If the server is set to a different time, this could cause errors.

  > [!NOTE]
  > If your site authenticates users, it should regenerate and resend session cookies, even ones that already exist, whenever a user authenticates. This approach helps prevent [session fixation](https://owasp.org/www-community/attacks/Session_fixation) attacks, where a third-party can reuse a user's session.

> [!NOTE]
> Depending on the application, you may want to use an opaque identifier that the server looks up rather than storing sensitive information directly in cookies, or investigate alternative authentication/confidentiality mechanisms such as [JSON Web Tokens](https://www.jwt.io/).

  > [!NOTE]
  > The `path` attribute lets you control what cookies the browser sends based on the different parts of a site.
  > It is not intended as a security measure, and [does not protect](/en-US/docs/Web/API/Document/cookie#security) against unauthorized reading of the cookie from a different path.

  > [!NOTE]
  > Cookies that are used for sensitive information should also have a short [lifetime](#removal_defining_the_lifetime_of_a_cookie).

> [!NOTE]
> On the server, the web application _must_ check for the full cookie name including the prefix. User agents _do not_ strip the prefix from the cookie before sending it in a request's {{HTTPHeader("Cookie")}} header.

> [!NOTE]
> Cookie blocking can cause some third-party components (such as social media widgets) not to function as intended. As browsers impose further restrictions on third-party cookies, developers should start to look at ways to reduce their reliance on them.

> [!NOTE]
> Companies should disclose the types of cookies they use on their sites for transparency purposes and to comply with regulations. For example, see [Google's notice on the types of cookies it uses](https://policies.google.com/technologies/cookies#types-of-cookies) and Mozilla's [Websites, Communications & Cookies Privacy Notice](https://www.mozilla.org/en-US/privacy/websites/#cookies).

## Security Notes

When you store information in cookies, by default all cookie values are visible to, and can be changed by, the end user. You really don't want your cookies to be misused — for example accessed/modified by bad actors, or sent to domains where they shouldn't be sent. The potential consequences can range from annoying — apps not working or exhibiting strange behavior — to catastrophic. A criminal could for example steal a session ID and use it to set a cookie that makes it look like they are logged in as someone else, taking control of their bank or e-commerce account in the process.

You can secure your cookies in a variety of ways, which are reviewed in this section.

### Block access to your cookies

You can ensure that cookies are sent securely and aren't accessed by unintended parties or scripts in one of two ways: with the `Secure` attribute and the `HttpOnly` attribute:

```http
Set-Cookie: id=a3fWa; Expires=Thu, 21 Oct 2021 07:28:00 GMT; Secure; HttpOnly
```

- A cookie with the `Secure` attribute is only sent to the server with an encrypted request over the HTTPS protocol. It's never sent with unsecured HTTP (except on localhost), which means {{Glossary("MitM", "man-in-the-middle")}} attackers can't access it easily. Insecure sites (with `http:` in the URL) can't set cookies with the `Secure` attribute. However, don't assume that `Secure` prevents all access to sensitive information in cookies. For example, someone with access to the client's hard disk (or JavaScript if the `HttpOnly` attribute isn't set) can read and modify the information.

- A cookie with the `HttpOnly` attribute can't be accessed by JavaScript, for example using {{domxref("Document.cookie")}}; it can only be accessed when it reaches the server. Cookies that persist user sessions for example should have the `HttpOnly` attribute set — it would be really insecure to make them available to JavaScript. This precaution helps mitigate cross-site scripting ([XSS](/en-US/docs/Web/Security/Attacks/XSS)) attacks.

> [!NOTE]

### Define where cookies are sent

The `Domain` and `Path` attributes define the _scope_ of a cookie: what URLs the cookies are sent to.

- The `Domain` attribute specifies which server can receive a cookie. If specified, cookies are available on the specified server and its subdomains. For example, if you set `Domain=mozilla.org` from `mozilla.org`, cookies are available on that domain and subdomains like `developer.mozilla.org`.

  ```http
  Set-Cookie: id=a3fWa; Expires=Thu, 21 Oct 2021 07:28:00 GMT; Secure; HttpOnly; Domain=mozilla.org
  ```

  If the `Set-Cookie` header does not specify a `Domain` attribute, the cookies are available on the server that sets it _but not on its subdomains_. Therefore, specifying `Domain` is less restrictive than omitting it.
  Note that a server can only set the `Domain` attribute to its own domain or a parent domain, not to a subdomain or some other domain.
  So, for example, a server with domain `foo.example.com` could set the attribute to `example.com` or `foo.example.com`, but not `bar.foo.example.com` or `elsewhere.com` (the cookies would still be _sent_ to subdomains such as `bar.foo.example.com` though).
  See [Invalid domains](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#invalid_domains) for more details.

- The `Path` attribute indicates a URL path that must exist in the requested URL in order to send the `Cookie` header. For example:

  ```http
  Set-Cookie: id=a3fWa; Expires=Thu, 21 Oct 2021 07:28:00 GMT; Secure; HttpOnly; Path=/docs
  ```

  The `%x2F` ("/") character is considered a directory separator, and subdirectories match as well. For example, if you set `Path=/docs`, these request paths match:
  - `/docs`
  - `/docs/`
  - `/docs/Web/`
  - `/docs/Web/HTTP`

  But these request paths don't:
  - `/`
  - `/docsets`
  - `/fr/docs`

  > [!NOTE]

### Controlling third-party cookies with `SameSite`

The [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) attribute lets servers specify whether/when cookies are sent with cross-site requests — i.e., [third-party cookies](/en-US/docs/Web/Privacy/Guides/Third-party_cookies). Cross-site requests are requests where the {{Glossary("Site", "site")}} (the registrable domain) and/or the scheme (http or https) do not match the site the user is currently visiting. This includes requests sent when links are clicked on other sites to navigate to your site, and any request sent by embedded third-party content.

`SameSite` helps to prevent leakage of information, preserving user [privacy](#privacy_and_tracking) and providing some protection against {{Glossary("CSRF", "cross-site request forgery")}} attacks. It takes three possible values: `Strict`, `Lax`, and `None`:

- `Strict` causes the browser to only send the cookie in response to requests originating from the cookie's origin site. This should be used when you have cookies relating to functionality that will always be behind an initial navigation, such as authentication or storing shopping cart information.

  ```http
  Set-Cookie: cart=110045_77895_53420; SameSite=Strict
  ```

  > [!NOTE]

- `Lax` is similar, except the browser also sends the cookie when the user _navigates_ to the cookie's origin site (even if the user is coming from a different site). This is useful for cookies affecting the display of a site — for example you might have partner product information along with an affiliate link on your website. When that link is followed to the partner website, they might want to set a cookie stating that the affiliate link was followed, which displays a reward banner and provides a discount if the product is purchased.

  ```http
  Set-Cookie: affiliate=e4rt45dw; SameSite=Lax
  ```

- `None` specifies that cookies are sent on both originating and cross-site requests. This is useful if you want to send cookies along with requests made from third-party content embedded in other sites, for example, ad-tech or analytics providers. Note that if `SameSite=None` is set then the `Secure` attribute must also be set — `SameSite=None` requires a _secure context_.

  ```http
  Set-Cookie: widget_session=7yjgj57e4n3d; SameSite=None; Secure; HttpOnly
  ```

If no `SameSite` attribute is set, the cookie is treated as `Lax` by default.

### Cookie prefixes

Because of the design of the cookie mechanism, a server can't confirm that a cookie was set from a secure origin or even tell _where_ a cookie was originally set.

An application on a subdomain can set a cookie with the `Domain` attribute, which gives access to that cookie on all other subdomains. This mechanism can be abused in a [session fixation](https://owasp.org/www-community/attacks/Session_fixation) attack.

As a [defense-in-depth measure](<https://en.wikipedia.org/wiki/Defense_in_depth_(computing)>), you can use _cookie prefixes_ to impose specific restrictions on a cookie's attributes in supporting user-agents. All cookie prefixes start with a double-underscore (`__`) and end in a dash (`-`). Four prefixes are available:

- **`__Secure-`**: Cookies with names starting with `__Secure-` must be set with the `Secure` attribute by a secure page (HTTPS).
- **`__Host-`**: Cookies with names starting with `__Host-` must be set with the `Secure` attribute by a secure page (HTTPS). In addition, they must not have a `Domain` attribute specified, and the `Path` attribute must be set to `/`. This guarantees that such cookies are only sent to the host that set them, and not to any other host on the domain. It also guarantees that they are set host-wide and cannot be overridden on any path on that host. This combination yields a cookie that is as close as can be to treating the origin as a security boundary.
- **`__Http-`**: Cookies with names starting with `__Http-` must be set with the `Secure` flag by a secure page (HTTPS) and in addition must have the `HttpOnly` attribute set to prove that they were set via the `Set-Cookie` header (they can't be set or modified via JavaScript features such as {{domxref("Document.cookie")}} or the [Cookie Store API](/en-US/docs/Web/API/Cookie_Store_API)).
- **`__Host-Http-`**: Cookies with names starting with `__Host-Http-` must be set with the `Secure` flag by a secure page (HTTPS) and must have the `HttpOnly` attribute set to prove that they were set via the `Set-Cookie` header. In addition, they also have the same restrictions as `__Host-`-prefixed cookies. This combination yields a cookie that is as close as can be to treating the origin as a security boundary while at the same time ensuring developers and server operators know that its scope is limited to HTTP requests.

The browser will reject cookies with these prefixes that don't comply with their restrictions. As the application server only checks for a specific cookie name when determining if the user is authenticated or a CSRF token is correct, this effectively acts as a defense measure against [session fixation](https://owasp.org/www-community/attacks/Session_fixation).

> [!NOTE]

For more information about cookie prefixes and the current state of browser support, see the [Prefixes section of the Set-Cookie reference article](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#cookie_prefixes).

