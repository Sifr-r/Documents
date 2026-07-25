# React Testing Library — Core Guide

## Overview

Simple and complete React DOM testing utilities encouraging user-centric testing practices.

## Key Patterns & Usage

### Basic Component Test
```typescript
import { render, screen, fireEvent } from '@testing-library/react';
import Counter from './Counter';

test('increments counter on click', () => {
  render(<Counter />);
  const button = screen.getByRole('button', { name: /increment/i });
  fireEvent.click(button);
  expect(screen.getByText('Count: 1')).toBeInTheDocument();
});
```

## Index of Available Documentation Files

All detailed guide files can be found under the [`docs/`](docs/) directory:

- [`docs/angular-testing-library/api.mdx`](docs/docs/angular-testing-library/api.mdx)
- [`docs/angular-testing-library/examples.mdx`](docs/docs/angular-testing-library/examples.mdx)
- [`docs/angular-testing-library/faq.mdx`](docs/docs/angular-testing-library/faq.mdx)
- [`docs/angular-testing-library/intro.mdx`](docs/docs/angular-testing-library/intro.mdx)
- [`docs/angular-testing-library/version-compatibility.mdx`](docs/docs/angular-testing-library/version-compatibility.mdx)
- [`docs/bs-react-testing-library/examples.mdx`](docs/docs/bs-react-testing-library/examples.mdx)
- [`docs/bs-react-testing-library/intro.mdx`](docs/docs/bs-react-testing-library/intro.mdx)
- [`docs/cypress-testing-library/intro.mdx`](docs/docs/cypress-testing-library/intro.mdx)
- [`docs/dom-testing-library/api-accessibility.mdx`](docs/docs/dom-testing-library/api-accessibility.mdx)
- [`docs/dom-testing-library/api-async.mdx`](docs/docs/dom-testing-library/api-async.mdx)
- [`docs/dom-testing-library/api-configuration.mdx`](docs/docs/dom-testing-library/api-configuration.mdx)
- [`docs/dom-testing-library/api-custom-queries.mdx`](docs/docs/dom-testing-library/api-custom-queries.mdx)
- [`docs/dom-testing-library/api-debugging.mdx`](docs/docs/dom-testing-library/api-debugging.mdx)
- [`docs/dom-testing-library/api-events.mdx`](docs/docs/dom-testing-library/api-events.mdx)
- [`docs/dom-testing-library/api-within.mdx`](docs/docs/dom-testing-library/api-within.mdx)
- [`docs/dom-testing-library/api.mdx`](docs/docs/dom-testing-library/api.mdx)
- [`docs/dom-testing-library/cheatsheet.mdx`](docs/docs/dom-testing-library/cheatsheet.mdx)
- [`docs/dom-testing-library/example-intro.mdx`](docs/docs/dom-testing-library/example-intro.mdx)
- [`docs/dom-testing-library/faq.mdx`](docs/docs/dom-testing-library/faq.mdx)
- [`docs/dom-testing-library/install.mdx`](docs/docs/dom-testing-library/install.mdx)
- ... and 89 more files under `docs/`
