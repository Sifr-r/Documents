# Server React DOM APIs

## Introduction

The `react-dom/server` APIs let you server-side render React components to HTML. These APIs are only used on the server at the top level of your app to generate the initial HTML. A [framework](/learn/creating-a-react-app#full-stack-frameworks) may call them for you. Most of your components don't need to import or use them.

---

## Legacy Server APIs for non-streaming environments {//}

These methods can be used in the environments that don't support streams:

* [`renderToString`](/reference/react-dom/server/renderToString) renders a React tree to a string.
* [`renderToStaticMarkup`](/reference/react-dom/server/renderToStaticMarkup) renders a non-interactive React tree to a string.

They have limited functionality compared to the streaming APIs.

