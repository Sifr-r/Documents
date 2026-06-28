# Fringe Cases

## Warnings & Notes

> [!WARNING]
> You may see people using `~~` to truncate numbers to integers. Bitwise NOTing any number `x` twice returns `x` converted to a 32-bit integer, which additionally removes leading bits for numbers outside the range -2147483648 to 2147483647. Use [`Math.trunc()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc#using_bitwise_no-ops_to_truncate_numbers) instead.

