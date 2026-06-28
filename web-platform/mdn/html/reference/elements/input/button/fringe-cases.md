# Fringe Cases

## Warnings & Notes

> [!NOTE]
> While `<input>` elements of type `button` are still perfectly valid HTML, the newer {{HTMLElement("button")}} element is now the favored way to create buttons. Given that a {{HTMLElement("button")}}'s label text is inserted between the opening and closing tags, you can include HTML in the label, even images.

> [!NOTE]
> The problem with the above example of course is that the user will not know what the access key is! In a real site, you'd have to provide this information in a way that doesn't interfere with the site design (for example by providing an easily accessible link that points to information on what the site access keys are).

> [!NOTE]
> Unlike other browsers, Firefox persists the `disabled` state of an `<input>` element even after the page is reloaded. As a workaround, set the `<input>` element's [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete) attribute to `off`. (See [Firefox bug 654072](https://bugzil.la/654072) for more details.)

