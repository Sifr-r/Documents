# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The set-like protocol invokes the `keys()` method instead of [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.iterator) to produce elements. This is to make maps valid set-like objects, because for maps, the iterator produces _entries_ but the `has()` method takes _keys_.

