
## Introduction

TanStack Query comes with its own ESLint plugin. This plugin is used to enforce best practices and to help you avoid common mistakes.



## Installation

The plugin is a separate package that you need to install:

```bash
npm i -D @tanstack/eslint-plugin-query
```

or

```bash
pnpm add -D @tanstack/eslint-plugin-query
```

or

```bash
yarn add -D @tanstack/eslint-plugin-query
```

or

```bash
bun add -D @tanstack/eslint-plugin-query
```


### Recommended setup

To enable all of the recommended rules for our plugin, add the following config:

```js
import pluginQuery from '@tanstack/eslint-plugin-query'

export default [
  ...pluginQuery.configs['flat/recommended'],
  // Any other config...
]
```

### Recommended strict setup

The `flat/recommended-strict` config extends `flat/recommended` with additional opinionated rules that enforce best practices more aggressively.

```js
import pluginQuery from '@tanstack/eslint-plugin-query'

export default [
  ...pluginQuery.configs['flat/recommended-strict'],
  // Any other config...
]
```

### Custom setup

Alternatively, you can load the plugin and configure only the rules you want to use:

```js
import pluginQuery from '@tanstack/eslint-plugin-query'

export default [
  {
    plugins: {
      '@tanstack/query': pluginQuery,
    },
    rules: {
      '@tanstack/query/exhaustive-deps': 'error',
    },
  },
  // Any other config...
]
```


### Recommended setup

To enable all of the recommended rules for our plugin, add `plugin:@tanstack/query/recommended` in extends:

```json
{
  "extends": ["plugin:@tanstack/query/recommended"]
}
```

### Recommended strict setup

The `recommendedStrict` config extends `recommended` with additional opinionated rules:

```json
{
  "extends": ["plugin:@tanstack/query/recommendedStrict"]
}
```

### Custom setup

Alternatively, add `@tanstack/query` to the plugins section, and configure the rules you want to use:

```json
{
  "plugins": ["@tanstack/query"],
  "rules": {
    "@tanstack/query/exhaustive-deps": "error"
  }
}
```

