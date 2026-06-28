# Fringe Cases

## Warnings & Notes

> [!WARNING]
    > This ignores the user's keyboard layout, so that if the user presses the key at the "Y" position in a QWERTY keyboard layout (near the middle of the row above the home row), this will always return "KeyY", even if the user has a QWERTZ keyboard (which would mean the user expects a "Z" and all the other properties would indicate a "Z") or a Dvorak keyboard layout (where the user would expect an "F"). If you want to display the correct keystrokes to the user, you can use {{domxref("Keyboard.getLayoutMap()")}}.

> [!NOTE]
> `compositionstart` may fire _after_ `keydown` when typing the first character that opens up the IME, and `compositionend` may fire _before_ `keydown` when typing the last character that closes the IME. In these cases, `isComposing` is false even when the event is part of composition. However, {{domxref("KeyboardEvent.keyCode")}} is still `229` in these cases, so it's still advisable to check `keyCode` as well, although it's deprecated.

