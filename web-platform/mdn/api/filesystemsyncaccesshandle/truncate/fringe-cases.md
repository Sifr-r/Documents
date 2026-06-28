# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In earlier versions of the spec, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}}, and `truncate()` were wrongly specified as asynchronous methods, and older versions of some browsers implement them in this way. However, all current browsers that support these methods implement them as synchronous methods.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the associated access handle is already closed, or if the modification of the file's binary data otherwise fails.
- {{domxref("QuotaExceededError")}}
  - : Thrown if the `newSize` is larger than the original size of the file, and exceeds the browser's [storage quota](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria).
- {{jsxref("TypeError")}}
  - : Thrown if the underlying file system does not support setting the file size to the new size.

