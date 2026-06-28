# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In order to provide autocompletion, user-agents might require `<input>`/`<select>`/`<textarea>` elements to:
>
> 1. Have a `name` and/or `id` attribute
> 2. Be descendants of a `<form>` element
> 3. Be owned by a form with a {{HTMLElement("input/submit", "submit")}} button

> [!NOTE]
> The `autocomplete` attribute also controls whether Firefox will — unlike other browsers — [persist the dynamic disabled state and (if applicable) dynamic checkedness](https://stackoverflow.com/questions/5985839/bug-with-firefox-disabled-attribute-of-input-not-resetting-when-refreshing) of an `<input>` element, `<textarea>` element, or entire `<form>` across page loads. The persistence feature is enabled by default. Setting the value of the `autocomplete` attribute to `off` disables this feature. This works even when the `autocomplete` attribute would normally not apply by virtue of its `type`. See [Firefox bug 654072](https://bugzil.la/654072).

    > [!NOTE]
    > In most modern browsers, setting `autocomplete` to `"off"` will not prevent a password manager from asking the user if they would like to save username and password information, or from automatically filling in those values in a site's login form. See [Managing autofill for login fields](/en-US/docs/Web/Security/Practical_implementation_guides/Turning_off_form_autocompletion#managing_autofill_for_login_fields).

