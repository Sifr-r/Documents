# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > On Chrome running on dual-GPU macOS devices, if `requestAdapter()` is called without a `powerPreference` option, the high-performance discrete GPU is returned when the user's device is on AC power. Otherwise, the low-power integrated GPU is returned.

> [!NOTE]
> The specification includes a `forceFallbackAdapter` option for `requestAdapter()`. This is a boolean that, if set to `true`, forces the user agent to return a fallback adapter if one is available. This is not yet supported by any browser.

## Exceptions

None.

