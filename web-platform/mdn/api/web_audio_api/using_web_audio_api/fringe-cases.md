# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If you just want to process audio data, for instance, buffer and stream it but not play it, you might want to look into creating an {{domxref("OfflineAudioContext")}}.

> [!NOTE]
> If the sound file you're loading is held on a different domain you will need to use the `crossorigin` attribute; see [Cross Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS) for more information.

> [!NOTE]
> The `<audio>` element above is represented in the DOM by an object of type {{domxref("HTMLMediaElement")}}, which comes with its own set of functionality. All of this has stayed intact; we are merely allowing the sound to be available to the Web Audio API.

> [!NOTE]
> Range inputs are a really handy input type for updating values on audio nodes. You can specify a range's values and use them directly with the audio node's parameters.

> [!NOTE]
> The values of node objects (e.g., `GainNode.gain`) are not simple values; they are actually objects of type {{domxref("AudioParam")}} — these called parameters. This is why we have to set `GainNode.gain`'s `value` property, rather than just setting the value on `gain` directly. This enables them to be much more flexible, allowing for passing the parameter a specific set of values to change between over a set period of time, for example.

> [!NOTE]
> The `StereoPannerNode` is for simple cases in which you just want stereo panning from left to right.
> There is also a {{domxref("PannerNode")}}, which allows for a great deal of control over 3D space, or sound _spatialization_, for creating more complex effects.
> This is used in games and 3D apps to create birds flying overhead, or sound coming from behind the user for instance.

> [!NOTE]
> The constructor method of creating nodes is not supported by all browsers at this time. The older factory methods are supported more widely.

