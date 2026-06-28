# Scripts

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.Scripts.html)

Renders the client runtime of your app. It should be rendered inside the
[`<body>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/body)
 of the document.

If server rendering, you can omit `` and the app will work as a
traditional web app without JavaScript, relying solely on HTML and browser
behaviors.

```tsx
import { Scripts } from "react-router";

export default function Root() {
  return (
    <html>
      <head />
      <body>
        
      </body>
    </html>
  );
}
```

## Signature

```tsx
function Scripts(scriptProps: ScriptsProps): React.JSX.Element | null
```

