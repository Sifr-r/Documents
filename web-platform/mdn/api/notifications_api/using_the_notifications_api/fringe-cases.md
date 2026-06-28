# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The examples in this article uses the {{domxref("Notification/Notification", "Notification()")}} constructor to create notifications.
> This is fine for desktop, but on most mobile browsers this will throw a {{jsxref("TypeError")}}.
> If you are targeting mobile devices, you should register a service worker and use {{domxref("ServiceWorkerRegistration.showNotification()")}} instead.

> [!NOTE]
> There's no way to reliably feature-test whether `Notification.requestPermission` supports the promise-based version.
> If you need to support older browsers, just use the callback-based version—although this is deprecated, it still works in new browsers.
> Check the [browser compatibility table](/en-US/docs/Web/API/Notification/requestPermission_static#browser_compatibility) for more information.

> [!NOTE]
> This API shouldn't be used just to have the notification removed from the screen after a fixed delay (on modern browsers) since this method will also remove the notification from any notification tray, preventing users from interacting with it after it was initially shown.

> [!NOTE]
> When you receive a "close" event, there is no guarantee that it's the user who closed the notification.
> This is in line with the specification, which states: "When a notification is closed, either by the underlying notifications platform or by the user, the close steps for it must be run."

> [!NOTE]
> The events listed above apply to [non-persistent notifications](/en-US/docs/Web/API/Notifications_API#persistent_and_non-persistent_notifications) created with the {{domxref("Notification.Notification", "Notification()")}} constructor.
> Persistent notifications created via {{domxref("ServiceWorkerRegistration.showNotification()")}} instead fire the {{domxref("ServiceWorkerGlobalScope.notificationclick_event", "notificationclick")}} and {{domxref("ServiceWorkerGlobalScope.notificationclose_event", "notificationclose")}} events on the {{domxref("ServiceWorkerGlobalScope")}}.

