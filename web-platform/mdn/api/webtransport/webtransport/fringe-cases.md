# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > The web application might typically fetch the hashes from a trusted intermediary.
        > For example, you might use a cloud provider to provision VMs that run your WebTransport servers.
        > The provider has trusted access to the server and can request its certificate, generate hashes, and provide these to the application via an API (mediated via PKI) or a cloud console.
        > The web application can now connect directly to the VM-hosted server using the supplied hashes, even though the VM itself does not have a long-lived TLS certificate.

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if `serverCertificateHashes` is specified but the transport protocol does not support this feature.
- `SyntaxError`
  - : Thrown if the specified `url` is invalid, if the scheme is not HTTPS, or if the URL includes a fragment.
- `TypeError`
  - : Thrown if a `serverCertificateHashes` is set for a non-dedicated connection (in other words, if `allowPooling` is `true`).

