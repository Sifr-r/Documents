# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The {{domxref("element/contentvisibilityautostatechange_event", "contentvisibilityautostatechange")}} event fires on any element with `content-visibility: auto` set on it when its rendering work starts or stops being skipped. This provides a convenient way for an app's code to start or stop rendering processes (e.g., drawing on a {{htmlelement("canvas")}}) when they are not needed, thereby conserving processing power.

> [!NOTE]
> When transitioning an element's `content-visibility` value, you don't need to provide a set of starting values for transitioned properties using a {{cssxref("@starting-style")}} block, like you do when [transitioning `display`](/en-US/docs/Web/CSS/Reference/Properties/display#animating_display). This is because `content-visibility` doesn't hide an element from the DOM like `display` does: it just skips rendering the element's content.

