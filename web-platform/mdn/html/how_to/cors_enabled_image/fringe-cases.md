# Fringe Cases

## Security Notes

Because the pixels in a canvas's bitmap can come from a variety of sources, including images or videos retrieved from other hosts, it's inevitable that security problems may arise.

As soon as you draw into a canvas any data that was loaded from another origin without CORS approval, the canvas becomes **tainted**. A tainted canvas is one which is no longer considered secure, and any attempts to retrieve image data back from the canvas will cause an exception to be thrown.

If the source of the foreign content is an HTML {{HTMLElement("img")}} or SVG {{SVGElement("svg")}} element, attempting to retrieve the contents of the canvas isn't allowed.

If the foreign content comes from an image obtained from either as {{domxref("HTMLCanvasElement")}} or {{domxref("ImageBitMap")}}, and the image source doesn't meet the same origin rules, attempts to read the canvas's contents are blocked.

Calling any of the following on a tainted canvas will result in an error:

- Calling {{domxref("CanvasRenderingContext2D.getImageData", "getImageData()")}} on the canvas's context
- Calling {{domxref("HTMLCanvasElement.toBlob", "toBlob()")}}, {{domxref("HTMLCanvasElement.toDataURL", "toDataURL()")}} or {{domxref("HTMLCanvasElement.captureStream", "captureStream()")}} on the {{HTMLElement("canvas")}} element itself

Attempting any of these when the canvas is tainted will cause a `SecurityError` to be thrown. This protects users from having private data exposed by using images to pull information from remote websites without permission.

