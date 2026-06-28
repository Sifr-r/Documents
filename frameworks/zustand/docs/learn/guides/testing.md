# Testing

## Setting Up Zustand for testing

> **Note**: Since Jest and Vitest have slight differences, like Vitest using **ES modules** and Jest using
> **CommonJS modules**, you need to keep that in mind if you are using Vitest instead of Jest.

The mock provided below will enable the relevant test runner to reset the zustand stores after each test.

### Shared code just for testing purposes

This shared code was added to avoid code duplication in our demo since we use the same counter store
creator for both implementations, with and without `Context` API — `createStore` and `create`, respectively.

```ts
// shared/counter-store-creator.ts
import { type StateCreator } from 'zustand'

export type CounterStore = {
  count: number
  inc: () => void
}

export const counterStoreCreator: StateCreator = (set) => ({
  count: 1,
  inc: () => set((state) => ({ count: state.count + 1 })),
})
```

### Jest

In the next steps we are going to setup our Jest environment in order to mock Zustand.

```ts
// __mocks__/zustand.ts
import { act } from '@testing-library/react'
import type * as ZustandExportedTypes from 'zustand'
export * from 'zustand'

const { create: actualCreate, createStore: actualCreateStore } =
  jest.requireActual<typeof ZustandExportedTypes>('zustand')

// a variable to hold reset functions for all stores declared in the app
export const storeResetFns = new Set<() => void>()

const createUncurried = (
  stateCreator: ZustandExportedTypes.StateCreator,
) => {
  const store = actualCreate(stateCreator)
  const initialState = store.getInitialState()
  storeResetFns.add(() => {
    store.setState(initialState, true)
  })
  return store
}

// when creating a store, we get its initial state, create a reset function and add it in the set
export const create = ((
  stateCreator: ZustandExportedTypes.StateCreator,
) => {
  console.log('zustand create mock')

  // to support curried version of create
  return typeof stateCreator === 'function'
    ? createUncurried(stateCreator)
    : createUncurried
}) as typeof ZustandExportedTypes.create

const createStoreUncurried = (
  stateCreator: ZustandExportedTypes.StateCreator,
) => {
  const store = actualCreateStore(stateCreator)
  const initialState = store.getInitialState()
  storeResetFns.add(() => {
    store.setState(initialState, true)
  })
  return store
}

// when creating a store, we get its initial state, create a reset function and add it in the set
export const createStore = ((
  stateCreator: ZustandExportedTypes.StateCreator,
) => {
  console.log('zustand createStore mock')

  // to support curried version of createStore
  return typeof stateCreator === 'function'
    ? createStoreUncurried(stateCreator)
    : createStoreUncurried
}) as typeof ZustandExportedTypes.createStore

// reset all stores after each test run
afterEach(() => {
  act(() => {
    storeResetFns.forEach((resetFn) => {
      resetFn()
    })
  })
})
```

```ts
// setup-jest.ts
import '@testing-library/jest-dom'
```

```ts
// jest.config.ts
import type { JestConfigWithTsJest } from 'ts-jest'

const config: JestConfigWithTsJest = {
  preset: 'ts-jest',
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['./setup-jest.ts'],
}

export default config
```

## Setting Up Zustand for testing (part 2)

> **Note**: to use TypeScript we need to install two packages `ts-jest` and `ts-node`.

### Vitest

In the next steps we are going to setup our Vitest environment in order to mock Zustand.

