# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Instead of using this value you should determine whether or not the connection is readable by checking to see if {{domxref("RTCIceCandidatePairStats.requestsReceived", "requestsReceived")}} is greater than 0:
>
> ```js
> if (icpStats.requestsReceived > 0) {
>   /* at least one ICE request has been received */
> }
> ```

