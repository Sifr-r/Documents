# Fringe Cases

## Warnings & Notes

> [!NOTE]
> It is recommended to use [`<input type="number">`](/en-US/docs/Web/HTML/Reference/Elements/input/number) element, or other input types for dates and time that also implicitly have the `role="spinbutton"` semantic, rather than the `spinbutton` role. User agents provide stylized widget for the these input elements which provide default increment, decrement, and native range limiting functionality. When using non-semantic elements, all features of the native semantic element need to be recreated with ARIA attributes, JavaScript, and CSS.

> [!WARNING]
> To change the spinbutton value, touch-based assistive technologies need to respond to user gestures for increasing and decreasing the value by synthesizing key events.
> Fully test spinbutton widgets using assistive technologies on devices where touch is a primary input mechanism before using the `spinbutton` role (and all range widgets).

