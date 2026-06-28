# Tailwind CSS — Core

## Utility Classes

### Spacing

```html
<!-- Padding: p-{size}, px, py, pt, pr, pb, pl -->
<div class="p-4">padding: 1rem</div>
<div class="px-6 py-3">horizontal: 1.5rem, vertical: 0.75rem</div>

<!-- Margin: m-{size}, mx, my, mt, mr, mb, ml -->
<div class="m-2">margin: 0.5rem</div>
<div class="mx-auto">margin: 0 auto (center)</div>
<div class="-mt-4">negative margin: -1rem</div>

<!-- Space between children -->
<div class="space-y-4">vertical gap: 1rem</div>
<div class="space-x-2">horizontal gap: 0.5rem</div>
```

Scale: `0`, `px`, `0.5` (2px), `1` (4px), `2` (8px), `3` (12px), `4` (16px), `6` (24px), `8` (32px), `10` (40px), `12` (48px), `16` (64px), `20` (80px).

### Typography

```html
<h1 class="text-4xl font-bold tracking-tight">Heading 1</h1>
<h2 class="text-2xl font-semibold">Heading 2</h2>
<p class="text-base leading-7 text-gray-700">Body text</p>
<p class="text-sm font-medium uppercase tracking-wide">Label</p>

<!-- Line clamp -->
<p class="line-clamp-3">Truncated to 3 lines...</p>
```

Font sizes: `xs` (12px), `sm` (14px), `base` (16px), `lg` (18px), `xl` (20px), `2xl`–`9xl`.

### Colors

```html
<!-- Background -->
<div class="bg-blue-500">Solid</div>
<div class="bg-blue-500/50">50% opacity</div>
<div class="bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500">Gradient</div>

<!-- Text -->
<p class="text-gray-900">Dark text</p>
<p class="text-red-500">Red text</p>

<!-- Border -->
<div class="border-2 border-blue-500">Border</div>
```

Color palette: `slate`, `gray`, `zinc`, `neutral`, `stone`, `red`, `orange`, `amber`, `yellow`, `lime`, `green`, `emerald`, `teal`, `cyan`, `sky`, `blue`, `indigo`, `violet`, `purple`, `fuchsia`, `pink`, `rose`. Shades: `50`–`950`.

### Borders and Shadows

```html
<div class="border border-gray-200 rounded-lg">Rounded border</div>
<div class="rounded-full">Pill shape</div>
<div class="rounded-none">No rounding</div>

<div class="shadow-sm">Subtle shadow</div>
<div class="shadow-md">Medium shadow</div>
<div class="shadow-xl">Large shadow</div>
<div class="shadow-inner">Inner shadow</div>

<!-- Ring (outline) -->
<div class="ring-2 ring-blue-500 ring-offset-2">Ring with offset</div>
```

### Layout

```html
<!-- Flexbox -->
<div class="flex items-center justify-between gap-4">
  <div>Left</div>
  <div>Right</div>
</div>
<div class="flex flex-col">Vertical</div>
<div class="flex flex-wrap">Wrapping</div>

<!-- Grid -->
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
  <div>Item</div>
</div>
<div class="grid grid-cols-[200px_1fr]">Fixed sidebar + fluid</div>

<!-- Container -->
<div class="container mx-auto px-4">Centered max-width container</div>
```

## Responsive Design

Breakpoints apply styles at `min-width` and above (mobile-first).

| Class | Width |
|-------|-------|
| `sm:` | 640px |
| `md:` | 768px |
| `lg:` | 1024px |
| `xl:` | 1280px |
| `2xl:` | 1536px |

```html
<!-- Mobile-first: default styles apply below sm -->
<div class="w-full sm:w-1/2 lg:w-1/3">
  Full → half → third
</div>

<!-- Responsive visibility -->
<nav class="hidden lg:flex">Desktop-only nav</nav>
<button class="lg:hidden">Mobile menu</button>

<!-- Responsive typography -->
<h1 class="text-2xl md:text-4xl lg:text-5xl">Responsive heading</h1>

<!-- Responsive grid -->
<div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-4">
  Responsive columns
</div>
```

## State Variants

