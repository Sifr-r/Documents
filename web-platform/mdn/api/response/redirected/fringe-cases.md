# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Checking `redirected` to prevent redirects is not recommended, because by the time a response is received, the redirect has already happened, and you may have sent the request to an unintended destination, potentially sending sensitive information.
> Instead, you should do the filtering when you call {{domxref("Window/fetch", "fetch()")}}.
> See the example [Disallowing redirects](#disallowing_redirects), which shows this being done.

