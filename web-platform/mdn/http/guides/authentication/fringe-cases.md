# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The "Basic" authentication scheme used in the diagram above sends the credentials encoded but not encrypted.
> This would be completely insecure unless the exchange was over a secure connection (HTTPS/TLS).

## Security Notes

As the user ID and password are passed over the network as clear text (it is base64 encoded, but base64 is a reversible encoding), the basic authentication scheme is not secure.
HTTPS/TLS should be used with basic authentication to prevent credential interception.

In addition, sites that use HTTP Basic Auth are particularly vulnerable to [Cross-Site Request Forgery (CSRF)](/en-US/docs/Glossary/CSRF) attacks because the user credentials are sent in all requests regardless of origin (this differs cookie-based credential mechanisms, because cookies are commonly blocked in cross site requests).
Sites should always use the POST requests when changing data, and include [CSRF tokens](/en-US/docs/Web/Security/Attacks/CSRF).

Without these security enhancements, basic authentication should not be used to protect sensitive or valuable information.

