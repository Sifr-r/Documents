# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Based on the current implementation, browsers won't actually read the bytestream of a file to determine its media type.
> It is assumed based on the file extension; a PNG image file renamed to .txt would give "_text/plain_" and not "_image/png_". Moreover, `blob.type` is generally reliable only for common file types like images, HTML documents, audio and video.
> Uncommon file extensions would return an empty string.
> Client configuration (for instance, the Windows Registry) may result in unexpected values even for common types. **Developers are advised not to rely on this property as a sole validation scheme.**

