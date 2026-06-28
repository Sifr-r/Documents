# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The promise returned by {{domxref("RTCPeerConnection.setRemoteDescription", "setRemoteDescription()")}} cannot resolve until any target peer identity that's been set is validated.
> If the identity hasn't been validated yet, the promise returned by `setRemoteDescription()` will be rejected.
> If there's no target peer identity, `setRemoteDescription()` doesn't need to wait for validation to occur before it resolves.

