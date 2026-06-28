# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The blob's {{domxref("FileReader.result","result")}} cannot be
> directly decoded as Base64 without first removing the Data-URL declaration preceding
> the Base64-encoded data. To retrieve only the Base64 encoded string, first
> remove `data:*/*;base64,` from the result.

