# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > In older versions of the specification, an empty string,
    > `""`, was used instead of `unknown` to indicate a completion
    > without a known result state. See the [Browser compatibility](#browser_compatibility) section
    > below for details.

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : Returned if the document in which the payment request is taking place became inactive while the
    user interface was shown.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the payment has already completed, or `complete()` was called while a
    request to retry the payment is pending. You can't treat a payment as complete after
    requesting that the payment be tried again.

