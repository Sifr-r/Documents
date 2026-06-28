# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Federated identity is not really an authentication _method_: it's more like an _architecture_ within which various different authentication methods could be used. That is, an IdP could choose to authenticate users with one or more methods, such as traditional passwords, one-time passwords, biometrics, or passkeys.

> [!NOTE]
> The OpenID specifications use the term "OpenID Provider" (OP) to refer to what we call an IdP in this guide.

## Security Notes

In this section we will summarize the main security features of the OIDC authentication flow we've just described. For the full details, see [Best Current Practice for OAuth 2.0 Security](https://www.rfc-editor.org/info/rfc9700/).

#### Authorization code flow

The two-step flow we have described is called the "authorization code flow". In an alternative flow, called the "implicit flow", only the first step exists, and the response to the authentication request already contains the access and ID tokens. This is unsafe, because the tokens are exposed to the RP's front end, which is regarded as much less secure than the back end. For example, in a successful [XSS](/en-US/docs/Web/Security/Attacks/XSS) attack, or if the user installs a malicious browser extension, then the attacker might be able to steal the user's tokens.

For this reason, websites should always use the authorization code flow. Even if an attacker can steal the authorization code, they still need to convince the token endpoint to give them the tokens in exchange for the code.

#### Client authentication

In the flow we have described, the RP authenticates itself to the token endpoint when it makes the token request. This means that if an attacker does manage to steal the authorization code, it still has to successfully impersonate the RP to get the tokens from the IdP.

The OAuth specification distinguishes between [_confidential_ and _public_ clients](https://datatracker.ietf.org/doc/html/rfc6749#section-2.1). Confidential clients are essentially RPs that can keep a secret, and public clients are those that can't.

The specification considers that clients running on the user's browser are public clients, for the same reason we've already encountered: it's too easy for an attacker to access secrets in a browser via attacks such as XSS. Clients running on a web _server_ are confidential clients.

In OIDC, only confidential clients may use client authentication, because only confidential clients can be trusted to maintain the security of the client's credentials.

The RP can authenticate itself to the IdP using a shared secret, but [it is better to use a method based on public-key cryptography](https://www.rfc-editor.org/info/rfc9700/#name-client-authentication), such as {{glossary("TLS")}} client authentication.

#### Proof Key for Code Exchange (PKCE)

The `code_challenge` and `code_verifier` values that the RP provides in the authentication request and token request, respectively, are part of a mechanism called _Proof Key for Code Exchange_ (PKCE), specified in {{rfc("7636")}}.

In the authentication request:

- The RP generates a value that is hard to guess and is specific to this authentication request. This value is called the _code verifier_.
- The RP creates a {{glossary("hash function", "cryptographic hash")}} of the code verifier, and uses it as the `code_challenge` parameter in the authentication request.
- The IdP stores the code challenge, and associates it with the authorization code that it returns to the RP.

In the token request:

- The RP passes the code verifier in the _code_verifier_ parameter.
- The IdP hashes the code verifier, and compares the result with the stored code challenge: if they do not match, then the token request is denied.

PKCE defends against two attacks: [CSRF against the RP's redirect URL](#csrf_against_the_redirect_url), and [authorization code injection](#authorization_code_injection).

##### CSRF against the redirect URL

In a CSRF attack, the attacker tricks the user's browser into signing the user into the attacker's account. This can have various bad effects: for example, any private data the user uploads to the account is available to, and under control of, the attacker.

If PKCE were not used, the CSRF attack works as follows:

1. The attacker asks to sign into the RP. The RP makes an authentication request to the IdP and the attacker authenticates to the IdP.

2. The IdP generates an authorization code for the attacker, and redirects the attacker's browser to the RP's redirect URL, with the authorization code as a URL parameter.

3. The attacker intercepts this redirect, extracts the redirect URL including the authorization code, and terminates the flow.

4. The attacker tricks the user into clicking the redirect URL. To the RP, this looks like a response from the IdP to an authentication request originating from the user.

5. The RP makes a token request to the IdP, including the attacker's authorization code, which it took from the redirect URL.

6. The IdP responds with the attacker's tokens.

7. The RP signs the user into the attacker's account: now any information or instructions they provide are under the attacker's control.

Essentially, the attack succeeds because the RP doesn't know that the request to the redirect URL is not a response to a request made on behalf of the user.

When PKCE is used:

- In step 1, the RP generates a code verifier for the attacker's request, and sends the hashed code verifier (the code challenge) to the IdP.
- In step 2, the IdP stores the code challenge alongside the attacker's authorization code.
- In step 5, the RP won't be able to find a code verifier for the user that matches the challenge the IdP stored, so the token request will fail.

An alternative defense is the `state` parameter defined in OAuth 2.0. In this defense, the RP provides an unpredictable value as a parameter in the authentication request, and the IdP includes the same value in the response: the RP checks that they match. Because the attacker can't predict the value of `state`, they can't pass a matching value to the RP's redirect URL.

##### Authorization code injection

In an authorization code injection attack, the attacker steals an authorization code from the target user, and is able to inject it into the attacker's own sign-in flow. The result is that the attacker is signed into the user's account.

It's generally accepted that authorization codes in OIDC are vulnerable, in part because they're exposed to the user's browser. For example, if the user installs a malicious browser extension, then it will be able to steal authorization codes.

The main mitigation here is [client authentication](#client_authentication): because the RP authenticates itself to the IdP when it makes a token request, an attacker can't just make their own token request with the stolen code. However, with the authorization code injection attack, it's the real RP making the token request, so client authentication is successful.

If PKCE were not used, the authorization code injection attack works as follows:

1. The attacker is able to steal the user's authorization code. For example, the user has installed a malicious browser extension that can access the URLs that the browser visits.

2. The user tries to sign in. The RP makes an authentication request, the user authenticates, and the IdP redirects the browser to the RP's redirect URL, with the authorization code as a URL parameter.

3. At this point, the malicious browser extension retrieves the authorization code, sends it to the attacker, and terminates the user's authentication flow.

4. The attacker receives the user's authorization code.

5. The attacker starts its own OIDC authentication flow, but intercepts the IdP's authentication response, replacing the authorization code with the code it stole from the user. This is straightforward, because the authentication response is for the attacker, so it passes through the attacker's device.

6. The RP then continues its authentication flow for the attacker by making the token request to the IdP, including the user's authorization code that the attacker has injected.

7. The IdP responds with the user's tokens.

8. The RP signs the attacker into the user's account.

Note that using a `state` parameter doesn't help in this case, because the authentication request and response really do belong to the same flow - the attacker's.

PKCE protects against this attack, because:

- In step 2, the RP generates a code verifier and sent the hashed code challenge to the IdP, which stores the challenge alongside the user's code.
- In step 6, the RP's token request contains the _attacker's_ code verifier but the _user's_ code. The IdP looks up the code challenge for the user's code: it won't match the attacker's code verifier, and the token request will be denied.

An alternative to PKCE, specified in OIDC, is the [`nonce`](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics#name-nonce) value. The RP includes this as another parameter in the authentication request: the IdP stores it, and the token endpoint returns it to the RP along with the tokens. The RP then checks that the returned value is the same as the original value.

##### Ensuring that PKCE is used

To ensure that PKCE is used, the RP must confirm that its chosen IdP not only supports PKCE, but that it also _mandates_ the use of PKCE — refusing the token request if a valid code verifier is not included.

Otherwise, an RP is vulnerable to a [PKCE downgrade attack](https://datatracker.ietf.org/doc/html/rfc9700#name-pkce-downgrade-attack), in which an attacker tricks the IdP into thinking that the RP does not wish to use PKCE in a token request.

