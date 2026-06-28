# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Intl.NumberFormat()` can be called with or without [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Both create a new `Intl.NumberFormat` instance. However, there's a special behavior when it's called without `new` and the `this` value is another `Intl.NumberFormat` instance; see [Return value](#return_value).

> [!NOTE]
> The text below describes behavior that is marked by the specification as "optional". It may not work in all environments. Check the [browser compatibility table](#browser_compatibility).

> [!NOTE]
> If both significant and fractional digit limits are specified, then the actual formatting depends on the [`roundingPriority`](#roundingpriority).

> [!WARNING]
> Watch out for default values as they may affect formatting even if not specified in your code.
> The default maximum digit value is `3` for plain values, `2` for currency, and may have different values for other predefined types.

> [!WARNING]
> Watch out for default values as they may affect formatting.
> If only one `SignificantDigits` property is used, then its counterpart will automatically be applied with the default value.
> The default maximum and minimum significant digit values are 21 and 1, respectively.

> [!NOTE]
> The working group have proposed a modification of the algorithm where the formatter should evaluate the result of using the specified fractional and significant digits independently (taking account of both minimum and maximum values).
> It will then select the option that displays more fractional digits if `morePrecision` is set, and fewer if `lessPrecision` is set.
> This will result in more intuitive behavior for this case.

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - A property that takes enumerated values (such as `style`, `units`, `currency`, and so on) is set to an invalid value.
    - Both `maximumFractionDigits` and `minimumFractionDigits` are set, and they are set to different values.
      Note that depending on various formatting options, these properties can have default values.
      It is therefore possible to get this error even if you only set one of the properties.
- {{jsxref("TypeError")}}
  - : Thrown if the `options.style` property is set to "unit" or "currency", and no value has been set for the corresponding property `options.unit` or `options.currency`.

