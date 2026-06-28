# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Most of the time the natural width is the actual width of the image sent by the server. Nevertheless, browsers can modify an image before pushing it to the renderer. For example, Chrome [degrades the resolution of images on low-end devices](https://crbug.com/1187043#c7). In such cases, `naturalWidth` will consider the width of the image modified by such browser interventions as the natural width, and returns this value.

