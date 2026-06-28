# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect) global attribute can be added to url inputs, but the stored state is always `off`.

> [!NOTE]
> Use the [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) attribute to specify text that most browsers will display as a tooltip to explain what the requirements are to match the pattern. You should also include other explanatory text nearby.

> [!NOTE]
> Avoid using the `placeholder` attribute if you can. It is not as semantically useful as other ways to explain your form, and can cause unexpected technical issues with your content. See [`<input>` labels](/en-US/docs/Web/HTML/Reference/Elements/input#labels) for more information.

> [!NOTE]
> Because a read-only field cannot have a value, [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required) does not have any effect on inputs with the `readonly` attribute also specified.

> [!NOTE]
> A user can tinker with your HTML behind the scenes, so your site _must not_ use this validation for any security purposes. You _must_ verify the URL on the server-side of any transaction in which the provided text may have any security implications of any kind.

> [!NOTE]
> These attributes also affect validation; a value shorter or longer than the specified minimum/maximum lengths will be classified as invalid; in addition most browsers will refuse to let the user enter a value longer than the specified maximum length.

> [!WARNING]
> HTML form validation is _not_ a substitute for scripts that ensure that the entered data is in the proper format. It's far too easy for someone to make adjustments to the HTML that allow them to bypass the validation, or to remove it entirely. It's also possible for someone to bypass your HTML entirely and submit the data directly to your server. If your server-side code fails to validate the data it receives, disaster could strike when improperly-formatted data (or data which is too large, is of the wrong type, and so forth) is entered into your database.

