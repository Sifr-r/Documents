# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `create()` method requires [transient activation](/en-US/docs/Glossary/Transient_activation), that is, it must be invoked in response to a user action such as a mouse click or button press.

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if usage of the Summarizer API is blocked by a {{httpheader('Permissions-Policy/summarizer','summarizer')}} {{httpheader("Permissions-Policy")}}.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if any of the language tags specified in `expectedContextLanguages`, `expectedInputLanguages`, or `outputLanguage` are invalid, or not supported.
- `OperationError` {{domxref("DOMException")}}
  - : General-purpose exception thrown if `Summarizer` creation failed for any other reason.

