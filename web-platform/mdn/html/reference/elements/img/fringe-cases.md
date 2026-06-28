# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The [Image file type and format guide](/en-US/docs/Web/Media/Guides/Formats/Image_types) provides comprehensive information about image formats and their web browser support.
> This section is just a summary!

    > [!NOTE]
    > Browsers do not always display images. There are a number of situations in which a browser might not display images, such as:
    >
    > - Non-visual browsers (such as those used by people with visual impairments)
    > - The user chooses not to display images (saving bandwidth, privacy reasons)
    > - The image is invalid or an [unsupported type](#supported_image_formats)
    >
    > In these cases, the browser may replace the image with the text in the element's `alt` attribute. For these reasons and others, provide a useful value for `alt` whenever possible.

    > [!NOTE]
    > See the [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) for more details.

    > [!NOTE]
    > Specifying multiple URLs means that multiple attribution sources can be registered on the same feature. You might for example have different campaigns that you are trying to measure the success of, which involve generating different reports on different data.

    > [!NOTE]
    > Including `height` and [`width`](#width) enables the {{glossary("aspect ratio")}} of the image to be calculated by the browser prior to the image being loaded. This aspect ratio is used to reserve the space needed to display the image, reducing or even preventing a layout shift when the image is downloaded and painted to the screen. Reducing layout shift is a major component of good user experience and web performance.

    > [!NOTE]
    > This attribute is allowed only if the `<img>` element is a descendant of an {{htmlelement("a")}} element with a valid [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) attribute. This gives users without pointing devices a fallback destination.

    > [!NOTE]
    > You cannot use this attribute if the `<img>` element is inside an {{htmlelement("a")}} or {{HTMLElement("button")}} element.

    > [!NOTE]
    > This attribute is considered obsolete in the [HTML spec](https://html.spec.whatwg.org/multipage/obsolete.html#element-attrdef-img-longdesc). It has an uncertain future; authors should use a {{glossary("WAI")}}-{{glossary("ARIA")}} alternative such as [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) or [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details).

> [!NOTE]
> To see the resizing in action, {{LiveSampleLink('Using_the_srcset_and_sizes_attributes', 'view the example on a separate page')}}, so you can actually resize the content area.

## Security Notes

Although `<img>` elements have innocent uses, they can have undesirable consequences for user security and privacy. See [Referer header: privacy and security concerns](/en-US/docs/Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns) for more information and mitigations.

