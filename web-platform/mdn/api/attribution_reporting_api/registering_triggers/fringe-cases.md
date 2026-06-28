# Fringe Cases

## Warnings & Notes

> [!NOTE]
       > The values used to represent each event, and the number of elements in the array, are completely arbitrary and defined by you as the developer. The array may contain values that are not used, but values must be present in the array to be attributed to the source by the browser when a trigger is registered.

   > [!NOTE]
   > These requirements provide privacy protection, but also flexibility — the source _and_ trigger can potentially be embedded in an {{htmlelement("iframe")}} or situated in the top-level site.

> [!NOTE]
> Attribution triggers cannot be registered on {{htmlelement("a")}} elements or {{domxref("Window.open()")}} calls like attribution sources can.

> [!NOTE]
> The request can be for any resource. It doesn't need to have anything directly to do with the Attribution Reporting API, and can be a request for JSON, plain text, an image blob, or whatever else makes sense for your app.

