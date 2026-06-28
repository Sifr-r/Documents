# Fringe Cases

## Warnings & Notes

> [!NOTE]
> IANA maintains [a list of official content encodings](https://www.iana.org/assignments/http-parameters/http-parameters.xhtml#content-coding).
> The `bzip` and `bzip2` encodings are non-standard but may be used in some cases, particularly for legacy support.

> [!NOTE]
> The `Accept-Post` header specifies a media range in the same way as {{HTTPHeader("Accept")}}, except that it has no notion of preference via `q` ({{Glossary("quality values")}}) arguments.
> This is because `Accept-Post` is a response header while `Accept` is a request header.

