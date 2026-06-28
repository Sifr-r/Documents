# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Not every user modification results in `beforeinput` firing. Also the event may fire but be non-cancelable. This may happen when the modification is done by autocomplete, by accepting a correction from a spell checker, by password manager autofill, by {{Glossary("Input method editor", "IME")}}, or in other ways. The details vary by browser and OS. To override the edit behavior in all situations, the code needs to handle the `input` event and possibly revert any modifications that were not handled by the `beforeinput` handler. See bugs [1673558](https://bugzil.la/1673558) and [1763669](https://bugzil.la/1763669).

