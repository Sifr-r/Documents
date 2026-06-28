# Fringe Cases

## Warnings & Notes

> [!NOTE]
> While the `AudioParam` named `offset` is read-only, the
> `value` property within is not. So you can change the value of
> `offset` by setting the value of
> `ConstantSourceNode.offset.value`:
>
> ```js
> myConstantSourceNode.offset.value = newValue;
> ```

