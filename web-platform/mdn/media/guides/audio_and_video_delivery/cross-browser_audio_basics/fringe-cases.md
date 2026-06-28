# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can also use an MP4 file instead of MP3. MP4 files typically contain [AAC](https://en.wikipedia.org/wiki/Advanced_Audio_Coding) encoded audio. You can use `type="audio/mp4"`. (Currently, browsers that support mp3 also support mp4 audio).

> [!NOTE]
> This value is often ignored on mobile platforms, and its use is not recommended unless really necessary. Autoplaying audio (and video) is usually really annoying. Plus browsers have policies that will block autoplay entirely in many situations. See the [Autoplay guide for media and Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay) for details.

> [!NOTE]
> This value is often ignored on mobile platforms.

> [!NOTE]
> This value is often ignored on mobile platforms.

> [!NOTE]
> There is no stop method — to implement a stop function, you'd have to pause the media then set the [`currentTime`](#currenttime) property value to 0.

> [!NOTE]
> A very early spec specified that the browser should return `no` instead of an empty string, but thankfully the number of people using older browsers that implement this version of the spec are few and far between.

> [!NOTE]
> You can read more on [Buffering, Seeking and Time Ranges](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/buffering_seeking_time_ranges) elsewhere.

