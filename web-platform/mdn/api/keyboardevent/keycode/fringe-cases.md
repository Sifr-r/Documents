# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Web developers shouldn't use the `keyCode` attribute for printable characters when handling `keydown` and `keyup` events. As described above, the `keyCode` attribute is not useful for printable characters, especially those input with the <kbd>Shift</kbd> or <kbd>Alt</kbd> key pressed.

> [!WARNING]
> The purpose of these new additional rules is for making users whose keyboard layouts map unicode characters to punctuation keys in a US keyboard layout can use web applications which support Firefox only with ASCII-capable keyboard layouts or just with a US keyboard layout. Otherwise, the newly mapped `keyCode` values may be conflict with other keys. For example, if the active keyboard layout is Russian, the `keyCode` value of **both** the `"Period"` key and `"Slash"` key are `190` (`KeyEvent.DOM_VK_PERIOD`). If you need to distinguish those keys but you don't want to support all keyboard layouts in the world by yourself, you should probably use {{domxref("KeyboardEvent.code")}}.

> [!NOTE]
> Recent Mac doesn't have a <kbd>NumLock</kbd> key, and therefore state. That's why the unlocked state is not available.

