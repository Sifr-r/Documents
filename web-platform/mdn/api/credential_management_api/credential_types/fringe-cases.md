# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Although we're describing all the credential types together here, the different credential types are defined in several different specifications, which extend the main Credential Management API specification.
>
> - [Credential Management API](https://w3c.github.io/webappsec-credential-management/) defines passwords and legacy federated credentials.
> - [Federated Credential Management API](https://w3c-fedid.github.io/FedCM/) defines the new federated credentials.
> - [WebOTP API](https://wicg.github.io/web-otp/) defines OTP credentials.
> - [Web Authentication API](https://w3c.github.io/webauthn/) defines Web Authentication assertions.

> [!NOTE]
> Most browsers do not support this credential type and it is not widely used on the web. Instead, browsers automatically offer to store passwords in a password manager, and can automatically retrieve stored passwords to autofill [password input elements](/en-US/docs/Web/HTML/Reference/Elements/input/password).

> [!NOTE]
> Support for federated identity in the Credential Management API was originally provided through the {{domxref("FederatedCredential")}} interface. However, this mechanism depends on technologies such as [third-party cookies](/en-US/docs/Web/Privacy/Guides/Third-party_cookies), which are intrinsically privacy-invasive. These technologies were [deprecated in browsers](/en-US/blog/goodbye-third-party-cookies/), therefore a new approach was needed.

