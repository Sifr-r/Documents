
## Introduction

Use the `QueryClientProvider` component to connect and provide a `QueryClient` to your application:

```tsx
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

const queryClient = new QueryClient()

function App() {
  return <QueryClientProvider client={queryClient}>...
}
```

**Options**

- `client: QueryClient`
  - **Required**
  - the QueryClient instance to provide