> **Warning:** In Vitest you can change the [root](https://vitest.dev/config/#root).
> Due to that, you need make sure that you are creating your `__mocks__` directory in the right place.
> Let's say that you change the **root** to `./src`, that means you need to create a `__mocks__`
> directory under `./src`. The end result would be `./src/__mocks__`, rather than `./__mocks__`.
> Creating `__mocks__` directory in the wrong place can lead to issues when using Vitest.

```ts
// __mocks__/zustand.ts
import { act } from '@testing-library/react'
import type * as ZustandExportedTypes from 'zustand'
export * from 'zustand'

const { create: actualCreate, createStore: actualCreateStore } =
  await vi.importActual<typeof ZustandExportedTypes>('zustand')

// a variable to hold reset functions for all stores declared in the app
export const storeResetFns = new Set<() => void>()

const createUncurried = (
  stateCreator: ZustandExportedTypes.StateCreator,
) => {
  const store = actualCreate(stateCreator)
  const initialState = store.getInitialState()
  storeResetFns.add(() => {
    store.setState(initialState, true)
  })
  return store
}

// when creating a store, we get its initial state, create a reset function and add it in the set
export const create = ((
  stateCreator: ZustandExportedTypes.StateCreator,
) => {
  console.log('zustand create mock')

  // to support curried version of create
  return typeof stateCreator === 'function'
    ? createUncurried(stateCreator)
    : createUncurried
}) as typeof ZustandExportedTypes.create

const createStoreUncurried = (
  stateCreator: ZustandExportedTypes.StateCreator,
) => {
  const store = actualCreateStore(stateCreator)
  const initialState = store.getInitialState()
  storeResetFns.add(() => {
    store.setState(initialState, true)
  })
  return store
}

// when creating a store, we get its initial state, create a reset function and add it in the set
export const createStore = ((
  stateCreator: ZustandExportedTypes.StateCreator,
) => {
  console.log('zustand createStore mock')

  // to support curried version of createStore
  return typeof stateCreator === 'function'
    ? createStoreUncurried(stateCreator)
    : createStoreUncurried
}) as typeof ZustandExportedTypes.createStore

// reset all stores after each test run
afterEach(() => {
  act(() => {
    storeResetFns.forEach((resetFn) => {
      resetFn()
    })
  })
})
```

> **Note**: without [globals configuration](https://vitest.dev/config/#globals) enabled, we need
> to add `import { afterEach, vi } from 'vitest'` at the top.

```ts
// global.d.ts
/// <reference types="vite/client" />
/// <reference types="vitest/globals" />
```

> **Note**: without [globals configuration](https://vitest.dev/config/#globals) enabled, we do
> need to remove `/// <reference types="vitest/globals" />`.

```ts
// setup-vitest.ts
import '@testing-library/jest-dom/vitest'

vi.mock('zustand') // to make it work like Jest (auto-mocking)
```

## Setting Up Zustand for testing (part 3)

> **Note**: without [globals configuration](https://vitest.dev/config/#globals) enabled, we need
> to add `import { vi } from 'vitest'` at the top.

```ts
// vitest.config.ts
import { defineConfig, mergeConfig } from 'vitest/config'
import viteConfig from './vite.config'

export default defineConfig((configEnv) =>
  mergeConfig(
    viteConfig(configEnv),
    defineConfig({
      test: {
        globals: true,
        environment: 'jsdom',
        setupFiles: ['./setup-vitest.ts'],
      },
    }),
  ),
)
```

### Testing Components

In the next examples we are going to use `useCounterStore`

> **Note**: all of these examples are written using TypeScript.

```ts
// shared/counter-store-creator.ts
import { type StateCreator } from 'zustand'

export type CounterStore = {
  count: number
  inc: () => void
}

export const counterStoreCreator: StateCreator = (set) => ({
  count: 1,
  inc: () => set((state) => ({ count: state.count + 1 })),
})
```

```ts
// stores/use-counter-store.ts
import { create } from 'zustand'

import {
  type CounterStore,
  counterStoreCreator,
} from '../shared/counter-store-creator'

export const useCounterStore = create()(counterStoreCreator)
```

```tsx
// contexts/use-counter-store-context.tsx
import { type ReactNode, createContext, useContext, useState } from 'react'
import { createStore } from 'zustand'
import { useStoreWithEqualityFn } from 'zustand/traditional'
import { shallow } from 'zustand/shallow'

import {
  type CounterStore,
  counterStoreCreator,
} from '../shared/counter-store-creator'

export const createCounterStore = () => {
  return createStore(counterStoreCreator)
}

export type CounterStoreApi = ReturnType<typeof createCounterStore>

export const CounterStoreContext = createContext<CounterStoreApi | undefined>(
  undefined,
)

export interface CounterStoreProviderProps {
  children: ReactNode
}

export const CounterStoreProvider = ({
  children,
}: CounterStoreProviderProps) => {
  const [store] = useState(() => createCounterStore())
  return (
    <CounterStoreContext.Provider value={store}>
      {children}
    </CounterStoreContext.Provider>
  )
}

export type UseCounterStoreContextSelector = (store: CounterStore) => T

export const useCounterStoreContext = <T,>(
  selector: UseCounterStoreContextSelector,
): T => {
  const counterStoreContext = useContext(CounterStoreContext)

  if (counterStoreContext === undefined) {
    throw new Error(
      'useCounterStoreContext must be used within CounterStoreProvider',
    )
  }

  return useStoreWithEqualityFn(counterStoreContext, selector, shallow)
}
```

```tsx
// components/counter/counter.tsx
import { useCounterStore } from '../../stores/use-counter-store'

export function Counter() {
  const { count, inc } = useCounterStore()

  return (
    <div>
      <h2>Counter Store</h2>
      <h4>{count}</h4>
      <button onClick={inc}>One Up</button>
    </div>
  )
}
```

```ts
// components/counter/index.ts
export * from './counter'
```

```tsx
// components/counter/counter.test.tsx
import { act, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'

import { Counter } from './counter'

## Setting Up Zustand for testing (part 4)

describe('Counter', () => {
  test('should render with initial state of 1', async () => {
    renderCounter()

    expect(await screen.findByText(/^1$/)).toBeInTheDocument()
    expect(
      await screen.findByRole('button', { name: /one up/i }),
    ).toBeInTheDocument()
  })

  test('should increase count by clicking a button', async () => {
    const user = userEvent.setup()

    renderCounter()

    expect(await screen.findByText(/^1$/)).toBeInTheDocument()

    await user.click(await screen.findByRole('button', { name: /one up/i }))

    expect(await screen.findByText(/^2$/)).toBeInTheDocument()
  })
})

const renderCounter = () => {
  return render()
}
```

```tsx
// components/counter-with-context/counter-with-context.tsx
import {
  CounterStoreProvider,
  useCounterStoreContext,
} from '../../contexts/use-counter-store-context'

const Counter = () => {
  const { count, inc } = useCounterStoreContext((state) => state)

  return (
    <div>
      <h2>Counter Store Context</h2>
      <h4>{count}</h4>
      <button onClick={inc}>One Up</button>
    </div>
  )
}

export const CounterWithContext = () => {
  return (
    
      
    
  )
}
```

```tsx
// components/counter-with-context/index.ts
export * from './counter-with-context'
```

```tsx
// components/counter-with-context/counter-with-context.test.tsx
import { act, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'

import { CounterWithContext } from './counter-with-context'

describe('CounterWithContext', () => {
  test('should render with initial state of 1', async () => {
    renderCounterWithContext()

    expect(await screen.findByText(/^1$/)).toBeInTheDocument()
    expect(
      await screen.findByRole('button', { name: /one up/i }),
    ).toBeInTheDocument()
  })

  test('should increase count by clicking a button', async () => {
    const user = userEvent.setup()

    renderCounterWithContext()

    expect(await screen.findByText(/^1$/)).toBeInTheDocument()

    await user.click(await screen.findByRole('button', { name: /one up/i }))

    expect(await screen.findByText(/^2$/)).toBeInTheDocument()
  })
})

const renderCounterWithContext = () => {
  return render()
}
```

> **Note**: without [globals configuration](https://vitest.dev/config/#globals) enabled, we need
> to add `import { describe, test, expect } from 'vitest'` at the top of each test file.

### Testing Stores

In the next examples we are going to use `useCounterStore`

> **Note**: all of these examples are written using TypeScript.

```ts
// shared/counter-store-creator.ts
import { type StateCreator } from 'zustand'

export type CounterStore = {
  count: number
  inc: () => void
}

export const counterStoreCreator: StateCreator = (set) => ({
  count: 1,
  inc: () => set((state) => ({ count: state.count + 1 })),
})
```

```ts
// stores/use-counter-store.ts
import { create } from 'zustand'

import {
  type CounterStore,
  counterStoreCreator,
} from '../shared/counter-store-creator'

export const useCounterStore = create()(counterStoreCreator)
```

## Setting Up Zustand for testing (part 5)

```tsx
// contexts/use-counter-store-context.tsx
import { type ReactNode, createContext, useContext, useState } from 'react'
import { createStore } from 'zustand'
import { useStoreWithEqualityFn } from 'zustand/traditional'
import { shallow } from 'zustand/shallow'

import {
  type CounterStore,
  counterStoreCreator,
} from '../shared/counter-store-creator'

export const createCounterStore = () => {
  return createStore(counterStoreCreator)
}

export type CounterStoreApi = ReturnType<typeof createCounterStore>

export const CounterStoreContext = createContext<CounterStoreApi | undefined>(
  undefined,
)

export interface CounterStoreProviderProps {
  children: ReactNode
}

export const CounterStoreProvider = ({
  children,
}: CounterStoreProviderProps) => {
  const [store] = useState(() => createCounterStore())
  return (
    <CounterStoreContext.Provider value={store}>
      {children}
    </CounterStoreContext.Provider>
  )
}

export type UseCounterStoreContextSelector = (store: CounterStore) => T

export const useCounterStoreContext = <T,>(
  selector: UseCounterStoreContextSelector,
): T => {
  const counterStoreContext = useContext(CounterStoreContext)

  if (counterStoreContext === undefined) {
    throw new Error(
      'useCounterStoreContext must be used within CounterStoreProvider',
    )
  }

  return useStoreWithEqualityFn(counterStoreContext, selector, shallow)
}
```

```tsx
// components/counter/counter.tsx
import { useCounterStore } from '../../stores/use-counter-store'

export function Counter() {
  const { count, inc } = useCounterStore()

  return (
    <div>
      <h2>Counter Store</h2>
      <h4>{count}</h4>
      <button onClick={inc}>One Up</button>
    </div>
  )
}
```

```ts
// components/counter/index.ts
export * from './counter'
```

```tsx
// components/counter/counter.test.tsx
import { act, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'

import { Counter, useCounterStore } from '../../../stores/use-counter-store.ts'

describe('Counter', () => {
  test('should render with initial state of 1', async () => {
    renderCounter()

    expect(useCounterStore.getState().count).toBe(1)
  })

  test('should increase count by clicking a button', async () => {
    const user = userEvent.setup()

    renderCounter()

    expect(useCounterStore.getState().count).toBe(1)

    await user.click(await screen.findByRole('button', { name: /one up/i }))

    expect(useCounterStore.getState().count).toBe(2)
  })
})

const renderCounter = () => {
  return render()
}
```

```tsx
// components/counter-with-context/counter-with-context.tsx
import {
  CounterStoreProvider,
  useCounterStoreContext,
} from '../../contexts/use-counter-store-context'

const Counter = () => {
  const { count, inc } = useCounterStoreContext((state) => state)

  return (
    <div>
      <h2>Counter Store Context</h2>
      <h4>{count}</h4>
      <button onClick={inc}>One Up</button>
    </div>
  )
}

export const CounterWithContext = () => {
  return (
    
      
    
  )
}
```

```tsx
// components/counter-with-context/index.ts
export * from './counter-with-context'
```

## Setting Up Zustand for testing (part 6)

```tsx
// components/counter-with-context/counter-with-context.test.tsx
import { act, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'

import { CounterStoreContext } from '../../../contexts/use-counter-store-context'
import { counterStoreCreator } from '../../../shared/counter-store-creator'

describe('CounterWithContext', () => {
  test('should render with initial state of 1', async () => {
    const counterStore = counterStoreCreator()

    renderCounterWithContext(counterStore)

    expect(counterStore.getState().count).toBe(1)
    expect(
      await screen.findByRole('button', { name: /one up/i }),
    ).toBeInTheDocument()
  })

  test('should increase count by clicking a button', async () => {
    const user = userEvent.setup()
    const counterStore = counterStoreCreator()

    renderCounterWithContext(counterStore)

    expect(counterStore.getState().count).toBe(1)

    await user.click(await screen.findByRole('button', { name: /one up/i }))

    expect(counterStore.getState().count).toBe(2)
  })
})

const renderCounterWithContext = (store) => {
  return render(, {
    wrapper: ({ children }) => (
      <CounterStoreContext.Provider value={store}>
        {children}
      </CounterStoreContext.Provider>
    ),
  })
}
```

## References

- **React Testing Library**: [React Testing Library (RTL)](https://testing-library.com/docs/react-testing-library/intro)
  is a very lightweight solution for testing React components. It provides utility functions on top
  of `react-dom` and `react-dom/test-utils`, in a way that encourages better testing practices. Its
  primary guiding principle is: "The more your tests resemble the way your software is used, the
  more confidence they can give you."
- **Native Testing Library**: [Native Testing Library (RNTL)](https://testing-library.com/docs/react-native-testing-library/intro)
  is a very lightweight solution for testing React Native components, similarly to RTL, but its
  functions are built on top of `react-test-renderer`.
- **Testing Implementation Details**: Blog post by Kent C. Dodds on why he recommends to avoid
  [testing implementation details](https://kentcdodds.com/blog/testing-implementation-details).

## Demos

- Jest: https://stackblitz.com/edit/jest-zustand
- Vitest: https://stackblitz.com/edit/vitest-zustand

