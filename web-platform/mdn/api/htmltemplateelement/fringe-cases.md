# Fringe Cases

## Warnings & Notes

> [!NOTE]
> An HTML parser can create either an `HTMLTemplateElement` or a {{domxref("ShadowRoot")}} when it parses a {{HTMLElement("template")}} element, depending on the `<template>` attributes.
> If an `HTMLTemplateElement` is created the "shadow" attributes are reflected from the template.
> However these are not useful, because an `HTMLTemplateElement` is not a shadow root and cannot subsequently be changed to a shadow root.

