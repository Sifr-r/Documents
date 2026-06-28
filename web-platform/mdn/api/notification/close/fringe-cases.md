# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This API shouldn't be used just to have the notification
> removed from the screen after a fixed delay since this method will also remove the
> notification from any notification tray, preventing users from interacting with it
> after it was initially shown. A valid use for this API would be to remove a
> notification that is no longer relevant (e.g., the user already read the notification
> on the webpage in the case of a messaging app or the following song is already playing
> in a music app).

