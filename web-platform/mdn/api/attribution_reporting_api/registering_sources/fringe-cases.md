# Fringe Cases

## Warnings & Notes

> [!NOTE]
       > The values used to represent each event, and the number of elements in the array, are completely arbitrary and defined by you as the developer. The array may contain values that are not used, but values must be present in the array to be attributed to the source by the browser when a trigger is registered.

> [!NOTE]
> When setting up a [`click`](/en-US/docs/Web/API/Element/click_event) event like in the above example, it is advisable to set it on a control where a click is expected, such as a {{htmlelement("button")}} or {{htmlelement("a")}} element. This makes more sense semantically, and is more accessible to both screen reader and keyboard users.

> [!NOTE]
> To register an attribution source via `open()`, it must be called with [transient activation](/en-US/docs/Glossary/Transient_activation) (i.e., inside a user interaction event handler such as `click`) within five seconds of user interaction.

> [!NOTE]
> The request can be for any resource. It doesn't need to have anything directly to do with the Attribution Reporting API, and can be a request for JSON, plain text, an image blob, or whatever else makes sense for your app.

> [!NOTE]
> Specifying multiple URLs means that multiple attribution sources can be registered on the same feature. You might for example have different campaigns that you are trying to measure the success of, which involve generating different reports on different data.

