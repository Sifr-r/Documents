# Fringe Cases

## Warnings & Notes

> [!WARNING]
> `ProcessingInstruction` nodes are only supported in XML documents, not in HTML documents. In these, a process instruction will be considered as a comment and be represented as a {{domxref("Comment")}} object in the tree.

> [!NOTE]
> User-defined processing instructions cannot begin with `"xml"`, as `xml`-prefixed processing-instruction target names are reserved by the XML specification for particular, standard uses (see, for example, `<?xml-stylesheet ?>`.

