# updateAppConfig

## Introduction

::note
Updates the [`app.config`](/docs/3.x/directory-structure/app-config) using deep assignment. Existing (nested) properties will be preserved.
::

## Usage

```js
import { updateAppConfig, useAppConfig } from '#imports'

const appConfig = useAppConfig() // { foo: 'bar' }

const newAppConfig = { foo: 'baz' }
updateAppConfig(newAppConfig)

console.log(appConfig) // { foo: 'baz' }
```

:read-more{to="/docs/3.x/directory-structure/app-config"}

