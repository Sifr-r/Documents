# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This method must be invoked in a top-level [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts), that is, not embedded in an {{htmlelement("iframe")}}.

> [!NOTE]
> Most supporting browsers provide their own install UI when an installable PWA is detected, which won't appear if it is already installed — see [Making PWAs installable > Installation from the web](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#installation_from_the_web). This can be suppressed using the {{domxref("Window.beforeinstallprompt_event", "beforeinstallprompt")}} event, which could also be combined with `getInstalledRelatedApps()` to suppress it based on a platform-specific app being available. See [Trigger installation from your PWA](/en-US/docs/Web/Progressive_web_apps/How_to/Trigger_install_prompt#responding_to_platform-specific_apps_being_installed) for further useful information.

> [!NOTE]
> In this example, `doesVersionSendPushMessages()` is a theoretical developer-defined function; it is not provided by the browser.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : The method was not invoked in a top-level browsing context.

