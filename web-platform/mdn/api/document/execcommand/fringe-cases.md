# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Although the `execCommand()` method is deprecated, there are still some valid use cases that do not yet have viable alternatives. For example, unlike direct DOM manipulation, modifications performed by `execCommand()` preserve the undo buffer (edit history). For these use cases, you can still use this method, but test to ensure cross-browser compatibility, such as by using {{domxref("document.queryCommandSupported()")}}.

> [!NOTE]
> Modifications performed by `execCommand()` may or may not trigger {{domxref("Element/beforeinput_event", "beforeinput")}} and {{domxref("Element/input_event", "input")}} events, depending on the browser and configuration. If triggered, the handlers for the events will run before `execCommand()` returns. Authors need to be careful about such recursive calls, especially if they call `execCommand()` in response to these events. From Firefox 82, nested `execCommand()` calls will always fail, see [bug 1634262](https://bugzil.la/1634262).

        > [!WARNING]
        > The input is parsed as HTML and written into the DOM.
        > APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks, if the input originally came from an attacker.
        >
        > You can mitigate this risk by always assigning {{domxref("TrustedHTML")}} objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
        > See the [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API) for more information.

        > [!NOTE]
        > This argument is logically backwards (i.e., use `false` to use CSS,
        > `true` to use HTML). This has been deprecated in favor of `styleWithCSS`.

> [!NOTE]
> `document.execCommand()` only returns
> `true` if it is invoked as part of a user interaction. You can't use it to
> verify browser support before calling a command.

