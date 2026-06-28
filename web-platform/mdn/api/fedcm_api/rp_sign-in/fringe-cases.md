# Fringe Cases

## Warnings & Notes

> [!NOTE]
   > If the IdPs' login statuses are all `"logged-out"`, the `get()` call rejects with a `NetworkError` {{domxref("DOMException")}} and does not make a request to any IdP's `accounts_endpoint`. In this case it is up to the developer to handle the flow, for example by prompting the user to go and sign in to a suitable IdP. Note that there may be some delay in the rejection to avoid leaking IdP login status to the RP.

   > [!NOTE]
   > At this stage, if the user has previously authenticated with a federated RP account in the current browser instance (that is, created a new account with the RP or signed into the RP's website using an existing account), they may be able to **auto-reauthenticate**, depending on what the [`mediation`](/en-US/docs/Web/API/CredentialsContainer/get#mediation) option is set to in the `get()` call. If so, the user will be signed in automatically without entering their credentials, as soon as `get()` is invoked. See the [Auto-reauthentication](#auto-reauthentication) section for more details.

    > [!NOTE]
    > The origin of the RP will be registered with the IdP in a completely separate process when the RP first integrates with the IdP. This process will be specific to each IdP.

> [!NOTE]
> The {{domxref("IdentityCredential.isAutoSelected")}} property provides an indication of whether the federated sign-in was carried out using auto-reauthentication. This is helpful to evaluate the API performance and improve UX accordingly. Also, when it's unavailable, the user may be prompted to sign in with explicit user mediation, which is a `get()` call with `mediation: required`.

