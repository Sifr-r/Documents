# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The position, forward, and up value are set and retrieved using different syntaxes. Retrieval is done by accessing, for example, `AudioListener.positionX`, while setting the same property is done with `AudioListener.positionX.value`. This is why these values are not marked read only, which is how they appear in the specification's IDL.

> [!NOTE]
> Although these methods are deprecated they are currently the only way to set the orientation and position in Firefox (see [Firefox bug 1283029](https://bugzil.la/1283029)).

