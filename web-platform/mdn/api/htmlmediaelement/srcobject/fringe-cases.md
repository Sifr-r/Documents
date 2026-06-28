# Fringe Cases

## Warnings & Notes

> [!NOTE]
> As of March 2020, only Safari has full support for `srcObject`, i.e., using `MediaSource`, `MediaStream`, `Blob`, and `File` objects as values. Other browsers support `MediaStream` objects; until they catch up, consider falling back to creating a URL with {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}} and assigning it to {{domxref("HTMLMediaElement.src")}} (see below for an example). In addition, as of version 108 Chromium supports attaching a dedicated worker `MediaSource` object by assigning that object's {{domxref("MediaSourceHandle")}} instance (transferred from the worker) to `srcObject`.

> [!NOTE]
> {{domxref("MediaSourceHandle")}}s cannot be successfully transferred into or via a shared worker or service worker.

