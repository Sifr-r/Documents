# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Sites that automatically play audio (or videos with an audio track) can be an unpleasant experience for users, so should be avoided when possible.
    > If you must offer autoplay functionality, you should make it opt-in (requiring a user to specifically enable it).
    > However, this can be useful when creating media elements whose source will be set at a later time, under user control.
    > See our [autoplay guide](/en-US/docs/Web/Media/Guides/Autoplay) for additional information about how to properly use autoplay.

    > [!NOTE]
    > Audio with the [`loading="lazy"`](#loading) attribute set will not start downloading and autoplaying until the controls for the media are near or within the viewport. Lazy-loaded audio without the `controls` attribute will not autoplay.

        > [!NOTE]
        > In order for audio elements to intersect visibly with the viewport, they need to be visible. Browsers use the `controls` attribute to make audio elements visible, so it's needed for lazy loading. Lazy-loaded audio without the `controls` attribute will not load.

        > [!NOTE]
        > The `loading="lazy"` attribute also impacts the [`autoplay`](#autoplay) attribute as described in that section of this page.

    > [!NOTE]
    >
    > - Audio with the [`loading="lazy"`](#loading) attribute set will only apply the `preload` behavior once the audio controls are near or within the viewport.
    > - The `autoplay` attribute has precedence over `preload`. If `autoplay` is specified, the browser would obviously need to start downloading the audio for playback.
    > - The browser is not forced by the specification to follow the value of this attribute; it is a mere hint.

> [!NOTE]
> Even though it's an `<audio>` element, it still has video and text track lists, and can in fact be used to present video, although the user interface implications can be odd.

