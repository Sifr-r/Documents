# Fringe Cases

## Warnings & Notes

> [!NOTE]
> These requirements are for web browsers and other fully-WebRTC compliant products. Non-WebRTC products that are able to communicate with WebRTC to some extent may or may not support these codecs, although they're encouraged to by the specification documents.

> [!NOTE]
> The list above indicates the minimum required set of codecs that all WebRTC-compatible endpoints are required to implement. A given browser may also support other codecs; however, cross-platform and cross-device compatibility may be at risk if you use other codecs without carefully ensuring that support exists in all browsers your users might choose.

> [!NOTE]
> The two methods for obtaining lists of codecs shown here use different output types in their codec lists. Be aware of this when using the results.

> [!WARNING]
> The information here does _not_ constitute legal advice! Be sure to confirm your exposure to liability before making any final decisions where potential exists for licensing issues.

## Security Notes

There are interesting potential security issues that come up while selecting and configuring codecs. WebRTC video is protected using Datagram Transport Layer Security ({{Glossary("DTLS")}}), but it is theoretically possible for a motivated party to infer the amount of change that's occurring from frame to frame when using variable bit rate (VBR) codecs, by monitoring the stream's bit rate and how it changes over time. This could potentially allow a bad actor to infer something about the content of the stream, given the ebb and flow of the bit rate.

For more about security considerations when using AVC in WebRTC, see {{RFC(6184, "RTP Payload Format for H.264 Video: Security Considerations", 9)}}.

