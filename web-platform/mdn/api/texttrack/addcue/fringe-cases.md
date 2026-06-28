# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The {{domxref("TextTrackCue")}} interface is an abstract class used as the parent for other cue interfaces such as {{domxref("VTTCue")}}. Therefore, when adding a cue you will be using one of the cue types that inherit from `TextTrackCue`.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the rules for this {{domxref("TextTrackList")}} do not match those that are appropriate for the incoming {{domxref("TextTrackCue")}}.

