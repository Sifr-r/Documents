# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can find the source code for the demo below on GitHub in the [step-sequencer](https://github.com/mdn/webaudio-examples/tree/main/step-sequencer) subdirectory of the MDN [webaudio-examples](https://github.com/mdn/webaudio-examples) repo. You can also see the [live demo](https://mdn.github.io/webaudio-examples/step-sequencer/).

> [!NOTE]
> We didn't create this instrument to sound good but to provide demonstration code. This demonstration represents a _very_ simplified version of such an instrument. The sounds are based on a dial-up modem. If you are unaware of how such a device sounds, you can [listen to one here](https://soundcloud.com/john-pemberton/modem-dialup).

> [!NOTE]
> In our example, the wavetable is held in a separate JavaScript file (`wavetable.js`) because there are _so_ many values. We took it from a [repository of wavetables](https://github.com/GoogleChromeLabs/web-audio-samples/tree/main/src/demos/wavetable-synth/wave-tables), found in the [Web Audio API examples from Google Chrome Labs](https://github.com/GoogleChromeLabs/web-audio-samples/).

> [!NOTE]
> We also don't have to use the default wave types for either of these oscillators we're creating — we could use a wavetable and the periodic wave method as we did before. There is a multitude of possibilities with just a minimum of nodes.

> [!NOTE]
> Why -1 to 1? When outputting sound to a file or speakers, we need a number representing 0 dB full scale — the numerical limit of the fixed point media or DAC. In floating point audio, 1 is a convenient number to map to "full scale" for mathematical operations on signals, so oscillators, noise generators, and other sound sources typically output bipolar signals in the range -1 to 1. A browser will clamp values outside this range.

> [!NOTE]
> The Web Audio API comes with two types of filter nodes: {{domxref("BiquadFilterNode")}} and {{domxref("IIRFilterNode")}}. For the most part, a biquad filter will be good enough — it comes with different types such as lowpass, highpass, and bandpass. If you're looking to do something more bespoke, however, the IIR filter might be a good option — see [Using IIR filters](/en-US/docs/Web/API/Web_Audio_API/Using_IIR_filters) for more information.

> [!NOTE]
> You can easily modify the above function to take an array of files and loop over them to load more than one sample. This technique would be convenient for more complex instruments or gaming.

> [!NOTE]
> We can call `stop()` on an {{domxref("AudioBufferSourceNode")}}, however, this will happen automatically when the sample has finished playing.

> [!NOTE]
> The sound file was [sourced from soundbible.com](https://soundbible.com/1573-DTMF-Tones.html).

> [!NOTE]
> This is a much stripped down version of [Chris Wilson's A Tale Of Two Clocks (2013)](https://web.dev/articles/audio-scheduling) article, which goes into this method with much more detail. There's no point repeating it all here, but we highly recommend reading this article and using this method. Much of the code here is taken from his [metronome example](https://github.com/cwilso/metronome/blob/main/js/metronome.js), which he references in the article.

