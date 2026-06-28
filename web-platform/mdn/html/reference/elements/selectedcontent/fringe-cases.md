# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Since the browser updates `<selectedcontent>` only when the selected `<option>` changes, any dynamic modifications to the content of the selected `<option>` after the `<select>` is rendered won't be cloned to `<selectedcontent>`. You'll need to update `<selectedcontent>` manually. Watch out if you're using any of the popular front-end JavaScript frameworks where `<option>` elements are updated dynamically after the initial render–the result may not match what you expect in `<selectedcontent>`.

> [!NOTE]
> If the `<button>` and/or `<selectedcontent>` elements are not included inside `<select>`, the browser creates an implicit `<button>` to display the contents of the selected `<option>`. This fallback button cannot be targeted with CSS using the `button` or `selectedcontent` type selector.

