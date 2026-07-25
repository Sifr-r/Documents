# NextAuth.js (Auth.js)

Complete open-source authentication solution for Next.js and Auth.js applications.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Core concepts, API reference, and key usage patterns |
| Documentation | [docs/](docs/) | Full documentation set indexed from upstream package |

## Quick Reference

### Next.js App Router Auth Setup (`auth.ts`)
```typescript
import NextAuth from "next-auth";
import GitHub from "next-auth/providers/github";

export const { handlers, auth, signIn, signOut } = NextAuth({
  providers: [GitHub],
});
```

## See Also

- [NextAuth.js (Auth.js) Official Documentation](https://neuledge.com)
