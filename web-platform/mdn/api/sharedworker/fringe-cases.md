# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If SharedWorker can be accessed from several browsing contexts, all those browsing contexts must share the exact same origin (same protocol, host, and port).

> [!NOTE]
> Once a shared worker is created, any script running in the same origin can obtain a reference to that worker and communicate with it.
>
> A shared worker will remain alive as long as any open page holds a reference to it.
> The [`extendedLifetime`](/en-US/docs/Web/API/SharedWorker/SharedWorker#extendedlifetime) constructor option can be set to keep a shared worker alive for a short period after all references are closed.
> This allows the worker to perform any clean up tasks, such as writing state information to storage, or sending analytics data back to servers.
> For more information, see [Shared worker lifetime](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers#shared_worker_lifetime) in _Using web workers_.

> [!NOTE]
> You can use browser devtools to debug your SharedWorker, by entering a URL in your browser address bar to access the devtools workers inspector; for example, in Chrome, the URL `chrome://inspect/#workers`, and in Firefox, the URL `about:debugging#workers`.

