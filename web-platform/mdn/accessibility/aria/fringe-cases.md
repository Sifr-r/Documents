# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Many of these widgets are fully supported in modern browsers. **Developers should prefer using the correct semantic HTML element over using ARIA**, if such an element exists. For instance, native elements have built-in [keyboard accessibility](/en-US/docs/Web/Accessibility/Guides/Keyboard-navigable_JavaScript_widgets), roles and states. However, if you choose to use ARIA, you are responsible for mimicking the equivalent browser behavior in script.

> [!NOTE]
> There is a saying "No ARIA is better than bad ARIA." In [WebAim's survey of over one million home pages](https://webaim.org/projects/million/#aria), they found that Home pages with ARIA present averaged 41% more detected errors than those without ARIA. While ARIA is designed to make web pages more accessible, if used incorrectly, it can do more harm than good.

> [!NOTE]
> The `min` attribute is not allowed for the {{HTMLElement('progress')}} element; its minimum value is always `0`.

> [!NOTE]
> HTML landmark elements ({{HTMLElement("main")}}, {{HTMLElement("header")}}, {{HTMLElement("nav")}}, etc.) have built-in implicit ARIA roles, so there is no need to duplicate them.