```html
<!-- Pseudo-classes -->
<button class="hover:bg-blue-600">hover:</button>
<input class="focus:ring-2 focus:ring-blue-400" />
<button class="active:scale-95">active:</button>
<button class="disabled:opacity-50">disabled:</button>
<li class="first:pt-0 last:pb-0">first:/last:</li>
<input class="placeholder:text-gray-400" />
<div class="odd:bg-gray-50 even:bg-white">odd:/even:</div>
<input class="checked:bg-blue-500" type="checkbox" />
<input class="required:border-red-500" />

<!-- Pseudo-elements -->
<div class="before:content-[''] before:block before:w-full">before:</div>
<p class="first-letter:text-4xl first-letter:font-bold">first-letter:</p>
<p class="selection:bg-yellow-200">selection:</p>

<!-- Group variants -->
<div class="group cursor-pointer">
  <h3 class="text-gray-900 group-hover:text-blue-600">Parent hover affects child</h3>
  <p class="opacity-0 group-hover:opacity-100 transition">Revealed on hover</p>
</div>

<!-- Peer variants -->
<div>
  <input type="checkbox" class="peer sr-only" id="toggle" />
  <label for="toggle" class="cursor-pointer peer-checked:text-green-600">Toggle</label>
  <div class="hidden peer-checked:block">Shown when checked</div>
</div>
```

## Dark Mode

```js
// tailwind.config.js
module.exports = {
  darkMode: 'class', // or 'media' (default — prefers-color-scheme)
};
```

```html
<!-- class strategy: toggled by adding .dark to <html> -->
<div class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white">
  <p class="text-gray-600 dark:text-gray-400">Secondary text</p>
  <div class="border-gray-200 dark:border-gray-700 border">Card</div>
</div>
```

Toggle dark mode programmatically:

```js
document.documentElement.classList.toggle('dark');
```

## Arbitrary Values

```html
<!-- Custom sizes -->
<div class="w-[350px] h-[200px]">Exact dimensions</div>
<div class="top-[17px] left-[calc(100%-2rem)]">Calculated positions</div>

<!-- Custom colors -->
<div class="text-[#1da1f2] bg-[rgb(255,0,0)]">Hex/rgb colors</div>

<!-- Custom fonts -->
<p class="font-['Open_Sans']">Specific font</p>

<!-- Custom grid -->
<div class="grid-cols-[1fr_500px_2fr]">Custom grid template</div>

<!-- Custom content -->
<div class="before:content-['Hello']">Generated content</div>

<!-- Negative arbitrary -->
<div class="-translate-x-[50%]">Negative transform</div>
```

## @apply

Use sparingly — prefer composing utility classes in HTML.

```css
/* styles.css */
@layer components {
  .btn {
    @apply px-4 py-2 rounded-lg font-medium transition-colors;
  }
  .btn-primary {
    @apply btn bg-blue-500 text-white hover:bg-blue-600;
  }
  .btn-secondary {
    @apply btn bg-gray-200 text-gray-800 hover:bg-gray-300;
  }
  .input {
    @apply w-full px-3 py-2 border border-gray-300 rounded-lg
           focus:outline-none focus:ring-2 focus:ring-blue-500;
  }
}
```

## Custom Plugins

```js
// tailwind.config.js
const plugin = require('tailwindcss/plugin');

module.exports = {
  plugins: [
    plugin(function({ addUtilities, addComponents, theme }) {
      // Add custom utilities
      addUtilities({
        '.scrollbar-none': { 'scrollbar-width': 'none' },
        '.scrollbar-none::-webkit-scrollbar': { display: 'none' },
      });

      // Add component classes
      addComponents({
        '.card': {
          padding: theme('spacing.6'),
          borderRadius: theme('borderRadius.lg'),
          boxShadow: theme('boxShadow.md'),
          backgroundColor: theme('colors.white'),
        },
      });
    }),
  ],
};
```

## Config (theme.extend)

```js
// tailwind.config.js
module.exports = {
  content: [
    './src/**/*.{js,jsx,ts,tsx}',
    './pages/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          DEFAULT: '#3b82f6',
          light: '#60a5fa',
          dark: '#2563eb',
        },
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        mono: ['Fira Code', 'monospace'],
      },
      spacing: {
        '18': '4.5rem',
        '88': '22rem',
      },
      screens: {
        '3xl': '1920px',
      },
      animation: {
        'slide-in': 'slideIn 0.3s ease-out',
      },
      keyframes: {
        slideIn: {
          '0%': { transform: 'translateX(-100%)' },
          '100%': { transform: 'translateX(0)' },
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
};
```

## Content / Purge

The `content` array tells Tailwind which files to scan for class names. Only detected classes are included in the final CSS.

```js
// Safelist classes that can't be detected statically
module.exports = {
  content: {
    files: ['./src/**/*.{html,js,tsx}'],
    safelist: [
      'bg-red-500',
      'bg-green-500',
      { pattern: /bg-(red|green|blue)-(100|200|300)/ },
    ],
  },
};
```

## See Also

- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Tailwind Play](https://play.tailwindcss.com)
- [Tailwind Plugins](https://tailwindcss.com/docs/plugins)
- [Tailwind GitHub](https://github.com/tailwindlabs/tailwindcss)
