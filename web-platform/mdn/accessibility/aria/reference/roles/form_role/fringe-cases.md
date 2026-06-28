# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Use an HTML {{htmlelement("form")}} element to contain your form controls, rather than the ARIA `form` role, unless you have a very good reason.
> The HTML `<form>` element is sufficient to tell assistive technologies that there is a form.

> [!NOTE]
> Using the {{HTMLElement('form')}} element will automatically communicate a section of content as a `form` landmark, if it is provided an accessible name. Developers should always prefer using the correct semantic HTML element over using ARIA.

