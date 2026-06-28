# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Partitioned cookies must be set with `Secure`. In addition, you can use the `__Host` prefix when setting partitioned cookies to bind them only to the current domain or subdomain, and this is recommended if you don't need to share cookies between subdomains.

> [!NOTE]
> CHIPS is similar to the [state partitioning mechanism](/en-US/docs/Web/Privacy/Guides/State_Partitioning) implemented by Firefox. However, state partitioning partitions cookie storage by default for third-party contexts, whereas CHIPS allows opt-in to partitioned cookies for both first-party and third-party contexts. It is recommended to use the opt-in mechanism of CHIPS rather than state partitioning to provide the most compatible partitioned cookies.

