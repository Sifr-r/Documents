# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("Navigation.currentEntry")}}'s {{domxref("NavigationHistoryEntry.index")}} value is -1 or {{domxref("Navigation.entries", "navigation.entries().length - 1")}}, i.e., either the current {{domxref("Document")}} is not yet active, or the current history entry is the last one in the history, meaning that forwards navigation is not possible, or if the current {{domxref("Document")}} is unloading.

