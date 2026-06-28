# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Real Time Streaming Protocol (RTSP) controls media sessions between endpoints and is often used together with Real-time Transport Protocol (RTP) and with Real-time Control Protocol (RTCP) for media stream delivery. Using RTP with RTCP allows for adaptive streaming. This is not yet supported natively in most browsers.
>
> Some vendors implement propriety transport protocols, such as RealNetworks and their Real Data Transport (RDT).

> [!WARNING]
> Although the {{ htmlelement("audio") }} and {{ htmlelement("video") }} tags are protocol agnostic, no browser currently supports anything other than HTTP without requiring plugins, although this looks set to change. Protocols other than HTTP may also be subject to blocking from firewalls or proxy servers.

> [!NOTE]
> Time Shifting is the process of consuming a live stream sometime after it happened.

> [!NOTE]
> You can find a guide to encoding HLS and MPEG-DASH for use on the web at [Setting up adaptive streaming media sources](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Setting_up_adaptive_streaming_media_sources).

> [!NOTE]
> You can also [use WebM with the MPEG DASH adaptive streaming system](https://wiki.webmproject.org/adaptive-streaming/webm-dash-specification).

> [!NOTE]
> [Opus is a mandatory format](https://datatracker.ietf.org/doc/html/draft-ietf-rtcweb-audio-05) for WebRTC browser implementations.

> [!NOTE]
> [SHOUTcast URLs may require a semicolon to be appended to them](https://stackoverflow.com/questions/2743279/how-could-i-play-a-shoutcast-icecast-stream-using-html5).

> [!NOTE]
> SHOUTcast and Icecast are among the most established and popular technologies, but there are many [more streaming media systems available](https://en.wikipedia.org/wiki/List_of_streaming_media_systems#Servers).

