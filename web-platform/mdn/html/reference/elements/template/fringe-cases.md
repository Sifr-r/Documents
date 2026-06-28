# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > The HTML parser creates a {{domxref("ShadowRoot")}} object in the DOM for the first `<template>` in a node with this attribute set to an allowed value.
    > If the attribute is not set, or not set to an allowed value — or if a `ShadowRoot` has already been declaratively created in the same parent — then an {{domxref("HTMLTemplateElement")}} is constructed.
    > A {{domxref("HTMLTemplateElement")}} cannot subsequently be changed into a shadow root after parsing, for example, by setting {{domxref("HTMLTemplateElement.shadowRootMode")}}.

    > [!NOTE]
    > You may find the non-standard `shadowroot` attribute in older tutorials and examples that used to be supported in Chrome 90-110. This attribute has since been removed and replaced by the standard `shadowrootmode` attribute.

> [!NOTE]
> If the `shadowrootslotassignment` attribute is not supported, a warning note is displayed and the browser will use `named` assignment.
> However, because none of the slots or elements to be inserted are named, all the elements will be inserted into the title slot (because this is the first unnamed slot, and hence is the "default" slot).

