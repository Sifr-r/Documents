# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Use {{domxref("Navigator.pdfViewerEnabled")}} to determine if inline viewing of PDF files is supported. Do not infer it from this property.
>
> The "five standard plugins" are those that developers have most commonly used to feature detect inline PDF viewing.
> Returning these ensures that legacy code can more reliably determine whether inline viewing is supported.
> However this approach is not recommended for new code because this property may eventually be removed.

