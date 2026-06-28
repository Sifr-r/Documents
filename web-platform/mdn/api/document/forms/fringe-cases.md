# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Similarly, you can access a list of a form's component user input elements using the {{domxref("HTMLFormElement.elements")}} property.

> [!WARNING]
> Relying on the `document["form-name"]` pattern is dangerous and discouraged because it can lead to unexpected conflicts with existing or future APIs in the browser.
> For example, if a browser introduces a built-in `document["login-form"]` property in the future, your code may no longer be able to access the form element.
> To avoid such conflicts, always use `document.forms` to access named forms.

