# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Sites which automatically play audio (or videos with an audio
> track) can be an unpleasant experience for users, so it should be avoided when
> possible. If you must offer autoplay functionality, you should make it opt-in
> (requiring a user to specifically enable it). However, autoplay can be useful when
> creating media elements whose source will be set at a later time, under user control.

> [!NOTE]
> Some browsers offer users the ability to override
> `autoplay` in order to prevent disruptive audio or video from playing
> without permission or in the background. Do not rely on `autoplay` actually
> starting playback and instead use {{domxref("HTMLMediaElement.play_event", 'play')}}
> event.

