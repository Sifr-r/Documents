# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Depending on the server setup and status code you use, the server may choose to ignore a custom code in favor of a valid code that is correct for the closing reason.

> [!NOTE]
> To get the example working, you'll also need a server component. We wrote our client to work along with the Deno server explained in [Writing a WebSocket server in JavaScript (Deno)](/en-US/docs/Web/API/WebSockets_API/Writing_a_WebSocket_server_in_JavaScript_Deno), but any compatible server will do.

> [!NOTE]
> Best practice is to use secure WebSockets (`wss://`) in production apps. However, in this demo we are connecting to localhost, therefore we need to use the non-secure WebSocket protocol (`ws://`) for the example to work.

> [!NOTE]
> The {{domxref("Window.setTimeout", "setTimeout()")}} function wraps the `write()` call in a [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) block to handle any errors that can arise if the application tries to write to the stream after it has been closed.

