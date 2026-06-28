# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the given value for the `host` setter lacks a `port`, the URL's `port` will not change. This can be unexpected as the `host` getter does return a URL-port string, so one might have assumed the setter to always "reset" both.

