# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Because a change of content encoding requires a change to an ETag, some servers modify ETags when compressing responses from an origin server (reverse proxies, for example).
> Apache Server appends the name of the compression method (`-gzip`) to ETags by default, but this is [configurable using the `DeflateAlterETag` directive](https://httpd.apache.org/docs/2.4/mod/mod_deflate.html).

