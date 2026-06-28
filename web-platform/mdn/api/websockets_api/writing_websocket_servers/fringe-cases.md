# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Read the latest official WebSockets specification, [RFC 6455](https://datatracker.ietf.org/doc/rfc6455/?include_text=1). Sections 1 and 4-7 are especially interesting to server implementors. Section 10 discusses security and you should definitely peruse it before exposing your server.

> [!WARNING]
> The server may listen on any port it chooses, but if it chooses any port other than 80 or 443, it may have problems with firewalls and/or proxies. Browsers generally require a secure connection for WebSockets, although they may offer an exception for local devices.

> [!NOTE]
> The request-uri (`/chat` here) has no defined meaning in the spec. So, many people use it to let one server handle multiple WebSocket applications. For example, `example.com/chat` could invoke a multiuser chat app, while `/game` on the same server might invoke a multiplayer game.

> [!NOTE]
> All **browsers** send an [`Origin` header](/en-US/docs/Web/HTTP/Guides/CORS#origin). You can use this header for security (checking for same origin, automatically allowing or denying, etc.) and send a [403 Forbidden](/en-US/docs/Web/HTTP/Reference/Status/403) if you don't like what you see. This is effective against [Cross Site WebSocket Hijacking (CSWH)](https://cwe.mitre.org/data/definitions/1385.html). However, be warned that non-browser agents can send a faked `Origin`. Most applications reject requests without this header.

> [!NOTE]
> [Regular HTTP status codes](/en-US/docs/Web/HTTP/Reference/Status) can be used only before the handshake. After the handshake succeeds, you have to use a different set of codes (defined in section 7.4 of the spec).

> [!NOTE]
> This seemingly overcomplicated process exists so that it's obvious to the client whether the server supports WebSockets. This is important because security issues might arise if the server accepts a WebSockets connection but interprets the data as a HTTP request.

> [!NOTE]
> The server can send other headers like {{HTTPHeader("Set-Cookie")}}, or ask for authentication or redirects via other status codes, before sending the reply handshake.

> [!NOTE]
> If you have gotten more than one ping before you get the chance to send a pong, you only send one pong.

> [!NOTE]
> WebSocket codes, extensions, subprotocols, etc. are registered at the [IANA WebSocket Protocol Registry](https://www.iana.org/assignments/websocket/websocket.xml).

> [!NOTE]
> Extensions are explained in sections 5.8, 9, 11.3.2, and 11.4 of the spec.

> [!NOTE]
> Subprotocols are explained in sections 1.9, 4.2, 11.3.4, and 11.5 of the spec.

> [!WARNING]
> The server can't send more than one `Sec-WebSocket-Protocol` header.
> If the server doesn't want to use any subprotocol, **_it shouldn't send any `Sec-WebSocket-Protocol` header_**. Sending a blank header is incorrect. The client may close the connection if it doesn't get the subprotocol it wants.

> [!NOTE]
> To avoid name conflict, it's recommended to make your subprotocol name part of a domain string. If you are building a custom chat app that uses a proprietary format exclusive to Example Inc., then you might use this: `Sec-WebSocket-Protocol: chat.example.com`. Note that this isn't required, it's just an optional convention, and you can use any string you wish.

