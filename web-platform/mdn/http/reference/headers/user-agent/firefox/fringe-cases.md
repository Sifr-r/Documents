# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The recommended way of sniffing for Gecko-based browsers (if you _have to_ sniff for the browser engine instead of using feature detection) is by the presence of the `Gecko` and `rv:` strings, since some other browsers include a `like Gecko` token.

> [!NOTE]
> The version numbers are not relevant. Avoid inferring materials based on these.

> [!NOTE]
> Firefox OS devices identify themselves without any operating system indication; for example: "Mozilla/5.0 (Mobile; rv:15.0) Gecko/15.0 Firefox/15.0". The web is the platform.

> [!NOTE]
> An aarch64 CPU is reported as x86_64 on Windows 11, and x86 on Windows 10 (since it doesn't support x64 emulation).
> See [Bugzilla #1763310](https://bugzil.la/1763310).

> [!NOTE]
> In Firefox 127.0 and later, 32-bit x86 will now be reported as x86_64 in Firefox's User-Agent string, {{domxref("navigator.platform")}}, and {{domxref("navigator.oscpu")}} (see [Firefox 127.0 Release Notes](https://www.firefox.com/en-US/firefox/127.0/releasenotes/)).

