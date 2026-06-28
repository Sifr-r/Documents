# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You cannot directly manipulate the contents of an `ArrayBuffer`. Instead, you create a typed array object like an {{jsxref("Int8Array")}} or a {{jsxref("DataView")}} object, which represents the buffer in a specific format, and use that to read and write the contents of the buffer.

> [!NOTE]
> In earlier versions of the spec, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}}, and {{domxref("FileSystemSyncAccessHandle.truncate()", "truncate()")}} were wrongly specified as asynchronous methods, and older versions of some browsers implement them in this way. However, all current browsers that support these methods implement them as synchronous methods.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the associated access handle is already closed, or if the modification of the file's binary data completely fails.
- {{domxref("QuotaExceededError")}}
  - : Thrown if the increased data capacity exceeds the browser's [storage quota](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria).
- {{jsxref("TypeError")}}
  - : Thrown if the underlying file system does not support writing the file from the specified file offset.

