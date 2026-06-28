# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This property is deprecated.
> You can instead determine whether or not an incoming ICE request is available to read by checking to see if {{domxref("RTCIceCandidatePairStats.responsesReceived", "responsesReceived")}} is greater than 0, and that the time specified by {{domxref("RTCIceCandidatePairStats.consentExpiredTimestamp", "consentExpiredTimestamp")}} has not passed:
>
> ```js
> if (
>   icpStats.responsesReceived > 0 &&
>   icpStats.consentExpiredTimestamp < performance.now()
> ) {
>   /* at least one ICE response has been received */
> }
> ```

