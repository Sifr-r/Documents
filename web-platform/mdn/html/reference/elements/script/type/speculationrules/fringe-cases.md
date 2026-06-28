# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Speculation rules can be defined inside external text files referenced by the {{httpheader("Speculation-Rules")}} HTTP header, using the same [JSON representation provided below](#speculation_rules_json_representation). Specifying an HTTP header is useful in cases where developers are not able to directly modify the document itself.

> [!NOTE]
> The `src`, `async`, `nomodule`, `defer`, `crossorigin`, `integrity`, and `referrerpolicy` attributes must not be specified.

> [!NOTE]
> Consult the [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) main page for full details on how to use prefetch and prerender effectively.

    > [!NOTE]
    > A cross-site prefetch requires a referrer policy that is at least as strict as the default `"strict-origin-when-cross-origin"` value — so `"strict-origin-when-cross-origin"`, `"same-origin"`, `"strict-origin"`, or `"no-referrer"`. A laxer policy set in the speculation rules will override a stricter policy set on the referring page as long as it is still sufficiently strict for the cross-site case.

    > [!NOTE]
    > In the case of document rules, the matched link's specified referrer policy (e.g., using the [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/a#referrerpolicy) attribute) will be used, unless the rule specifies a policy that overrides it.

    > [!WARNING]
    > Prefetches will automatically fail in browsers that cannot meet a specified requirement, even if they support the [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API).

> [!NOTE]
> As speculation rules use a `<script>` element, they need to be explicitly allowed in the [`Content-Security-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy) [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) directive if the site includes it. This is done by adding the `"inline-speculation-rules"` value along with a hash- or nonce-source.

> [!NOTE]
> This code snippet provides a list (`"urls"`) rule and a document (`"where"`) rule example.

> [!NOTE]
> The `where` pattern above does not include cross-site links, which are supported for prefetching (provided the user has no cookies set for the destination site, to protect against tracking) but not for prerendering.

> [!WARNING]
> Additional care must be taken when using prerender with `No-Vary-Search` since the page may initially be prerendered with different URL parameters. `No-Vary-Search` is used for URL parameters that deliver the same resource from the server, but are used by the client for various reasons (client-side rendering, UTM parameters for analytics measurement, etc.). As the initial prerender may be for different URL parameters, any code depending on them should only run after prerender activation.

> [!NOTE]
> As a [structured field](https://www.rfc-editor.org/info/rfc8941/), the parameters should be space-separated, quoted strings — as shown above — and not comma-separated, which developers may be more used to.

> [!NOTE]
> The effects of eagerness settings are less useful for list rules. By default, list rule URLs are prefetched/prerendered immediately as soon as the rules are parsed, which is what you'd expect — they are intended for explicit listing of high-priority URLs that you want to make available as soon as possible. For this reason, `eager` has the same effect as `immediate` in current implementations. Lower eagerness settings are for prefetching/prerendering when links are interacted with, and for these you are more likely to use document rules to find them on the page.

## Exceptions

- `TypeError`
  - : The speculation rules definition is not a valid JSON object.

