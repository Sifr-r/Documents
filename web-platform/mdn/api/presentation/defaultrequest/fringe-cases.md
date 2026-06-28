# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Some [controlling user agents](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent) may allow the user to initiate a default [presentation connection](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection) and select a [presentation display](https://www.w3.org/TR/presentation-api/#dfn-presentation-display) with the same user gesture. For example, the browser chrome could allow the user to pick a display from a menu, or allow the user to tap on a [Near Field Communications (NFC)](https://nfc-forum.org/) enabled display. In this case, when the [controlling user agent](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent) asks for permission while [starting a presentation](https://www.w3.org/TR/presentation-api/#dfn-start-a-presentation), the browser could offer that display as the default choice, or consider the gesture as granting permission for the display and bypass display selection entirely.

> [!NOTE]
> If a [controlling user agent](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent) does not support initiation of a [presentation connection](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection) from the browser chrome, setting `defaultRequest` will have no effect.

