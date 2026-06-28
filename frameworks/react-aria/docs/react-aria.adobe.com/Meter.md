# Meter

## Introduction

A meter represents a quantity within a known range, or a fractional value.

## Vanilla CSS example

### Meter.tsx

```tsx
'use client';
import {Meter as AriaMeter, type MeterProps as AriaMeterProps} from 'react-aria-components/Meter';
import {Label} from './Form';
import './Meter.css';

export interface MeterProps extends AriaMeterProps {
  label?: string;
}

export function Meter({label, ...props}: MeterProps) {
  return (
    <AriaMeter {...props}>
      {({percentage, valueText}) => (
        <>
          {label}
          <span className="value">{valueText}</span>
          <div className="track inset">
            <div
              className="fill"
              style={
                {
                  width: percentage + '%',
                  '--fill-color':
                    percentage < 70
                      ? 'var(--green)'
                      : percentage < 90
                        ? 'var(--orange)'
                        : 'var(--red)'
                } as any
              }
            />
          </div>
        </>
      )}
    
  );
}

```

### Meter.css

```css
@import './theme.css';
@import './utilities.css';

.react-aria-Meter {
  display: grid;
  grid-template-areas:
    'label value'
    'bar bar';
  grid-template-columns: 1fr auto;
  width: 250px;
  color: var(--text-color);
  font: var(--font-size) system-ui;

  .value {
    grid-area: value;
  }

  .track {
    grid-area: bar;
    forced-color-adjust: none;
    height: calc(var(--spacing-2) + 2px);
    border-radius: 9999px;
    overflow: hidden;
  }

  .fill {
    --fill-color: var(--green);
    background: oklch(from var(--fill-color) var(--lightness-700) c h);
    height: calc(100% - 2px);
    margin: 1px 0 0 1px;
    border-radius: inherit;
    box-shadow:
      inset 0 1px 0 rgb(255 255 255 / 0.4),
      0 1px 0 lch(from var(--fill-color) 42% c h),
      0 0 0 1px var(--fill-color);

    @media (forced-colors: active) {
      box-shadow: none;
      background: Highlight;
    }
  }
}

```

## Tailwind example

### Meter.tsx

```tsx
'use client';
import {AlertTriangle} from 'lucide-react';
import React from 'react';
import {Meter as AriaMeter, type MeterProps as AriaMeterProps} from 'react-aria-components/Meter';
import {Label} from './Field';
import {composeTailwindRenderProps} from './utils';

export interface MeterProps extends AriaMeterProps {
  label?: string;
}

export function Meter({label, ...props}: MeterProps) {
  return (
    <AriaMeter
      {...props}
      className={composeTailwindRenderProps(
        props.className,
        'flex flex-col gap-2 font-sans max-w-full'
      )}>
      {({percentage, valueText}) => (
        <>
          <div className="flex justify-between gap-2">
            {label}
            <span
              className={`text-sm ${percentage >= 80 ? 'text-red-600 dark:text-red-500' : 'text-neutral-600 dark:text-neutral-400'}`}>
              {percentage >= 80 && (
                <AlertTriangle
                  aria-label="Alert"
                  className="inline-block w-4 h-4 align-text-bottom"
                />
              )}
              {' ' + valueText}
            </span>
          </div>
          <div className="w-64 max-w-full h-2 rounded-full bg-neutral-300 dark:bg-neutral-700 outline outline-1 -outline-offset-1 outline-transparent relative">
            <div
              className={`absolute top-0 left-0 h-full rounded-full ${getColor(percentage)} forced-colors:bg-[Highlight]`}
              style={{width: percentage + '%'}}
            />
          </div>
        </>
      )}
    
  );
}

function getColor(percentage: number) {
  if (percentage < 70) {
    return 'bg-green-600';
  }

  if (percentage < 80) {
    return 'bg-orange-500';
  }

  return 'bg-red-600';
}

```

## Value

By default, the `value` prop is a percentage between 0 and 100. Use the `minValue`, and `maxValue` props to set a custom value scale.

```tsx
import {VanillaMeter} from '@react-spectrum/s2';

```

## API

```tsx

  

```

### Meter

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Meter' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `dir` | `string | undefined` | — |  |
| `formatOptions` | `Intl.NumberFormatOptions | undefined` | \{ style: 'percent' } | The display format of the value label. |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `lang` | `string | undefined` | — |  |
| `maxValue` | `number | undefined` | 100 | The largest value allowed for the input. |
| `minValue` | `number | undefined` | 0 | The smallest value allowed for the input. |
| `onAnimationEnd` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationEndCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIteration` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIterationCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStart` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStartCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAuxClick` | `React.MouseEventHandler | undefined` | — |  |
| `onAuxClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onClick` | `React.MouseEventHandler | undefined` | — |  |
| `onClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenu` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenuCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClick` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onGotPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onGotPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onLostPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onLostPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onMouseDown` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseDownCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseEnter` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseLeave` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseMove` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseMoveCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseOut` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseOutCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseOver` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseOverCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseUp` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseUpCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onPointerCancel` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerCancelCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerDown` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerDownCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerEnter` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerLeave` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerMove` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerMoveCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOut` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOutCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOver` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOverCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerUp` | `React.PointerEventHandler | undefined` | — |  |

## API (part 3)

| `onPointerUpCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onScroll` | `React.UIEventHandler | undefined` | — |  |
| `onScrollCapture` | `React.UIEventHandler | undefined` | — |  |
| `onTouchCancel` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchCancelCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchEnd` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchEndCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchMove` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchMoveCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchStart` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchStartCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTransitionCancel` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionCancelCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEnd` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEndCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRun` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRunCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStart` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStartCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onWheel` | `React.WheelEventHandler | undefined` | — |  |
| `onWheelCapture` | `React.WheelEventHandler | undefined` | — |  |
| `render` | `DOMRenderFunction<"div", MeterRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: MeterRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `value` | `number | undefined` | 0 | The current value (controlled). |
| `valueLabel` | `React.ReactNode` | — | The content to display as the value's label (e.g. 1 of 4). |

