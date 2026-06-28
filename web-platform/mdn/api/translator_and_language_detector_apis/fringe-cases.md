# Fringe Cases

## Security Notes

Creation of `LanguageDetector` and `Translator` objects requires that the user has recently interacted with the page ([transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required).

Access to the API is also controlled via {{httpheader("Permissions-Policy/language-detector", "language-detector")}} and {{httpheader("Permissions-Policy/translator", "translator")}} {{httpheader("Permissions-Policy")}} directives.

