# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The different exceptions that can be thrown when using the features of this API are listed on relevant pages as defined in the spec. However, the situation is made more complex by the interaction of the API and the underlying operating system. A proposal has been made to [list the error mappings in the spec](https://github.com/whatwg/fs/issues/57), which includes useful related information.

> [!NOTE]
> Objects based on {{domxref("FileSystemHandle")}} can also be serialized into an {{domxref("IndexedDB API", "IndexedDB", "", "nocode")}} database instance, or transferred via {{domxref("window.postMessage", "postMessage()")}}.

> [!NOTE]
> In earlier versions of the spec, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}}, and {{domxref("FileSystemSyncAccessHandle.truncate()", "truncate()")}} were unergonomically specified as asynchronous methods. This has now been [amended](https://github.com/whatwg/fs/issues/7), but some browsers still support the asynchronous versions.

