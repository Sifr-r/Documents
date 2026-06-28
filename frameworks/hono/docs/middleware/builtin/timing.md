# timing

## Import

```ts [npm]
import { Hono } from 'hono'
import {
  timing,
  setMetric,
  startTime,
  endTime,
  wrapTime,
} from 'hono/timing'
import type { TimingVariables } from 'hono/timing'
```

## Usage

```js
// Specify the variable types to infer the `c.get('metric')`:
type Variables = TimingVariables

const app = new Hono<{ Variables: Variables }>()

// add the middleware to your router
app.use(timing());

app.get('/', async (c) => {

  // add custom metrics
  setMetric(c, 'region', 'europe-west3')

  // add custom metrics with timing, must be in milliseconds
  setMetric(c, 'custom', 23.8, 'My custom Metric')

  // start a new timer
  startTime(c, 'db');
  const data = await db.findMany(...);

  // end the timer
  endTime(c, 'db');

  // ...or you can also just wrap a Promise using this function:
  const data = await wrapTime(c, 'db', db.findMany(...));

  return c.json({ response: data });
});
```

### Conditionally enabled

```ts
const app = new Hono()

app.use(
  '*',
  timing({
    // c: Context of the request
    enabled: (c) => c.req.method === 'POST',
  })
)
```

## Options

### <Badge type="info" text="optional" /> total: `boolean`

Show the total response time. The default is `true`.

### <Badge type="info" text="optional" /> enabled: `boolean` | `(c: Context) => boolean`

Whether timings should be added to the headers or not. The default is `true`.

### <Badge type="info" text="optional" /> totalDescription: `boolean`

Description for the total response time. The default is `Total Response Time`.

### <Badge type="info" text="optional" /> autoEnd: `boolean`

If `startTime()` should end automatically at the end of the request.
If disabled, not manually ended timers will not be shown.

### <Badge type="info" text="optional" /> crossOrigin: `boolean` | `string` | `(c: Context) => boolean | string`

The origin this timings header should be readable.

- If false, only from current origin.
- If true, from all origin.
- If string, from this domain(s). Multiple domains must be separated with a comma.

The default is `false`. See more [docs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Timing-Allow-Origin).

