# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > An element with the `autofocus` attribute may gain focus before the {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}} event is fired.

    > [!WARNING]
    > Automatically focusing a form control can confuse visually-impaired people using screen-reading technology and people with cognitive impairments. When `autofocus` is assigned, screen-readers "teleport" their user to the form control without warning them beforehand.

    > [!NOTE]
    > Unlike other input controls, a checkboxes and radio buttons value are only included in the submitted data if they are currently `checked`. If they are, the name and the value(s) of the checked controls are submitted.
    >
    > For example, if a checkbox whose `name` is `fruit` has a `value` of `cherry`, and the checkbox is checked, the form data submitted will include `fruit=cherry`. If the checkbox isn't active, it isn't listed in the form data at all. The default `value` for checkboxes and radio buttons is `on`.

    > [!NOTE]
    > Although not required by the specification, Firefox will by default [persist the dynamic disabled state](https://stackoverflow.com/questions/5985839/bug-with-firefox-disabled-attribute-of-input-not-resetting-when-refreshing) of an `<input>` across page loads. Use the [`autocomplete`](#autocomplete) attribute to control this feature.

    > [!NOTE]
    > An input can only be associated with one form.

    > [!WARNING]
    > Avoid giving form elements a `name` that corresponds to a built-in property of the form, since you would then override the predefined property or method with this reference to the corresponding input.

    > [!NOTE]
    > If using the `pattern` attribute, inform the user about the expected format by including explanatory text nearby. You can also include a [`title`](#title) attribute to explain what the requirements are to match the pattern; most browsers will display this title as a tooltip. The visible explanation is required for accessibility. The tooltip is an enhancement.

    > [!NOTE]
    > The `placeholder` attribute is not as semantically useful as other ways to explain your form, and can cause unexpected technical issues with your content. See [Labels](#labels) for more information.

    > [!NOTE]
    > When the data entered by the user doesn't adhere to the stepping configuration, the value is considered invalid in constraint validation and will match the `:invalid` pseudoclass.

    > [!NOTE]
    > This attribute is still experimental and has limited browser support. The attribute is ignored on unsupported browsers.

> [!NOTE]
> Don't use the [`placeholder`](#placeholder) attribute if you can avoid it. If you need to label an `<input>` element, use the {{HTMLElement("label")}} element.

> [!WARNING]
> Client-side validation is useful, but it does _not_ guarantee that the server will receive valid data. If the data must be in a specific format, _always_ verify it also on the server-side, and return a [`400` HTTP response](/en-US/docs/Web/HTTP/Reference/Status/400) if the format is invalid.

> [!NOTE]
> Always validate input constraints both client side and server side. Constraint validation doesn't remove the need for validation on the _server side_. Invalid values can still be sent by older browsers or by bad actors.

> [!NOTE]
> Firefox supported a proprietary error attribute — `x-moz-errormessage` — for many versions, which allowed you set custom error messages in a similar way. This has been removed as of version 66 (see [Firefox bug 1513890](https://bugzil.la/1513890)).

