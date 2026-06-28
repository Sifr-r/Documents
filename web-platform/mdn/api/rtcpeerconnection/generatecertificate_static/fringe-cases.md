# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `generateCertificate()` is a static method, so it is always called on the `RTCPeerConnection` interface itself, not an instance thereof.

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the normalized form of `keygenAlgorithm` specifies an algorithm or algorithm settings that the browser doesn't support, or which it does not allow for use with an {{domxref("RTCPeerConnection")}}.

Other errors may occur; for example, if the specified `keygenAlgorithm` can't be successfully converted into an {{domxref("RTCCertificateExpiration")}} dictionary, the error that occurs during that conversion will be thrown.

