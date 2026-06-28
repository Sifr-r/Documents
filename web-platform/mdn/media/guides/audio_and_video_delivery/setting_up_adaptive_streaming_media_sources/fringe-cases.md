# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You will need to be comfortable with make files and installing dependencies to get this software up and running.

> [!NOTE]
> Since MPEG-DASH decoding is done partially using JavaScript and MSE files are often grabbed using XHR, keep same origin rules in mind.

> [!NOTE]
> If you use WebM you can use the methods shown in this tutorial [DASH Adaptive Streaming for HTML 5 Video](/en-US/docs/Web/API/Media_Source_Extensions_API/DASH_Adaptive_Streaming).

> [!NOTE]
> You can also split out your audio and video streams into separate files, which can then be prioritized and served separately depending on bandwidth.

> [!NOTE]
> MPEG-DASH playback relies on [dash.js](https://github.com/Dash-Industry-Forum/dash.js/) and browser support for [Media Source Extensions](https://w3c.github.io/media-source/), see the latest [dash.js reference player](https://reference.dashif.org/dash.js/v4.4.0/samples/dash-if-reference-player/index.html).

> [!NOTE]
> You can find more details about these tools at [Using HTTP Live Streaming](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/StreamingMediaGuide/UsingHTTPLiveStreaming/UsingHTTPLiveStreaming.html).

> [!NOTE]
> Comprehensive information on how to encode media for Apple's HLS format can be found on [Apple's Developer Pages](https://developer.apple.com/streaming/).

