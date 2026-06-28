# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The device filters are used to narrow the list of devices presented to the user. If no filters are present, all connected devices are shown. When one or more filters are included, a device is included if any filter matches. To match a filter, all of the rules included in that filter must match.

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the page does not allow access to the HID feature.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required. The user has to interact with the page or a UI element in order for this feature to work.

