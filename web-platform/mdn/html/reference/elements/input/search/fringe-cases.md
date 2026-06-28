# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Use the [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) attribute to specify text that most browsers will display as a tooltip to explain what the requirements are to match the pattern. You should also include other explanatory text nearby.

> [!NOTE]
> Avoid using the `placeholder` attribute if you can. It is not as semantically useful as other ways to explain your form, and can cause unexpected technical issues with your content. See [`<input>` labels](/en-US/docs/Web/HTML/Reference/Elements/input#labels) for more information.

> [!NOTE]
> Because a read-only field cannot have a value, `required` does not have any effect on inputs with the `readonly` attribute also specified.

> [!NOTE]
> You must remember to set a [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name) for your input, otherwise nothing will be submitted.

> [!NOTE]
> See [Signposts/Landmarks](/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics#signpostslandmarks) for more information about such accessibility features.

> [!NOTE]
> HTML form validation is _not_ a substitute for scripts that ensure that the entered data is in the proper format. It's far too easy for someone to make adjustments to the HTML that allow them to bypass the validation, or to remove it entirely. It's also possible for someone to bypass your HTML entirely and submit the data directly to your server. If your server-side code fails to validate the data it receives, disaster could strike when improperly-formatted data (or data which is too large, is of the wrong type, and so forth) is entered into your database.

