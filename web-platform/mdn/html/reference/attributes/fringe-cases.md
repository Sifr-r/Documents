# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The use of event handler content attributes is discouraged. The mix of HTML and JavaScript often produces unmaintainable code, and the execution of event handler attributes may also be blocked by content security policies.

> [!WARNING]
> While not visible by calling the `Function.prototype.toString()` method on the handler, event handler attributes will implicitly wrap code inside of 2 `with` statements, and may produce unexpected results. For example:
>
> ```html
> <div onclick="console.log(new URL(location))">Bad Example</div>
> ```
>
> Essentially becomes:
>
> ```js example-bad
> function onclick(event) {
>   with (this.ownerDocument) {
>     with (this) {
>       console.log(new URL(location)); // 'URL' now resolves to document.URL instead of window.URL
>       // TypeError: URL is not a constructor
>     }
>   }
> }
> ```

