# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > In the browser sign-in UI, this will likely manifest as some kind of "Choose other account" button.

> [!NOTE]
> For a description of the FedCM flow in which these endpoints are accessed, see [FedCM sign-in flow](/en-US/docs/Web/API/FedCM_API/RP_sign-in#fedcm_sign-in_flow).

> [!NOTE]
> None of the requests made by the FedCM API to the endpoints detailed here allow for following redirects, for privacy purposes.

> [!NOTE]
> If the user is not signed in to any IdP accounts, the endpoint should respond with [HTTP 401 (Unauthorized)](/en-US/docs/Web/HTTP/Reference/Status/401).

> [!NOTE]
> If the IdP wishes to disconnect all accounts associated with the RP, it can pass a string that does not match any `account_id`, for example `"account_id": "*"`.

> [!NOTE]
> If the {{domxref("CredentialsContainer.get", "get()")}} call succeeds, the `is_auto_selected` value is also communicated to the RP via the {{domxref("IdentityCredential.isAutoSelected")}} property.

