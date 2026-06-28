# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In JavaScript, the rules created using `@media` can be accessed with the {{domxref("CSSMediaRule")}} CSS object model interface.

> [!NOTE]
> CSS2.1 and [Media Queries 3](https://drafts.csswg.org/mediaqueries-3/#background) defined several additional media types (`tty`, `tv`, `projection`, `handheld`, `braille`, `embossed`, and `aural`, but they were deprecated in [Media Queries 4](https://drafts.csswg.org/mediaqueries/#media-types) and shouldn't be used.

    > [!NOTE]
    > In Level 3, the `not` keyword can't be used to negate an individual media feature expression, only an entire media query.

## Security Notes

Because media queries provide insights into the capabilities—and by extension, the features and design—of the device the user is working with, there is the potential that they could be abused to construct a ["fingerprint"](/en-US/docs/Glossary/Fingerprinting) which identifies the device, or at least categorizes it to some degree of detail that may be undesirable to users.

Because of this potential, a browser may opt to fudge the returned values in some manner in order to prevent them from being used to precisely identify a computer. A browser might also offer additional measures in this area; for example, if Firefox's "Resist Fingerprinting" setting is enabled, many media queries report default values rather than values representing the actual device state.

