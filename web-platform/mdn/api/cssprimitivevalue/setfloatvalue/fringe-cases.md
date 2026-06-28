# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This method was part of an attempt to create a typed CSS Object Model. This attempt has been abandoned, and most browsers do
> not implement it.
>
> To achieve your purpose, you can use:
>
> - the untyped [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model), widely supported, or
> - the modern [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API), less supported and considered experimental.

## Exceptions

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col"><strong>Type</strong></th>
      <th scope="col"><strong>Description</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>DOMException</code></td>
      <td>
        An <code>INVALID_ACCESS_ERR</code> is raised if the CSS value doesn't
        contain a float value or if the string value can't be converted into the
        specified unit.<br />A NO_MODIFICATION_ALLOWED_ERR is raised if this
        property is read-only.
      </td>
    </tr>
  </tbody>
</table>

