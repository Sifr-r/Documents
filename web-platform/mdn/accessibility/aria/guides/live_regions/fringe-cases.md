# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Assistive technologies will generally only announce _dynamic_ changes in the content of a live region.
> Including an `aria-live` attribute or a specialized live region `role` (such as [`role="status"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role)) on the element you want to announce changes to works as long as you add the attribute before the changes occur — either in the original markup, or dynamically using JavaScript. Start with an empty live region, then – in a separate step – change the content inside the region.
> While not explicitly documented in the specification, browsers/assistive technologies do include special handling for [`role="alert"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role): in most cases, the content inside `role="alert"` regions is announced, even when the region (which already contains the notification/message) is present in the initial markup of the page, or injected dynamically into the page. However, note that `role="alert"` regions are – depending on the specific browser/assistive technology combination – automatically prefixed with "Alert" when they are announced.

