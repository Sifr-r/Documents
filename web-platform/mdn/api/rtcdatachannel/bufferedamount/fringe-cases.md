# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Closing the data channel doesn't reset this count, even though the user agent purges
> the queued messages. However, even after closing the channel, attempts to send
> messages continue to add to the `bufferedAmount` value, even though the
> messages are neither sent nor buffered.

