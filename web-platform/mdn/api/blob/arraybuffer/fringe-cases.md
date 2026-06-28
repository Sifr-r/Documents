# Fringe Cases

## Exceptions

While this method doesn't throw exceptions, it may reject the promise. This can happen,
for example, if the reader used to fetch the blob's data throws an exception. Any
exceptions thrown while getting the data will be converted into rejections.

