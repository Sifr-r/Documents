# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The [channel notation](https://en.wikipedia.org/wiki/Surround_sound#Channel_notation) is a numeric value, such as _2.0_ or _5.1_, representing the number of audio channels available on a signal. The first number is the number of full frequency range audio channels the signal includes. The number appearing after the period indicates the number of those channels reserved for low-frequency effect (LFE) outputs; these are often called **subwoofers**.

> [!NOTE]
> To get a time in seconds from a frame count, divide the number of frames by the sample rate. To get the number of frames from the number of samples, you only need to divide the latter value by the channel count.

> [!NOTE]
> In [digital audio](https://en.wikipedia.org/wiki/Digital_audio), **44,100 [Hz](https://en.wikipedia.org/wiki/Hertz)** (alternately represented as **44.1 kHz**) is a common [sampling frequency](https://en.wikipedia.org/wiki/Sampling_frequency). Why 44.1 kHz?
>
> Firstly, because the [hearing range](https://en.wikipedia.org/wiki/Hearing_range) of human ears is roughly 20 Hz to 20,000 Hz. Via the [Nyquist–Shannon sampling theorem](https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem), the sampling frequency must be greater than twice the maximum frequency one wishes to reproduce. Therefore, the sampling rate has to be _greater_ than 40,000 Hz.
>
> Secondly, signals must be [low-pass filtered](https://en.wikipedia.org/wiki/Low-pass_filter) before sampling, otherwise [aliasing](https://en.wikipedia.org/wiki/Aliasing) occurs. While an ideal low-pass filter would perfectly pass frequencies below 20 kHz (without attenuating them) and perfectly cut off frequencies above 20 kHz, in practice, a [transition band](https://en.wikipedia.org/wiki/Transition_band) is necessary, where frequencies are partly attenuated. The wider this transition band is, the easier and more economical it is to make an [anti-aliasing filter](https://en.wikipedia.org/wiki/Anti-aliasing_filter). The 44.1 kHz sampling frequency allows for a 2.05 kHz transition band.

> [!NOTE]
> Audio resampling is very similar to image resizing. Say you've got a 16 x 16 image but want it to fill a 32 x 32 area. You resize (or resample) it. The result has less quality (it can be blurry or edgy, depending on the resizing algorithm), but it works, with the resized image taking up less space. Resampled audio is the same: you save space, but, in practice, you cannot correctly reproduce high-frequency content or treble sound.

> [!NOTE]
> For more information, see our [Visualizations with Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Visualizations_with_Web_Audio_API) article.

> [!NOTE]
> For more information, see our [Web audio spatialization basics](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics) article.

