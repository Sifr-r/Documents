# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Any forms involving sensitive information like passwords (such as login forms) should be served over HTTPS.
> Many browsers now implement mechanisms to warn against insecure login forms.

> [!NOTE]
> The line feed (U+000A) and carriage return (U+000D) characters are not permitted in a `password` value. When setting the value of a password control, line feed and carriage return characters are stripped out of the value.

> [!NOTE]
> The [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect) global attribute can be added to password inputs, but the stored state is always `off`.

> [!NOTE]
> Use the [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) attribute to specify text that most browsers will display as a tooltip to explain what the requirements are to match the pattern. You should also include other explanatory text nearby.

> [!NOTE]
> Avoid using the `placeholder` attribute if you can. It is not as semantically useful as other ways to explain your form, and can cause unexpected technical issues with your content. See [`<input>` labels](/en-US/docs/Web/HTML/Reference/Elements/input#labels) for more information.

> [!NOTE]
> Because a read-only field cannot have a value, `required` does not have any effect on inputs with the `readonly` attribute also specified.

