# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Most of the time the natural height is the actual height of the image sent by the server. Nevertheless, browsers can modify an image before pushing it to the renderer. For example, Chrome [degrades the resolution of images on low-end devices](https://crbug.com/1187043#c7). In such cases, `naturalHeight` will consider the height of the image modified by such browser interventions as the natural height, and returns this value.

