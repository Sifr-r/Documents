# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Dynamically inserting `<meta name="referrer">` (with {{domxref("Document.write", "document.write()")}} or {{domxref("Node.appendChild", "appendChild()")}}) makes the referrer behavior unpredictable.
> When several conflicting policies are defined, the `no-referrer` policy is applied.

