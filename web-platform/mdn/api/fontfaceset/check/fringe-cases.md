# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `check()` method is not designed to verify whether a specific font style can be rendered or if a particular font is fully loaded. Instead, it returns `true` if the specified text can be rendered using the given font specification without causing a font swap. This means that even if the requested font isn't available or fully loaded, the method may still return `true`. This behavior helps avoid the visual issues associated with font swapping but may be counterintuitive if you're trying to confirm the availability of a specific font.

