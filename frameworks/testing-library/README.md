# React Testing Library

Simple and complete React DOM testing utilities encouraging user-centric testing practices.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Core concepts, API reference, and key usage patterns |
| Documentation | [docs/](docs/) | Full documentation set indexed from upstream package |

## Quick Reference

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

## See Also

- [React Testing Library Official Documentation](https://neuledge.com)
