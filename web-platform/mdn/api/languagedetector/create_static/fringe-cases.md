# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `create()` method requires [transient activation](/en-US/docs/Glossary/Transient_activation), that is, it must be invoked in response to a user action such as a mouse click or button press.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the page's {{domxref("Document")}} is not yet active.
- `NetworkError` {{domxref("DOMException")}}
  - : Thrown if:
    - The network was not available to download the AI model.
    - The user has cancelled the AI model download.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if:
    - Usage of the method is blocked by a {{httpheader('Permissions-Policy/language-detector','language-detector')}} {{httpheader("Permissions-Policy")}}.
    - The user has blocked the AI model download in some way.
    - The `create()` method wasn't called via {{glossary("transient activation")}}.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if:
    - The language tags specified in `expectedInputLanguages` are invalid, or not supported.
    - An AI model to support the specified `expectedInputLanguages` is not available.
- `OperationError` {{domxref("DOMException")}}
  - : General-purpose exception thrown if `LanguageDetector` creation failed for any other reason.

