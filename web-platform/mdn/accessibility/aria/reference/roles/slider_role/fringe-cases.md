# Fringe Cases

## Warnings & Notes

> [!WARNING]
> To change the slider value, touch-based assistive technologies need to respond to user gestures for increasing and decreasing the value by synthesizing key events.
> Fully test slider widgets using assistive technologies on devices where touch is a primary input mechanism before using the `slider` role (and all range widgets).

> [!NOTE]
> It is recommended to use native [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) elements rather than the `slider` role. User agents provide a stylized widget for the range input element, based on the current `value` as it relates to the minimum and maximum values. When using non-semantic elements, all features of the native semantic element need to be recreated with ARIA attributes, JavaScript and CSS.

