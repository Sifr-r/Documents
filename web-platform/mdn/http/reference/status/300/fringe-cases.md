# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In [agent-driven content negotiation](/en-US/docs/Web/HTTP/Guides/Content_negotiation#agent-driven_negotiation), a client and server collaboratively decide the best variant of a given resource when the server has multiple variants.
> Most clients lack a method for automatically choosing from responses, and the additional round-trips slow down client-server interaction.
> [Server-driven content negotiation](/en-US/docs/Web/HTTP/Guides/Content_negotiation#server-driven_content_negotiation) is far more common, where a server chooses the most appropriate resource for the client based on the request headers ({{HTTPHeader("Accept-Language")}}, {{HTTPHeader("Accept")}}, etc.).

