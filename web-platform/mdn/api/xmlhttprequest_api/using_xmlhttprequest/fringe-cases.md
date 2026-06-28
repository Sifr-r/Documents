# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The constructor `XMLHttpRequest` isn't limited to only XML documents. It starts with **"XML"** because when it was created the main format that was originally used for asynchronous data exchange was XML.

> [!NOTE]
> `XMLHttpRequest` can now interpret HTML for you, using the {{domxref("XMLHttpRequest.responseXML", "responseXML")}} property. Read the article about [HTML in XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/HTML_in_XMLHttpRequest) to learn how to do this.

> [!NOTE]
> You need to add the event listeners before calling `open()` on the request. Otherwise the `progress` events will not fire.

> [!NOTE]
> Progress events are not available for the
> `file:` protocol.

## Security Notes

The recommended way to enable cross-site scripting is to use the `Access-Control-Allow-Origin` HTTP header in the response to the XMLHttpRequest.

### XMLHttpRequests being stopped

If you conclude with an XMLHttpRequest receiving `status=0` and `statusText=null`, this means the request was not allowed to be performed. It was [`UNSENT`](https://xhr.spec.whatwg.org/#dom-xmlhttprequest-unsent). A likely cause for this is when the `XMLHttpRequest` origin (at the creation of the XMLHttpRequest) has changed when the XMLHttpRequest is subsequently `open()`. This case can happen, for example, when one has an XMLHttpRequest that gets fired on an onunload event for a window, the expected XMLHttpRequest is created when the window to be closed is still there, and finally sending the request (in other words, `open()`) when this window has lost its focus and another window gains focus. The most effective way to avoid this problem is to set a listener on the new window's {{domxref("Element/DOMActivate_event", "DOMActivate")}} event which is set once the terminated window has its {{domxref("Window/unload_event", "unload")}} event triggered.

