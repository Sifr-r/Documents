# Fringe Cases

## Warnings & Notes

> [!NOTE]
> HTML Constraint validation doesn't remove the need for validation on the _server side_. Even though far fewer invalid form requests are to be expected, invalid ones can still be sent in many ways:
>
> - By modifying HTML via the browser's developer tools.
> - By hand-crafting an HTTP request without using the form.
> - By programmatically writing content into the form (certain constraint validations are _only run_ for user input, and not if you set the value of a form field using JavaScript).
>
> Therefore, you should always validate form data on the server side, consistent with what is done on the client side.

> [!NOTE]
>
> - If the [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) attribute is set on the {{ HTMLElement("form") }} element, interactive validation of the constraints doesn't happen.
> - Calling the `submit()` method on the [`HTMLFormElement`](/en-US/docs/Web/API/HTMLFormElement) interface doesn't trigger a constraint validation. In other words, this method sends the form data to the server even if it doesn't satisfy the constraints. Call the `click()` method on a submit button instead.
> - The `minlength` and `maxlength` constraints are only checked on user-provided input. They are not checked if a value is set programmatically, even when explicitly calling `checkValidity()` or `reportValidity()`.

> [!NOTE]
> This is not a comprehensive postal code validation library, but rather a demonstration of the key concepts.

