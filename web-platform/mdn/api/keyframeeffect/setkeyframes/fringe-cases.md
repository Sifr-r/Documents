# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the keyframes cannot be processed or are malformed, the `KeyframeEffect`'s keyframes are not modified.

## Exceptions

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Exception</th>
      <th scope="col">Explanation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>TypeError</code></td>
      <td>
        One or more of the frames were not of the correct type of object, the
        keyframes were not
        <a href="https://w3c.github.io/web-animations/#loosely-sorted-by-offset"
          >loosely sorted by offset</a
        >, or a keyframe existed with an offset of less than 0 or more than 1.
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]

