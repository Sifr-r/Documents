# Fringe Cases

## Warnings & Notes

> [!NOTE]
> To be exact, communication is allowed between browsing contexts using the same [storage partition](/en-US/docs/Web/Privacy/Guides/State_Partitioning). Storage is first partitioned according to top-level sites—so for example, if you have one opened page at `a.com` that embeds an iframe from `b.com`, and another page opened to `b.com`, then the iframe cannot communicate with the second page despite them being technically same-origin. However, if the first page is also on `b.com`, then the iframe can communicate with the second page.

