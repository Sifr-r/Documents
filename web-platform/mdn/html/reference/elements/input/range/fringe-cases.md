# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The following input attributes do not apply to the input range: `accept`, `alt`, `checked`, `dirname`, `formaction`, `formenctype`, `formmethod`, `formnovalidate`, `formtarget`, `height`, `maxlength`, `minlength`, `multiple`, `pattern`, `placeholder`, `readonly`, `required`, `size`, and `src`. Any of these attributes, if included, will be ignored.

> [!NOTE]
> If the `min` and `max` values are equal or the `max` value is lower than the `min` value the user will not be able to interact with the range.

> [!NOTE]
> When the value entered by a user doesn't adhere to the stepping configuration, the {{Glossary("user agent")}} may round off the value to the nearest valid value, preferring to round numbers up when there are two equally close options.

> [!NOTE]
> If you also want to [show the labels](#adding_labels) as in the example below then you would need a `datalist` for each range input.

