# Fringe Cases

## Warnings & Notes

> [!NOTE]
  > To determine this value:
  >
  > - Find the _AAGUID_ value in the [`attestedCredentialData`](/en-US/docs/Web/API/Web_Authentication_API/Authenticator_data#attestedcredentialdata) returned by the browser from a successful call to {{domxref("CredentialsContainer.create()")}}.
  > - Use this to look up the corresponding name in the [Passkey Provider AAGUIDs](https://github.com/passkeydeveloper/passkey-authenticator-aaguids) list.
  >
  > See also [Determine the passkey provider with AAGUID](https://web.dev/articles/webauthn-aaguid).

## Security Notes

Passkeys are more secure than passwords, and we can see how their design addresses the most serious [weaknesses of passwords](/en-US/docs/Web/Security/Authentication/Passwords#weaknesses_of_password-based_authentication):

- Unlike a password, the user never invents a passkey value or needs to remember it. This means users can't choose weak passkey values, so they are not vulnerable to [guessing](/en-US/docs/Web/Security/Authentication/Passwords#guessing) attacks. Passkey generation is transferred from the user to the authenticator.

- Passkeys are never reused across sites, so they are not vulnerable to [credential stuffing](/en-US/docs/Web/Security/Authentication/Passwords#credential_stuffing) attacks. If an attacker does get access to a passkey, they can only use it for the site that originally created it.

- With passkeys, the server never has to store any secrets: it just stores the public key. So if an attacker [breaks into the server's database](/en-US/docs/Web/Security/Authentication/Passwords#database_compromise), they can't compromise the private key, which is stored in the authenticator. Note, however, that they can compromise user accounts if they can _write_ fake credentials into the server's database.

- When the user tries to sign in, the browser will only look for passkeys whose scope matches the requesting site, and the RP's server can verify that the origin of the requester was what they expected. This makes passkeys resistant to [phishing](/en-US/docs/Web/Security/Attacks/Phishing) attacks, because front-end code served from a phishing site like `https://examp1e.com` is not able to use the passkey associated with `https://example.com`.

Although passkeys provide protection against these common web authentication attacks, they don't eliminate all threats. Since widespread deployment of passkeys is relatively new, there isn't yet a mature understanding of the attacks that passkeys may face, but it's likely that some attacks would focus on the user's devices: for example, convincing them to install a malicious authenticator. Attacks may also target parts of the authentication system that are not secured by passkeys, such as account recovery mechanisms.

