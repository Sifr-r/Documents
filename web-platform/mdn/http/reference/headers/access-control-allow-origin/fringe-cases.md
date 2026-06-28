# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > The value `null` should not be used. It may seem safe to return `Access-Control-Allow-Origin: "null"`; however, the origin of resources that use a non-hierarchical scheme (such as `data:` or `file:`) and sandboxed documents is serialized as `null`.
    > Many browsers will grant such documents access to a response with an `Access-Control-Allow-Origin: null` header, and any origin can create a hostile document with a `null` origin.
    > Therefore, the `null` value for the `Access-Control-Allow-Origin` header should be avoided.

