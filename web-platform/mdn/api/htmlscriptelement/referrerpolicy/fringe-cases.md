# Fringe Cases

## Warnings & Notes

> [!NOTE]
> An empty string value (`""`) is both the default
> value, and a fallback value if `referrerpolicy` is not supported. If
> `referrerpolicy` is not explicitly specified on the
> `<script>` element, it will adopt a higher-level referrer policy,
> i.e., one set on the whole document or domain. If a higher-level policy is not
> available, the empty string is treated as being equivalent to
> `no-referrer-when-downgrade`.

