# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The {{domxref("Element/input_event", "input")}} and {{domxref("HTMLElement/change_event", "change")}} events do not apply to this input type. Hidden inputs cannot be focused even using JavaScript (e.g., `hiddenInput.focus()`).

> [!WARNING]
> While the value isn't displayed to the user in the page's content, it is visible—and can be edited—using any browser's developer tools or "View Source" functionality. Do not rely on `hidden` inputs as a form of security.

> [!NOTE]
> Placing the secret in a hidden input doesn't inherently make it secure. The key's composition and encoding would do that. The value of the hidden input is that it keeps the secret associated with the data and automatically includes it when the form is sent to the server. You need to use well-designed secrets to actually secure your website.

> [!NOTE]
> You can also find the example on GitHub (see the [source code](https://github.com/mdn/learning-area/blob/main/html/forms/hidden-input-example/index.html), and also [see it running live](https://mdn.github.io/learning-area/html/forms/hidden-input-example/index.html)).

