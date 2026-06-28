# Fringe Cases

## Warnings & Notes

> [!NOTE]
> All other characters are unrecognized and will cause
> {{domxref("RTCDTMFSender.insertDTMF", "insertDTMF()")}} to throw an
> `InvalidCharacterError` {{domxref("DOMException")}}.

## Exceptions

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Thrown if a character is not a DTMF tone character (`0-9`, `A-D`, `#`, or `,`).

