# Fringe Cases

## Warnings & Notes

> [!NOTE]
> We use the term _cross-origin_ attack in this guide, although many attacks are conventionally called _cross-site_ attacks.
>
> An {{glossary("origin")}} is a more restrictive concept than a {{glossary("site")}}. In particular, a site includes a domain's subdomains, and an origin does not: so `https://example.org` and `https://login.example.org` are the same site, but different origins.
>
> This means that while all cross-site attacks are cross-origin attacks, some cross-origin attacks are _not_ cross-site attacks. For example, if an attacker gains control of a subdomain of a site, then they can attack the site using _cross-origin_, _same-site_ requests. To include these attacks, we use the more restrictive term.

