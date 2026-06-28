# Fringe Cases

## Warnings & Notes

> [!NOTE]
> By default, {{domxref("Geolocation.getCurrentPosition","getCurrentPosition()")}} tries to answer as fast as possible with a low accuracy result. It is useful if you need a quick answer regardless of the accuracy. Devices with a GPS, for example, can take a minute or more to get a GPS fix, so less accurate data (IP location or Wi-Fi) may be returned to `getCurrentPosition()`.

> [!NOTE]
> You can use {{domxref("Geolocation.watchPosition","watchPosition()")}} without an initial {{domxref("Geolocation.getCurrentPosition","getCurrentPosition()")}} call.

