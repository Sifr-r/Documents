# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In modern browsers, a separate user gesture event is required for each `Window.open()` call, for security purposes. This prevents sites from spamming users with lots of windows. However, this poses an issue for multi-window applications. To work around this limitation, you can design your applications to open no more than one new window at once, reuse existing windows to display different pages, or advise users on how to update their browser settings to allow multiple windows.

