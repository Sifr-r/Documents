# Fringe Cases

## Warnings & Notes

> [!WARNING]
    > This attribute must not be used if the `src` attribute is absent (i.e., for inline scripts) for classic scripts, in this case it would have no effect.

    > [!NOTE]
    > Alternatively, JavaScript-based attribution sources or triggers can be registered by sending a {{domxref("Window/fetch", "fetch()")}} request containing the `attributionReporting` option (either set directly on the `fetch()` call or on a {{domxref("Request")}} object passed into the `fetch()` call), or by sending an {{domxref("XMLHttpRequest")}} with {{domxref("XMLHttpRequest.setAttributionReporting", "setAttributionReporting()")}} invoked on the request object.

      > [!NOTE]
      > Specifying multiple URLs means that multiple attribution sources can be registered on the same feature. You might for example have different campaigns that you are trying to measure the success of, which involve generating different reports on different data.

    > [!NOTE]
    > Only `script` elements in the document's `<head>` can possibly block rendering. Scripts are not render-blocking by default; if a `script` element does not include `type="module"`, `async`, or `defer`, then it blocks _parsing_, not _rendering_. If such a `script` element is added dynamically via script, you must set `blocking = "render"` for it to block rendering.

    > [!WARNING]
    > This attribute must not be used if the `src` attribute is absent (i.e., for inline scripts), in this case it would have no effect.
    >
    > The `defer` attribute has no effect on [module scripts](/en-US/docs/Web/JavaScript/Guide/Modules) — they defer by default.

    > [!NOTE]
    > An empty string value (`""`) is both the default value, and a fallback value if `referrerpolicy` is not supported. If `referrerpolicy` is not explicitly specified on the `<script>` element, it will adopt a higher-level referrer policy, i.e., one set on the whole document or domain. If a higher-level policy is not available, the empty string is treated as being equivalent to `strict-origin-when-cross-origin`.

