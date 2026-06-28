# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Chromium will default to `userVerificationOptionalWithCredentialIDList` or `userVerificationRequired`, depending on the type of request:
>
> - Chromium will request a protection level of `userVerificationOptionalWithCredentialIDList` when creating a credential if `residentKey` is set to `preferred` or `required`. (Setting `requireResidentKey` is treated the same as required.) This ensures that simple physical possession of a security key does not allow the presence of a discoverable credential for a given `rpId` to be queried.
> - Additionally, if `residentKey` is `required` and `userVerification` is preferred, the protection level will be increased to `userVerificationRequired`. This ensures that physical possession of a security key does not allow sign-in to a site that doesn't require user verification. (This is not complete protection; sites should still carefully consider the security of their users.)
> - If the site requests an explicit `credProtect` level, that will override these defaults. These defaults never cause the protection level to be lower than the security key's default if that is higher.
>
> Suppose the `enforceCredentialProtectionPolicy` value is `true`. In that case, the `create()` call will fail if the policy cannot be adhered to (for example, it requires user verification, but the authenticator does not support user verification). If it is `false`, the system will make the best attempt to create a credential that conforms to the policy, but it will still create one that conforms as closely as it can if this is not possible.

> [!NOTE]
> For a write authentication operation to be successful, `publicKey.allowCredentials` must contain only a single element representing the credential you want the blob stored alongside.

> [!NOTE]
> If unsuccessful, the `largeBlob` object will be returned, but `blob` will not be present.

