# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can find out more about the available headers by reading our [HTTP headers](/en-US/docs/Web/HTTP/Reference/Headers) reference.

> [!NOTE]
> To be clear, the difference between {{domxref("Headers.set()")}} and {{domxref("Headers.append()")}} is that if the specified header does already exist and does accept multiple values, {{domxref("Headers.set()")}} will overwrite the existing value with the new one, whereas {{domxref("Headers.append()")}} will append the new value onto the end of the set of values. See their dedicated pages for example code.

> [!NOTE]
> When Header values are iterated over, they are automatically sorted in lexicographical order, and values from duplicate header names are combined.

