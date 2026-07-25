
## Environment-specific configuration

To add configuration options, such as `{ edge: true }` in [`adapter-vercel`](adapter-vercel) and [`adapter-netlify`](adapter-netlify), you must install the underlying adapter — `adapter-auto` does not take any options.



## Adding community adapters

You can add zero-config support for additional adapters by editing [adapters.js](https://github.com/sveltejs/kit/blob/main/packages/adapter-auto/adapters.js) and opening a pull request.

