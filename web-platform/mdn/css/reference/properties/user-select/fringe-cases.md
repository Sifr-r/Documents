# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `user-select` is not an inherited property, though the initial `auto` value makes it behave like it is inherited most of the time. WebKit/Chromium-based browsers _do_ implement the property as inherited, which violates the behavior described in the spec, and this will bring some issues. Until now, Chromium has chosen to [fix the issues](https://chromium.googlesource.com/chromium/src/+/b01af0b296ecb855aac95c4ed335d188e6eac2de) to make the final behavior meet the specifications.

> [!NOTE]
> The [CSS basic user interface](/en-US/docs/Web/CSS/Guides/Basic_user_interface) module defines a `contain` value for the `user-select` property to enable selection to start within the element to be contained by the bounds of that element, however, this is not supported in any browsers.

