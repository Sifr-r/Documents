# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Improper use of this header can be a security risk.
> For details, see the [Security and privacy concerns](#security_and_privacy_concerns) section.

> [!NOTE]
> We say "a valid address" above because spoofed values may not be actual IP addresses.
> Additionally, we say "not internal/private" because clients may have used proxies on their internal network, which may have added addresses from the [private IP space](https://en.wikipedia.org/wiki/Private_network).

## Security Notes

This header exposes privacy-sensitive information by design, such as the IP address of the client.
Therefore, the user's privacy must be kept in mind when using this header.

If you know that all proxies in the request chain are trusted (i.e., you control them) and are configured correctly, the parts of the header added by your proxies can be trusted.
If any proxy is malicious or misconfigured, any part of the header not added by a trusted proxy may be spoofed or may have an unexpected format or contents.
If the server can be directly connected to from the internet — even if it is also behind a trusted reverse proxy — **no part** of the `X-Forwarded-For` IP list can be considered trustworthy or safe for security-related uses.

Any security-related use of `X-Forwarded-For` (such as for rate limiting or IP-based access control) _must only_ use IP addresses added by a trusted proxy.
Using untrustworthy values can result in rate-limiter avoidance, access-control bypass, memory exhaustion, or other negative security or availability consequences.

Leftmost (untrusted) values must only be used for cases where there is no negative impact from using spoofed values.

