# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When a site enables the `Expect-CT` header, they are requesting that the browser check that any certificate for that site appears in **[public CT logs](https://github.com/google/certificate-transparency-community-site/blob/master/docs/google/known-logs.md)**.

> [!NOTE]
> Browsers **ignore** the `Expect-CT` header over HTTP; the header only has effect on HTTPS connections.

> [!NOTE]
> The `Expect-CT` is mostly obsolete since June 2021.
> Since May 2018, all new TLS certificates are expected to support SCTs by default.
> Certificates issued before March 2018 were allowed to have a lifetime of 39 months, so they had expired in June 2021.
> Chromium plans to deprecate `Expect-CT` header and to eventually remove it.

