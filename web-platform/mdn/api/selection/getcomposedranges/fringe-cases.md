# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This method should be used instead of {{domxref("Selection.getRangeAt()")}} when selecting ranges that can potentially cross shadow root boundaries.
> {{domxref("Selection.getRangeAt()")}} is not aware of shadow roots.
> The returned range is not specified, and varies between browsers.

> [!NOTE]
> In the original specification, shadow roots were specified as a set of [rest parameters](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters). Some browsers may still support this legacy syntax.

