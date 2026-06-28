# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If a page needs to make connections to many third-party domains, preconnecting them all is counterproductive. The `preconnect` hint is best used for only the most critical connections. For the others, just use `<link rel="dns-prefetch">` to save time on the first step — the DNS lookup.

