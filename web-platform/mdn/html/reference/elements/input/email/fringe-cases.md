# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect) global attribute can be added to email inputs, but the stored state is always `off`.

> [!NOTE]
> Normally, if you specify the [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) attribute, the user must enter a valid email address for the field to be considered valid. However, if you add the `multiple` attribute, a list of zero email addresses (an empty string, or one which is entirely whitespace) is a valid value. In other words, the user does not have to enter even one email address when `multiple` is specified, regardless of the value of `required`.

> [!NOTE]
> Use the [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) attribute to specify text that most browsers will display as a tooltip to explain what the requirements are to match the pattern. You should also include other explanatory text nearby.

> [!NOTE]
> Avoid using the `placeholder` attribute if you can. It is not as semantically useful as other ways to explain your form, and can cause unexpected technical issues with your content. See [`<input>` labels](/en-US/docs/Web/HTML/Reference/Elements/input#labels) for more information.

> [!NOTE]
> Because a read-only field cannot have a value, `required` does not have any effect on inputs with the `readonly` attribute also specified.

> [!NOTE]
> It's also crucial to remember that a user can tinker with your HTML behind the scenes, so your site _must not_ use this validation for any security purposes. You _must_ verify the email address on the server side of any transaction in which the provided text may have any security implications of any kind.

> [!NOTE]
> When `multiple` is used, the value _is_ allowed to be empty.

> [!WARNING]
> HTML form validation is _not_ a substitute for scripts that ensure that the entered data is in the proper format. It's far too easy for someone to make adjustments to the HTML that allow them to bypass the validation, or to remove it completely. It's also possible for someone to bypass your HTML entirely and submit the data directly to your server. If your server-side code fails to validate the data it receives, disaster could strike when improperly-formatted data (or data which is too large, is of the wrong type, and so forth) is entered into your database.

> [!NOTE]
> There are known specification issues related to international domain names and the validation of email addresses in HTML. See [W3C bug 15489](https://www.w3.org/Bugs/Public/show_bug.cgi?id=15489) and [whatwg/html#4562](https://github.com/whatwg/html/issues/4562) for details.

> [!NOTE]
> If you run into trouble while writing your validation regular expressions and they're not working properly, check your browser's console; there may be helpful error messages there to aid you in solving the problem.

