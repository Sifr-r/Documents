# Fringe Cases

## Security Notes

The browser's ability to fetch an icon image is governed by the Content Security Policy ({{Glossary("CSP")}}) of the manifest's owner document, specifically by the [`img-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/img-src) directive. This security aspect is related to the `src` property.

For example, if the `img-src` directive in a CSP header specifies `icons.example.com`, icons from only that domain would be fetchable. In a manifest with two icons, one from `icons.example.com/low-res` and another from `other.com/hi-res`, only the former would be fetched successfully because of CSP restrictions.

