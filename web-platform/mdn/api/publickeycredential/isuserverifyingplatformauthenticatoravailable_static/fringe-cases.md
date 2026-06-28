# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This method may only be used in top-level contexts and will not be available in an {{HTMLElement("iframe")}} for example.

> [!NOTE]
> In earlier versions of the specification, the boolean also conveyed the consent of the user to disclose such an authenticator existed.

## Exceptions

The returned {{jsxref("Promise")}} may be rejected with the following values:

- `SecurityError` {{domxref("DOMException")}}
  - : The RP domain is not valid.

