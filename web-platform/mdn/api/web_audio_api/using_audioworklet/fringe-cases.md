# Fringe Cases

## Warnings & Notes

> [!NOTE]
> At this time, unfortunately, Chrome does not implement this algorithm in a manner that matches the current standard. Instead, it keeps the node alive if you return `true` and shuts it down if you return `false`. Thus for compatibility reasons you must always return `true` from `process()`, at least on Chrome. However, once [this Chrome issue](https://crbug.com/921354) is fixed, you will want to change this behavior if possible as it may have a slight negative impact on performance.

