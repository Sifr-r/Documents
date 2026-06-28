# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This article discusses client-side image maps only. Do not use server-side image maps, which require the user to have a mouse.

> [!WARNING]
> Multiple images referencing the same image map may lead to unexpected browser behavior, severely degrading usability and accessibility. For example, when a user keyboard navigates an image with a re-used image map in Safari and Chromium-based browsers, latter image instances using that same image map are skipped entirely. In Firefox, all image maps get keyboard focus simultaneously and when the user keyboard navigates past the image, the next focused element is the one after the last image instance, effectively skipping everything between the two images.

