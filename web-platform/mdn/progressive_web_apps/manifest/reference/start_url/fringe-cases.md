# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `start_url` is a hint for browsers. [Browsers have flexibility](#description) in how they the handle `start_url` and may not always use the specified value.

    > [!NOTE]
    > On some browsers the `start_url` _must_ be specified for a [PWA to be installable](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#installability) (see the compatibility section below).
    > You can set `"start_url": "./"` to use the default behavior on all browsers.

    > [!NOTE]
    > If [`scope`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) is not specified in the manifest it will be inferred from the `start_url` (or effective `start_url` if the value is undefined or invalid).

