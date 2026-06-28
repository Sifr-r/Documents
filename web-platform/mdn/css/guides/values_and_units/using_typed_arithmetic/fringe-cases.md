# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Originally, the [CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units) module limited the arguments multiplication and division operations could take to make dividing by zero detectable at parse time and avoid issues such as squared units. Typed arithmetic relaxes some of those restrictions in [supporting browsers](/en-US/docs/Web/CSS/Reference/Values/calc#browser_compatibility).

> [!NOTE]
> Any alpha value greater than `1` is treated as `1`, therefore we don't need to clamp the maximum value.

   > [!NOTE]
   > This last step is not strictly necessary, as `lch()` also accepts unitless hue values. However, a degree value may be more intuitive, and we wanted to show another example of how the unitless value can be converted into a different data type.

