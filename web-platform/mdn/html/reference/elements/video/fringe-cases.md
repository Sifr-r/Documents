# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Modern browsers block audio (or videos with an unmuted audio track) from autoplaying, as sites that automatically play audio can be an unpleasant experience for users. See our [autoplay guide](/en-US/docs/Web/Media/Guides/Autoplay) for additional information about how to properly use autoplay.

    > [!NOTE]
    > Videos with the [`loading="lazy"`](#loading) attribute set will not start downloading and autoplaying until the element is near or within the viewport.

        > [!NOTE]
        > The `loading="lazy"` attribute also impacts the [`autoplay`](#autoplay), [`poster`](#poster), and [`preload`](#preload) attributes, as described in each of those sections of the page.

    > [!NOTE]
    > Videos with the [`loading="lazy"`](#loading) attribute set will only download the `poster` resource once the video is near or within the viewport.

    > [!NOTE]
    >
    > - Videos with the [`loading="lazy"`](#loading) attribute set will only apply the `preload` behavior once the video is near or within the viewport.
    > - The `autoplay` attribute has precedence over `preload`. If `autoplay` is specified, the browser would obviously need to start downloading the video for playback.
    > - The specification does not force the browser to follow the value of this attribute; it is a mere hint.

