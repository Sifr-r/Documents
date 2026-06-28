# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This feature is currently opposed by one browser vendor.
> See the [Standards positions](#standards_positions) section below for details.

> [!NOTE]
> Support is provided for opaque URNs in `<iframe>`s to ease migration of existing implementations over to [privacy sandbox](https://privacysandbox.google.com/) APIs. This support is intended to be temporary and will be removed in the future as adoption grows.

> [!NOTE]
> `FencedFrameConfig` has a {{domxref("FencedFrameConfig.setSharedStorageContext", "setSharedStorageContext()")}} method that is used to pass in data from the embedding document to the `<fencedframe>`'s shared storage. It could for example be accessed in a {{domxref("Worklet")}} via the `<fencedframe>` and used to generate a report. See the [Shared Storage API](https://privacysandbox.google.com/private-advertising/shared-storage) for more details.

> [!NOTE]
> In Chrome, you can still test your fenced frame code locally without enrollment. To allow local testing, enable the following Chrome developer flag:
>
> `chrome://flags/#privacy-sandbox-enrollment-overrides`

