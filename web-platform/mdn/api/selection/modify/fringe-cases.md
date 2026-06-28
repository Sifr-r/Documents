# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Firefox does **not** implement
> `"sentence"`, `"paragraph"`, `"sentenceboundary"`,
> `"paragraphboundary"`, or `"documentboundary"`. WebKit and Blink
> do.

> [!NOTE]
> Starting in Firefox 5, the `"word"`
> granularity no longer includes the following space, regardless of the default platform
> behavior. This makes the behavior more consistent, as well as making it work the same
> way WebKit used to work, but unfortunately they have recently changed their behavior.

