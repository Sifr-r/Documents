# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This interface is only available when the global scope is a {{domxref("ServiceWorkerGlobalScope")}}. It is not available when it is a {{domxref("Window")}}, or the scope of another kind of worker.

> [!NOTE]
> In Chrome, logging statements are visible via the "Inspect" interface for the relevant service worker accessed via chrome://serviceworker-internals.

> [!NOTE]
> When fetching resources, it's very important to use `{mode: 'no-cors'}` if there is any chance that the resources are served off of a server that doesn't support {{glossary("CORS")}}. In this example, [www.chromium.org](https://www.chromium.org/) doesn't support CORS.

