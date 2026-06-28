# Fringe Cases

## Warnings & Notes

> [!WARNING]
> There are many pitfalls that can lead to this becoming an infinite loop!
>
> - Do _not_ place the regular expression literal (or {{jsxref("RegExp")}} constructor) within the `while` condition — it will recreate the regex for every iteration and reset {{jsxref("RegExp/lastIndex", "lastIndex")}}.
> - Be sure that the [global (`g`) flag](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags) is set, or `lastIndex` will never be advanced.
> - If the regex may match zero-length characters (e.g., `/^/gm`), increase its {{jsxref("RegExp/lastIndex", "lastIndex")}} manually each time to avoid being stuck in the same place.

