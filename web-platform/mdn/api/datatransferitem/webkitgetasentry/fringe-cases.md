# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This function is implemented as `webkitGetAsEntry()` in non-WebKit browsers including Firefox at this time; it may be renamed to
> `getAsEntry()` in the future, so you should code defensively, looking for both.

> [!NOTE]
> To read all files in a directory, `readEntries` needs to be called repeatedly until it returns an empty array.
> In Chromium-based browsers, the following example will only return a max of 100 entries.

