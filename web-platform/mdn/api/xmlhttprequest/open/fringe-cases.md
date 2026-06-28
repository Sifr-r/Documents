# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Calling this method for an already active request
> (one for which `open()` has already been called) is the equivalent of calling
> {{domxref("XMLHttpRequest.abort", "abort()")}}.

    > [!NOTE]
    > Synchronous requests on the main thread can
    > be easily disruptive to the user experience and should be avoided; in fact, many
    > browsers have deprecated synchronous XHR support on the main thread entirely.
    > Synchronous requests are permitted in {{domxref("Worker")}}s.

