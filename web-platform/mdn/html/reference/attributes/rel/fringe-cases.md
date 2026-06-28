# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > For historical reasons, the obsolete attribute value `rev="made"` is treated as `rel="author"`.

    > [!NOTE]
    > See [Stabilizing page state to make cross-document transitions consistent](/en-US/docs/Web/API/View_Transition_API/Using#stabilizing_page_state_to_make_cross-document_transitions_consistent) for more information on its use.

    > [!NOTE]
    > The [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) attribute is not supported for `rel="icon"` in Chromium-based browsers. See the [open Chromium issue](https://crbug.com/1121645).

    > [!NOTE]
    > Apple's iOS does not use this link type, nor the [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/link#sizes) attribute, like others mobile browsers do, to select a webpage icon for Web Clip or a start-up placeholder.
    > Instead it uses the non-standard [`apple-touch-icon`](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html#//apple_ref/doc/uid/TP40002051-CH3-SW4) and [`apple-touch-startup-image`](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html#//apple_ref/doc/uid/TP40002051-CH3-SW6) respectively.

    > [!NOTE]
    > The `shortcut` link type is often seen before `icon`, but this link type is non-conforming, ignored and **web authors must not use it anymore**.

    > [!NOTE]
    > Although recognized, the synonym `copyright` is incorrect and must be avoided.

