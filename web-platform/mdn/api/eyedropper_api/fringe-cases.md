# Fringe Cases

## Security Notes

To prevent malicious websites from getting pixel data from a user's screen without them realizing, the **EyeDropper API** implements the following measures:

- The API doesn't let the eyedropper mode start without user intent. The {{domxref("EyeDropper.open()")}} method can only be called in response to a user action (such as a button click).
- No pixel information can be retrieved without user intent. The promise returned by {{domxref("EyeDropper.open()")}} only resolves to a color value in response to a user action (clicking on a pixel). So the eyedropper cannot be used in the background without the user noticing it.
- To help users notice the eyedropper mode more easily, it is made obvious by browsers. The normal mouse cursor disappears after a short delay and a magnifying glass appears instead. There is also a delay between when the eyedropper mode starts and when the user can select a pixel to ensure the user has had time to see the magnifying glass.
- Users are also able to cancel the eyedropper mode at any time (by pressing the <kbd>Escape</kbd> key).

