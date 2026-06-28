# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can find working examples of all the code snippets in our [Voice-change-O-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) demo.

> [!NOTE]
> You don't need to connect the analyser's output to another node for it to work, as long as the input is connected to the source, either directly or via another node.

> [!NOTE]
> You can also specify a minimum and maximum power value for the fft data scaling range, using {{ domxref("AnalyserNode.minDecibels") }} and {{ domxref("AnalyserNode.maxDecibels") }}, and different data averaging constants using {{ domxref("AnalyserNode.smoothingTimeConstant") }}. Read those pages to get more information on how to use them.

> [!NOTE]
> The examples listed in this article have shown usage of {{ domxref("AnalyserNode.getByteFrequencyData()") }} and {{ domxref("AnalyserNode.getByteTimeDomainData()") }}. For working examples showing {{ domxref("AnalyserNode.getFloatFrequencyData()") }} and {{ domxref("AnalyserNode.getFloatTimeDomainData()") }}, refer to our [Voice-change-O-matic-float-data](https://mdn.github.io/voice-change-o-matic-float-data/) demo — this is exactly the same as the original [Voice-change-O-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/), except that it uses Float data, not unsigned byte data. See [this section](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L155) of the source code for details

