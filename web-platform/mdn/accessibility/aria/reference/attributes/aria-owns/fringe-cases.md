# Fringe Cases

## Warnings & Notes

> [!NOTE]
> An "owned" element is any DOM descendant of the element, any element specified as a child via `aria-owns`, or any DOM descendant of the owned child. The `aria-owns`-owned element should be an element that belongs to a separate parent tree in the DOM but should be treated as a child of the current element.

> [!NOTE]
> The `aria-owns` attribute should only be used when the parent/child relationship cannot be determined from the DOM.

> [!WARNING]
> While [`aria-owns` is now supported](https://a11ysupport.io/tech/aria/aria-owns_attribute) in all modern browsers, `aria-owns` may not be exposed to users of macOS and iOS using VoiceOver prior to iOS 17.3 and macOS 14.3.

