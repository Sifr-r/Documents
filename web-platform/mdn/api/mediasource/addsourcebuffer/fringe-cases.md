# Fringe Cases

## Exceptions

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if the value specified for `mimeType` is an empty string rather than a valid
    MIME type.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("MediaSource")}} is not in the `"open"`
    {{domxref("MediaSource.readyState", "readyState")}}.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the specified `mimeType` isn't supported by the {{Glossary("user agent")}}, or is not compatible with the MIME types of other {{domxref("SourceBuffer")}} objects that are already included in the media source's {{domxref("MediaSource.sourceBuffers", "sourceBuffers")}} list.
- {{domxref("QuotaExceededError")}}
  - : Thrown if the user agent can't handle any more `SourceBuffer` objects, or creating
    a new `SourceBuffer` using the given `mimeType` would result in
    an [unsupported configuration of `SourceBuffer`s](https://w3c.github.io/media-source/#sourcebuffer-configuration).

