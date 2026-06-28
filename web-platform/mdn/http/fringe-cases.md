# Fringe Cases

## Security Notes

- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
  - : Permissions Policy provides mechanisms for web developers to explicitly declare what functionality can and cannot be used on a website.
    You define a set of "policies" that restrict what APIs the site's code can access or modify the browser's default behavior for certain features.
- [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
  - : Cross-site HTTP requests are requests for resources from a different domain than that of the resource making the request.
    Web pages today very commonly load cross-site resources, for example, a page 'Domain A' (`http://domaina.example/`) requests an image on 'Domain B' (`http://domainb.foo/image.jpg`) via the `img` element.
    CORS allows web developers to control how their site reacts to cross-site requests.
- [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP)
  - : CSP allows website administrators to use the {{HTTPHeader("Content-Security-Policy")}} response header to control which resources the client is allowed to load for a given page.
    The CSP guide describes the overall Content Security Policy mechanism which helps detect and mitigate certain types of attacks, including Cross-Site Scripting (XSS) and data injection attacks.
- [Cross-Origin Resource Policy (CORP)](/en-US/docs/Web/HTTP/Guides/Cross-Origin_Resource_Policy)
  - : CORP lets websites and applications opt in to protection against specific requests from other origins (such as those issued with elements like `<script>` and `<img>`), to mitigate speculative side-channel attacks.
- [Mozilla web security guidelines](https://infosec.mozilla.org/guidelines/web_security)
  - : A collection of tips to help operational teams with creating secure web applications.

