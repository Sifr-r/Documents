# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `on('close')` event that is called on the `conn` variable isn't available in Firefox yet; this just means that in Firefox each caller will have to hang up individually.

> [!WARNING]
> The way we've currently coded things means that when a connection is closed, both browsers will be updated **only** if the person who started the call presses "Hang up" first. If the person who answered the call clicks "Hang up" first, the other caller will also have to click "Hang up" to see the correct HTML.

