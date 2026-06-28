# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This error is only generated when `await` or `yield` are valid operators in this function context. Otherwise, `await` or `yield` would be parsed as an identifier, and either not cause an error, or cause an error like "reserved identifier", or "unexpected token" if there's an expression following it.

