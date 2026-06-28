# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The registrations in the [WebCodecs Codec Registry](https://w3c.github.io/webcodecs/codec_registry.html#audio-codec-registry) link to a specification detailing whether and how to populate the optional `description` member.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the provided `config` is invalid.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("AudioDecoder.state","state")}} is `"closed"`.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the provided `config` is valid but the user agent cannot provide a codec that can decode this profile.

