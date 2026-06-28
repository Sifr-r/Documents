# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The new features discussed in this article — [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset)/[`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes)/{{htmlelement("picture")}} — are all supported in modern desktop and mobile browsers.

> [!NOTE]
> In `sizes`, you can use any [length value](/en-US/docs/Web/CSS/Reference/Values/length). For example, rather than providing an absolute width (for example, `480px`), you can alternatively provide a width relative to the viewport (for example, `50vw`). However, you cannot use a percentage as the slot width. You may have noticed that the last slot width has no media condition (this is the default that is chosen when none of the media conditions are true). The browser ignores everything after the first matching condition, so be careful how you order the media conditions.

> [!NOTE]
> When testing this with a desktop browser, if the browser fails to load the narrower images when you've got its window set to the narrowest width, have a look at what the viewport is (you can approximate it by going into the browser's JavaScript console and typing in `document.querySelector('html').clientWidth`). Different browsers have minimum sizes that they'll let you reduce the window width to, and they might be wider than you'd think. When testing it with a mobile browser, you can use tools like Firefox's `about:debugging` page to inspect the page loaded on the mobile using the desktop developer tools.
>
> To see which images were loaded, you can use Firefox DevTools's [Network Monitor](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html) tab or Chrome DevTools's [Network](https://developer.chrome.com/docs/devtools/network/) panel. For Chrome, you may also want to [disable cache](https://stackoverflow.com/a/7000899/13725861) to prevent it from picking already downloaded images.

> [!NOTE]
> In the {{htmlelement("head")}} of the example linked above, you'll find the line `<meta name="viewport" content="width=device-width">`: this forces mobile browsers to adopt their real viewport width for loading web pages (some mobile browsers lie about their viewport width, and instead load pages at a larger viewport width then shrink the loaded page down, which is not very helpful for responsive images or design).

> [!NOTE]
> You should use the `media` attribute only in art direction scenarios; when you do use `media`, don't also offer media conditions within the `sizes` attribute.

