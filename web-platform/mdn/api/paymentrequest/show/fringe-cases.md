# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In reality, despite the fact that the specification says this
> can't be done, some browsers, including Firefox, support multiple active payment
> requests at a time.

## Exceptions

Exceptions are not thrown but returned when the {{jsxref("Promise")}} rejects.

- `AbortError` {{domxref("DOMException")}}
  - : Returned if the
    {{Glossary("user agent")}} is already showing a payment panel. Only one payment
    panel may be visible at a time _across all documents loaded by the user
    agent_.

    The promise is also rejected with `AbortError` if the user cancels the
    payment request.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the same payment has
    already been shown for this request (its state is `interactive` because it
    is being shown already).
- `NotSupportedError` {{domxref("DOMException")}}
  - : Returned if the user agent does not
    support the payment methods specified when the
    {{domxref("PaymentRequest.PaymentRequest","PaymentRequest")}} constructor was called.
- `SecurityError` {{domxref("DOMException")}}
  - : Returned if the call to
    `show()` was not in response to a user action, such as a {{domxref("Element/click_event", "click")}}
    or {{domxref("Element/keyup_event", "keyup")}} event. Other reasons a `SecurityError` may be thrown
    are at the discretion of the user agent, and may include situations such as too many
    calls to `show()` being made in a short time or `show()` being
    called while payment requests are blocked by parental controls.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required. The user has to interact with the page or a UI element in order for this feature to work.

