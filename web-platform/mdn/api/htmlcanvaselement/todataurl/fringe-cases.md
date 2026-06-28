# Fringe Cases

## Warnings & Notes

> [!WARNING]
> `toDataURL()` encodes the whole image in an in-memory string. For larger images, this can have performance implications, and may even overflow browsers' URL length limit when assigned to {{domxref("HTMLImageElement.src")}}. You should generally prefer [`toBlob()`](/en-US/docs/Web/API/HTMLCanvasElement/toBlob) instead, in combination with {{domxref("URL/createObjectURL_static", "URL.createObjectURL()")}}.

## Exceptions

- `SecurityError`
  - : The canvas's bitmap is not origin clean;
    at least some of its contents have or may have been loaded from a site other than the one from which the document itself was loaded.

