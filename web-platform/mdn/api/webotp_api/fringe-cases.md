# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The provided domain value must not include a URL scheme, port, or other URL features not shown above.

> [!NOTE]
> Where a policy forbids use of WebOTP `get()`, {{jsxref("Promise", "promises")}} returned by it will reject with a `SecurityError` {{domxref("DOMException")}}.

## Security Notes

SMS OTPs are useful for verifying phone numbers, and using SMS for a second factor is certainly better than having no second factor. In some regions, other identifiers such as email addresses and authenticators are not widely-used, so SMS OTPs are very common.

However, SMSes aren't that secure. Attackers can spoof an SMS and hijack a person's phone number. Carriers can recycle phone numbers to new users after an account is closed.

You are, therefore, recommended to use a stronger form of authentication if possible, such as a [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)-based solution involving a password and security key or a passkey.

