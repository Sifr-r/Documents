# ServerRouter

## Introduction

<!--
⚠️ ⚠️ IMPORTANT ⚠️ ⚠️ 

Thank you for helping improve our documentation!

This file is auto-generated from the JSDoc comments in the source
code, so please edit the JSDoc comments in the file below and this
file will be re-generated once those changes are merged.

https://github.com/remix-run/react-router/blob/main/packages/react-router/lib/dom/ssr/server.tsx
-->

[MODES: framework]

## Signature

```tsx
function ServerRouter({
  context,
  url,
  nonce,
}: ServerRouterProps): ReactElement
```

## Props

### context

The entry context containing the manifest, route modules, and other data
needed for rendering.

### nonce

An optional `nonce` for [Content Security Policy (CSP)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CSP)
compliance, used to allow inline scripts to run safely.

### url

The URL of the request being handled.

