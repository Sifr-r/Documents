# Fringe Cases

## Warnings & Notes

> [!NOTE]
> To create a scroll marker group container from an existing element that contains a set of {{htmlelement("a")}} elements, use the {{cssxref("scroll-target-group")}} property. Read about the [differences in behavior](/en-US/docs/Web/CSS/Reference/Properties/scroll-target-group#differences_between_scroll-target-group_and_scroll-marker-group) between the two.

> [!NOTE]
> As an accessibility best practice, match the visual rendering position of the scroll marker group container with the tab order. When positioning the marker group at the start of the content with styles applied to {{cssxref("::scroll-marker-group")}}, put it at the beginning of the tab order using `before`. When positioning the group at the end of the content, put it at the end of the tab order using `after`.

