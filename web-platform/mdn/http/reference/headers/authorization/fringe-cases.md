# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This header is part of the [General HTTP authentication framework](/en-US/docs/Web/HTTP/Guides/Authentication#the_general_http_authentication_framework).
> It can be used with a number of [authentication schemes](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes).

    > [!NOTE]
    > For more information/options see [HTTP Authentication > Authentication schemes](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes)

    > [!NOTE]
    > For information about the encoding algorithm, see the examples: below, in {{HTTPHeader("WWW-Authenticate")}}, in [HTTP Authentication](/en-US/docs/Web/HTTP/Guides/Authentication), and in the relevant specifications.

> [!WARNING]
> {{Glossary("Base64")}}-encoding can easily be reversed to obtain the original name and password, so `Basic` authentication offers no cryptographic security.
> {{Glossary("HTTPS")}} is always recommended when using authentication, but is even more so when using `Basic` authentication.

