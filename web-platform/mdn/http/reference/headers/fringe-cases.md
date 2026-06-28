# Fringe Cases

## Warnings & Notes

> [!NOTE]
> User-agent client hints are not available inside [fenced frames](/en-US/docs/Web/API/Fenced_frame_API) because they rely on [permissions policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) delegation, which could be used to leak data.

## Security Notes

- {{HTTPHeader("Cross-Origin-Embedder-Policy")}} (COEP)
  - : Allows a server to declare an embedder policy for a given document.
- {{HTTPHeader("Cross-Origin-Opener-Policy")}} (COOP)
  - : Prevents other domains from opening/controlling a window.
- {{HTTPHeader("Cross-Origin-Resource-Policy")}} (CORP)
  - : Prevents other domains from reading the response of the resources to which this header is applied. See also [CORP explainer article](/en-US/docs/Web/HTTP/Guides/Cross-Origin_Resource_Policy).
- {{HTTPHeader("Content-Security-Policy")}} ({{Glossary("CSP")}})
  - : Controls resources the user agent is allowed to load for a given page.
- {{HTTPHeader("Content-Security-Policy-Report-Only")}}
  - : Allows web developers to experiment with policies by monitoring, but not enforcing, their effects. These violation reports consist of {{Glossary("JSON")}} documents sent via an HTTP `POST` request to the specified URI.
- {{HTTPHeader("Expect-CT")}} {{deprecated_inline}}
  - : Lets sites opt in to reporting and enforcement of [Certificate Transparency](/en-US/docs/Web/Security/Defenses/Certificate_Transparency) to detect use of misissued certificates for that site.
- {{HTTPHeader("Permissions-Policy")}}
  - : Provides a mechanism to allow and deny the use of browser features in a website's own frame, and in {{htmlelement("iframe")}}s that it embeds.
- {{HTTPHeader("Reporting-Endpoints")}} {{experimental_inline}}
  - : Response header that allows website owners to specify one or more endpoints used to receive errors such as CSP violation reports, {{HTTPHeader("Cross-Origin-Opener-Policy")}} reports, or other generic violations.
- {{HTTPHeader("Strict-Transport-Security")}} ({{Glossary("HSTS")}})
  - : Force communication using HTTPS instead of HTTP.
- {{HTTPHeader("Upgrade-Insecure-Requests")}}
  - : Sends a signal to the server expressing the client's preference for an encrypted and authenticated response, and that it can successfully handle the {{CSP("upgrade-insecure-requests")}} directive.
- {{HTTPHeader("X-Content-Type-Options")}}
  - : Disables MIME sniffing and forces browser to use the type given in {{HTTPHeader("Content-Type")}}.
- {{HTTPHeader("X-Frame-Options")}} (XFO)
  - : Indicates whether a browser should be allowed to render a page in a {{HTMLElement("frame")}}, {{HTMLElement("iframe")}}, {{HTMLElement("embed")}} or {{HTMLElement("object")}}.
- {{HTTPHeader("X-Permitted-Cross-Domain-Policies")}}
  - : A cross-domain policy file may grant clients, such as Adobe Acrobat or Apache Flex (among others), permission to handle data across domains that would otherwise be restricted due to the [Same-Origin Policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy).
    The `X-Permitted-Cross-Domain-Policies` header overrides such policy files so that clients still block unwanted requests.
- {{HTTPHeader("X-Powered-By")}}
  - : May be set by hosting environments or other frameworks and contains information about them while not providing any usefulness to the application or its visitors. Unset this header to avoid exposing potential vulnerabilities.
- {{HTTPHeader("X-XSS-Protection")}}
  - : Enables cross-site scripting filtering.

### Fetch metadata request headers

{{Glossary("Fetch metadata request header", "Fetch metadata request headers")}} provide information about the context from which the request originated. A server can use them to make decisions about whether a request should be allowed, based on where the request came from and how the resource will be used.

- {{HTTPHeader("Sec-Fetch-Site")}}
  - : Indicates the relationship between a request initiator's origin and its target's origin. It is a Structured Header whose value is a token with possible values `cross-site`, `same-origin`, `same-site`, and `none`.
- {{HTTPHeader("Sec-Fetch-Mode")}}
  - : Indicates the request's mode to a server. It is a Structured Header whose value is a token with possible values `cors`, `navigate`, `no-cors`, `same-origin`, and `websocket`.
- {{HTTPHeader("Sec-Fetch-User")}}
  - : Indicates whether or not a navigation request was triggered by user activation. It is a Structured Header whose value is a boolean so possible values are `?0` for false and `?1` for true.
- {{HTTPHeader("Sec-Fetch-Dest")}}
  - : Indicates the request's destination. It is a Structured Header whose value is a token with possible values `audio`, `audioworklet`, `document`, `embed`, `empty`, `font`, `image`, `manifest`, `object`, `paintworklet`, `report`, `script`, `serviceworker`, `sharedworker`, `style`, `track`, `video`, `worker`, and `xslt`.

The following request headers are not _strictly_ "fetch metadata request headers", but similarly provide information about the context of how a resource will be used. A server might use them to modify its caching behavior, or the information that is returned:

- {{HTTPHeader("Sec-Purpose")}}
  - : Indicates the purpose of the request, when the purpose is something other than immediate use by the user-agent. The header currently has one possible value, `prefetch`, which indicates that the resource is being fetched preemptively for a possible future navigation.
- {{HTTPHeader("Service-Worker-Navigation-Preload")}}
  - : A request header sent in preemptive request to {{domxref("Window/fetch", "fetch()")}} a resource during service worker boot. The value, which is set with {{domxref("NavigationPreloadManager.setHeaderValue()")}}, can be used to inform a server that a different resource should be returned than in a normal `fetch()` operation.


- {{HTTPHeader("Origin-Agent-Cluster")}} {{experimental_inline}}
  - : Response header used to indicate that the associated {{domxref("Document")}} should be placed in an _origin-keyed [agent cluster](https://tc39.es/ecma262/#sec-agent-clusters)_.
    This isolation allows user agents to allocate implementation-specific resources for agent clusters, such as processes or threads, more efficiently.

