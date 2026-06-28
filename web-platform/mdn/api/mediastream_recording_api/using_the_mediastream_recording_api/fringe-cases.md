# Fringe Cases

## Warnings & Notes

> [!NOTE]
> All of the code below is placed inside the `getUserMedia` success callback.

> [!NOTE]
> The browser will fire `dataavailable` events as needed, but if you want to intervene you can also include a timeslice when invoking the `start()` method — for example `start(10000)` — to control this interval, or call {{domxref("MediaRecorder.requestData()")}} to trigger an event when you need it.

