# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The Speculation Rules API doesn't handle subresource prefetches; for that you'll need to use `<link rel="prefetch">`.

> [!NOTE]
> Rules can be specified using both an inline script and the HTTP header simultaneously — all rules applied to a document are parsed and added to the document's speculation rules list.

> [!NOTE]
> In the future an opt-in for cross-site prefetches will be provided via the {{httpheader("Supports-Loading-Mode")}} header, but this was not implemented at the time of writing (only cross-origin, same-site [prerendering](#using_prerendering) opt-in was available).

> [!NOTE]
> To put the amount of potential resource wastage in perspective, a prerender uses about the same amount of resources as rendering an {{htmlelement("iframe")}}.

> [!NOTE]
> Many APIs will be automatically deferred when prerendering/until activation. See [Platform features deferred or restricted during prerender](#platform_features_deferred_or_restricted_during_prerender) for more details.

> [!NOTE]
> You can find more details about the detection code in the [Detecting prefetched and prerendered pages](#detecting_prefetched_and_prerendered_pages) section.

> [!NOTE]
> Browsers will cache prefetched pages for a short time (Chrome for example caches them for 5 minutes) before discarding them, so in any case, your users might see content that is up to 5 minutes out of date.

> [!NOTE]
> In the small number of cases where deferring and restricting are not possible, the prerender is canceled.

