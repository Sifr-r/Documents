# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Private fields and methods are new features in classes with no trivial equivalent in function constructors.

> [!NOTE]
> Code run in the Chrome console can access private elements outside the class. This is a DevTools-only relaxation of the JavaScript syntax restriction.

> [!NOTE]
> Keep in mind that the `#` is a special identifier syntax, and you can't use the field name as if it's a string. `"#values" in anotherColor` would look for a property name literally called `"#values"`, instead of a private field.

> [!NOTE]
> Prefixing utility methods with what they deal with is called "namespacing" and is considered a good practice. For example, in addition to the older, unprefixed [`parseInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseInt) method, JavaScript also later added the prefixed [`Number.parseInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/parseInt) method to indicate that it's for dealing with numbers.

