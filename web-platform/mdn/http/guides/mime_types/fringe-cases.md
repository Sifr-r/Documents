# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Browsers use the MIME type, _not the file extension_, to determine how to process a URL,
> so it's important that web servers send the correct MIME type in the response's {{HTTPHeader("Content-Type")}} header.
> If this is not correctly configured, browsers are likely to misinterpret the contents of files, sites will not work correctly, and downloaded files may be mishandled.

> [!NOTE]
> `text/plain` does not mean "any kind of textual data."
> If they expect a specific kind of textual data, they will likely not consider it a match.
> Specifically if they download a `text/plain` file from a {{HTMLElement("link")}} element declaring a CSS file, they will not recognize it as a valid CSS file if presented with `text/plain`.
> The CSS mime type `text/css` must be used.

> [!NOTE]
> Use `application/xml` or `application/xhtml+xml` if you want XML's strict parsing rules, [`<![CDATA[…]]>`](/en-US/docs/Web/API/CDATASection) sections, or elements that aren't from HTML/SVG/MathML namespaces.

> [!NOTE]
> Even though any given {{Glossary("user agent")}} may support any or all of these, you should only use `text/javascript`.
> It's the only MIME type guaranteed to work now and into the future.

