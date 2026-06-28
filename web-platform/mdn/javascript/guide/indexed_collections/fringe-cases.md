# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In the above code, `arrayLength` must be a `Number`. Otherwise, an array with a single element (the provided value) will be created. Calling `arr.length` will return `arrayLength`, but the array doesn't contain any elements. A {{jsxref("Statements/for...in", "for...in")}} loop will not find any property on the array.

> [!NOTE]
> You can also use [property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) to access other properties of the array, like with an object.
>
> ```js
> const arr = ["one", "two", "three"];
> arr[2]; // three
> arr["length"]; // 3
> ```

> [!NOTE]
> If you supply a non-integer value to the array operator in the code above, a property will be created in the object representing the array, instead of an array element.
>
> ```js
> const arr = [];
> arr[3.4] = "Oranges";
> console.log(arr.length); // 0
> console.log(Object.hasOwn(arr, 3.4)); // true
> ```

> [!NOTE]
> The `sort()` method introduced above is not an iterative method, because its callback function is only used for comparison and may not be called in any particular order based on element order. `sort()` does not accept the `thisArg` parameter either.

