# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Calling `decodingInfo()` with this property may result in user-visible effects, such as asking for permission to access one or more system resources.
> As such, this function should only be called when the application is ready to create and use a `MediaKeys` object with the provided configuration.

        > [!NOTE]
        > [`Navigator.requestMediaKeySystemAccess()`](/en-US/docs/Web/API/Navigator/requestMediaKeySystemAccess) takes arrays some of the same data types in its `supportedConfigurations` argument.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the `configuration` passed to the `decodingInfo()` method is invalid, either because the type is not video or audio, the `contentType` is not a valid codec MIME type, the media decoding configuration is not a valid value for the `type` (file, media-source, or webrtc), or any other error in the media configuration passed to the method, including omitting any values.

- `InvalidStateError` {{domxref("DOMException")}}
  - : The method is called in a worker when [`configuration.keySystemConfiguration`](#keysystemconfiguration) is defined.

- `SecurityError` {{domxref("DOMException")}}
  - : The method is called outside of a secure context and [`configuration.keySystemConfiguration`](#keysystemconfiguration) is defined.

