# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `globalThis` property is configurable and writable so that code authors can hide it when executing untrusted code and prevent exposing the global object.

> [!NOTE]
> `globalThis` is generally the same concept as the global object (i.e., adding properties to `globalThis` makes them global variables) — this is the case for browsers and Node — but hosts are allowed to provide a different value for `globalThis` that's unrelated to the global object.

