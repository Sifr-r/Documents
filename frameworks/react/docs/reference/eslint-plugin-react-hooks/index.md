# eslint-plugin-react-hooks

## Introduction

`eslint-plugin-react-hooks` provides ESLint rules to enforce the [Rules of React](/reference/rules).

This plugin helps you catch violations of React's rules at build time, ensuring your components and hooks follow React's rules for correctness and performance. The lints cover both fundamental React patterns (exhaustive-deps and rules-of-hooks) and issues flagged by React Compiler. React Compiler diagnostics are automatically surfaced by this ESLint plugin, and can be used even if your app hasn't adopted the compiler yet.

When the compiler reports a diagnostic, it means that the compiler was able to statically detect a pattern that is not supported or breaks the Rules of React. When it detects this, it **automatically** skips over those components and hooks, while keeping the rest of your app compiled. This ensures optimal coverage of safe optimizations that won't break your app.

What this means for linting, is that you don’t need to fix all violations immediately. Address them at your own pace to gradually increase the number of optimized components.

