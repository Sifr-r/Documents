# Tailwind CSS

Tailwind CSS 3+ is a utility-first CSS framework that generates minimal, production-ready stylesheets by scanning your templates for class usage. It provides composable utility classes for layout, typography, colors, and more.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Utility classes, responsive design, state variants, dark mode, arbitrary values, plugins, and config |

## Quick Reference

### Basic Utilities

```html
<!-- Spacing -->
<div class="p-4 m-2">Padding 4, Margin 2</div>
<div class="px-6 py-3">Horizontal/Vertical padding</div>

<!-- Typography -->
<h1 class="text-2xl font-bold text-gray-900">Heading</h1>
<p class="text-sm text-gray-600 leading-relaxed">Paragraph</p>

<!-- Colors -->
<div class="bg-blue-500 text-white">Blue background</div>
<div class="bg-gradient-to-r from-purple-500 to-pink-500">Gradient</div>

<!-- Borders and Shadows -->
<div class="border border-gray-200 rounded-lg shadow-md">Card</div>
<div class="ring-2 ring-blue-500 ring-offset-2">Ring</div>

<!-- Layout -->
<div class="flex items-center justify-between gap-4">Flexbox</div>
<div class="grid grid-cols-3 gap-6">Grid</div>
```

### Responsive Design

```html
<!-- Breakpoints: sm (640px), md (768px), lg (1024px), xl (1280px), 2xl (1536px) -->
<div class="w-full md:w-1/2 lg:w-1/3">
  Full on mobile, half on tablet, third on desktop
</div>

<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4">
  Responsive grid
</div>

<div class="hidden md:block">
  Hidden on mobile, visible on tablet+
</div>
```

### State Variants

```html
<!-- Hover -->
<button class="bg-blue-500 hover:bg-blue-700 hover:shadow-lg">
  Hover me
</button>

<!-- Focus -->
<input class="border focus:border-blue-500 focus:ring-2 focus:ring-blue-200" />

<!-- Active / Disabled -->
<button class="active:scale-95 disabled:opacity-50 disabled:cursor-not-allowed">
  Click
</button>

<!-- Group hover (parent controls children) -->
<div class="group">
  <span class="group-hover:text-blue-500">Highlights on parent hover</span>
</div>

<!-- Peer (sibling controls) -->
<input type="checkbox" class="peer" />
<span class="peer-checked:text-green-500">Checked!</span>
```

### Dark Mode

```html
<div class="bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100">
  Adapts to dark mode
</div>
```

### Arbitrary Values

```html
<!-- Use square brackets for custom values -->
<div class="w-[350px] h-[calc(100vh-4rem)]">Custom dimensions</div>
<div class="text-[#1da1f2] bg-[url('/bg.png')]">Custom color/image</div>
<div class="grid-cols-[1fr_2fr_1fr]">Custom grid</div>
```

### Transitions and Animations

```html
<button class="transition-all duration-300 ease-in-out hover:scale-105">
  Smooth hover
</button>

<div class="animate-spin">Spinner</div>
<div class="animate-pulse">Pulsing</div>
<div class="animate-bounce">Bouncing</div>
```

### Transform

```html
<div class="rotate-45">Rotated</div>
<div class="scale-110 hover:scale-125">Scaled</div>
<div class="translate-x-4 -translate-y-2">Translated</div>
```

### @apply (extracting components)

```css
/* In your CSS file */
@layer components {
  .btn-primary {
    @apply px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition;
  }
}
```

### Config (theme.extend)

```js
// tailwind.config.js
module.exports = {
  content: ['./src/**/*.{html,js,tsx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          50: '#f0f9ff',
          500: '#3b82f6',
          900: '#1e3a5f',
        },
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      },
      screens: {
        '3xl': '1920px',
      },
    },
  },
  plugins: [],
};
```

## See Also

- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Tailwind Play](https://play.tailwindcss.com)
- [Tailwind GitHub](https://github.com/tailwindlabs/tailwindcss)
