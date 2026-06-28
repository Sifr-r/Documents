# Fringe Cases

## Warnings & Notes

> [!WARNING]
   > If you've done some sleuthing online, you may have come across [`navigator.getUserMedia`](/en-US/docs/Web/API/Navigator/getUserMedia) and assumed you can use that instead of `navigator.mediaDevices.getUserMedia`. You'd be wrong. The former is a deprecated method, which requires callbacks as well as constraints as arguments. The latter uses a promise so you don't need to use callbacks.

