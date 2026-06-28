# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Although {{cssxref("&lt;percentage&gt;")}} values are usable in some of the same properties that accept `<length>` values, they are not themselves `<length>` values. See {{cssxref("&lt;length-percentage&gt;")}}.

> [!NOTE]
> Some properties allow negative `<length>` values, while others do not.

> [!NOTE]
> Child elements do not inherit the relative values as specified for their parent; they inherit the computed values.

> [!NOTE]
> These units, especially `em` and the root relative `rem`, are often used to create scalable layouts, which maintain the vertical rhythm of the page even when the user changes the font size.

    > [!NOTE]
    > While the dynamic viewport size can give you more control and flexibility, using viewport-percentage units based on the dynamic viewport size can cause the content to resize while a user is scrolling a page. This can lead to degradation of the user interface and cause a performance hit.

    > [!NOTE]
    > For example, a browser might implement the default viewport-percentage unit for height (`vh`) that is equivalent to the large viewport-percentage height unit (`lvh`). If so, this could obscure content on a full-page display while the browser interface is expanded. Currently, all default viewport units (`vh`, `vw`, etc.) are equivalent to their large viewport counterparts (`lvh`, `lvw`, etc.).

> [!NOTE]
> Viewport lengths are invalid in {{cssxref("@page")}} declaration blocks.

> [!NOTE]
> Many users increase their {{Glossary("user agent")}}'s default font size to make text more legible. Absolute lengths can cause accessibility problems because they are fixed and do not scale according to user settings. For this reason, prefer relative lengths (such as `em` or `rem`) when setting `font-size`.

