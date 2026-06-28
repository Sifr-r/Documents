# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Avoid using the `placeholder` attribute if you can. It is not as semantically useful as other ways to explain your form, and can cause unexpected technical issues with your content. See [`<input>` labels](/en-US/docs/Web/HTML/Reference/Elements/input#labels) for more information.

> [!NOTE]
> Because a read-only field cannot have a value, `required` does not have any effect on inputs with the `readonly` attribute also specified.

> [!NOTE]
> When the data entered by the user doesn't adhere to the stepping configuration, the {{Glossary("user agent")}} may round to the nearest valid value, preferring numbers in the positive direction when there are two equally close options.

> [!WARNING]
> Logically, you should not be able to enter characters inside a number input other than numbers. Some browsers allow invalid characters, others do not; see [Firefox bug 1398528](https://bugzil.la/1398528).

> [!NOTE]
> A user can tinker with your HTML behind the scenes, so your site _must not_ use client-side validation for security purposes. You _must_ verify on the server side any transaction in which the provided value may have security implications of any kind.

> [!NOTE]
> Any number is an acceptable value, as long as it is a [valid floating point number](https://html.spec.whatwg.org/multipage/infrastructure.html#valid-floating-point-number) (that is, not [NaN](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) or [Infinity](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Infinity)).

> [!WARNING]
> HTML form validation is _not_ a substitute for server-side scripts that ensure that the entered data is in the proper format!
>
> It's far too easy for someone to make adjustments to the HTML that allow them to bypass the validation, or to remove it entirely. It's also possible for someone to bypass your HTML and submit the data directly to your server.
>
> If your server-side code fails to validate the data it receives, disaster could strike when improperly-formatted data is submitted (or data which is too large, is of the wrong type, and so forth).

> [!NOTE]
> When the user clicks the button, the `required` attribute(s) are removed from the input(s) we are hiding, and empty the `value` attribute(s). This is so the form can be submitted if both input sets aren't filled in. It also ensures that the form won't submit data that the user didn't mean to.
>
> If you didn't do this, you'd have to fill in both feet/inches **and** meters to submit the form!

