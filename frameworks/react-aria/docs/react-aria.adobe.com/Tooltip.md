# Tooltip

## Introduction

A tooltip displays a description of an element on hover or focus.

## Vanilla CSS example

```tsx
import {TooltipTrigger} from 'react-aria-components/Tooltip';
import {Tooltip} from 'vanilla-starter/Tooltip';
import {Button} from 'vanilla-starter/Button';
import {Edit} from 'lucide-react';

function Example(props) {
  return (
    
      <Button aria-label="Edit">
        <Edit size={18} />
      
      {/*- begin highlight -*/}
      <Tooltip {...props}>
        Edit
      
      {/*- end highlight -*/}
    
  );
}
```

### Tooltip.tsx

```tsx
'use client';
import {
  OverlayArrow,
  Tooltip as AriaTooltip,
  type TooltipProps as AriaTooltipProps,
  TooltipTrigger as AriaTooltipTrigger,
  type TooltipTriggerComponentProps
} from 'react-aria-components/Tooltip';
import './Tooltip.css';

export interface TooltipProps extends Omit<AriaTooltipProps, 'children'> {
  children: React.ReactNode;
}

export function Tooltip({children, ...props}: TooltipProps) {
  return (
    <AriaTooltip {...props}>
      
        <svg width={8} height={8} viewBox="0 0 8 8">
          <path d="M0 0 L4 4 L8 0" />
        </svg>
      
      {children}
    
  );
}

export function TooltipTrigger(props: TooltipTriggerComponentProps) {
  return <AriaTooltipTrigger {...props} />;
}

```

### Tooltip.css

```css
@import './theme.css';

.react-aria-Tooltip {
  box-shadow: 0 8px 20px rgba(0 0 0 / 0.1);
  border-radius: var(--radius);
  background: var(--highlight-background);
  color: var(--highlight-foreground);
  forced-color-adjust: none;
  outline: none;
  padding: var(--spacing-1) var(--spacing-2);
  max-width: 150px;
  /* fixes FF gap */
  transform: translate3d(0, 0, 0);
  transition:
    transform 200ms,
    opacity 200ms;
  font: var(--font-size) system-ui;

  &[data-entering],
  &[data-exiting] {
    transform: var(--origin);
    opacity: 0;
  }

  &[data-placement='top'] {
    margin-bottom: 10px;
    --origin: translateY(4px);
  }

  &[data-placement='bottom'] {
    margin-top: 10px;
    --origin: translateY(-4px);
    & .react-aria-OverlayArrow svg {
      transform: rotate(180deg);
    }
  }

  &[data-placement='right'] {
    margin-left: 10px;
    --origin: translateX(-4px);
    & .react-aria-OverlayArrow svg {
      transform: rotate(90deg);
    }
  }

  &[data-placement='left'] {
    margin-right: 10px;
    --origin: translateX(4px);
    & .react-aria-OverlayArrow svg {
      transform: rotate(-90deg);
    }
  }

  .react-aria-OverlayArrow svg {
    display: block;
    fill: var(--highlight-background);
  }
}

```

## Tailwind example

```tsx
import {TooltipTrigger} from 'react-aria-components/Tooltip';
import {Tooltip} from 'tailwind-starter/Tooltip';
import {Button} from 'tailwind-starter/Button';
import {Edit} from 'lucide-react';

function Example(props) {
  return (
    
      <Button aria-label="Edit" variant="secondary">
        <Edit size={18} />
      
      {/*- begin highlight -*/}
      <Tooltip {...props}>
        Edit
      
      {/*- end highlight -*/}
    
  );
}
```

### Tooltip.tsx

```tsx
'use client';
import React from 'react';
import {
  Tooltip as AriaTooltip,
  type TooltipProps as AriaTooltipProps,
  OverlayArrow
} from 'react-aria-components/Tooltip';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {tv} from 'tailwind-variants';

export interface TooltipProps extends Omit<AriaTooltipProps, 'children'> {
  children: React.ReactNode;
}

const styles = tv({
  base: 'group bg-neutral-700 dark:bg-neutral-600 border border-neutral-800 dark:border-white/10 font-sans text-xs text-white rounded-lg drop-shadow-lg will-change-transform px-3 py-1.5 box-border',
  variants: {
    isEntering: {
      true: 'animate-in fade-in placement-bottom:slide-in-from-top-0.5 placement-top:slide-in-from-bottom-0.5 placement-left:slide-in-from-right-0.5 placement-right:slide-in-from-left-0.5 ease-out duration-200'
    },
    isExiting: {
      true: 'animate-out fade-out placement-bottom:slide-out-to-top-0.5 placement-top:slide-out-to-bottom-0.5 placement-left:slide-out-to-right-0.5 placement-right:slide-out-to-left-0.5 ease-in duration-150'
    }
  }
});

export function Tooltip({children, ...props}: TooltipProps) {
  return (
    <AriaTooltip
      {...props}
      offset={10}
      className={composeRenderProps(props.className, (className, renderProps) =>
        styles({...renderProps, className})
      )}>
      
        <svg
          width={8}
          height={8}
          viewBox="0 0 8 8"
          className="block fill-neutral-700 dark:fill-neutral-600 forced-colors:fill-[Canvas] stroke-neutral-800 dark:stroke-white/10 forced-colors:stroke-[ButtonBorder] group-placement-bottom:rotate-180 group-placement-left:-rotate-90 group-placement-right:rotate-90">
          <path d="M0 0 L4 4 L8 0" />
        </svg>
      
      {children}
    
  );
}

```

## Interactions

Tooltips appear after a "warmup" delay when hovering, or instantly on focus. Once a tooltip is displayed, other tooltips display immediately. If the user waits for the "cooldown period" before hovering another element, the warmup timer restarts.

```tsx
import {TooltipTrigger} from 'react-aria-components/Tooltip';
import {Tooltip} from 'vanilla-starter/Tooltip';
import {Button} from 'vanilla-starter/Button';
import {Edit} from 'lucide-react';
import {Save} from 'lucide-react';

function Example(props) {
  return (
    <div style={{display: 'flex', gap: 8}}>
      {/*- begin highlight -*/}
      <TooltipTrigger {...props}>
      {/*- end highlight -*/}
        <Button aria-label="Edit">
          <Edit size={18} />
        
        
          Edit
        
      
      <TooltipTrigger {...props}>
        <Button aria-label="Save">
          <Save size={18} />
        
        
          Save
        
      
    </div>
  );
}
```

<InlineAlert
  variant="notice"
  UNSAFE_style={{marginTop: '2rem'}}
>
  Accessibility
  Tooltips are not shown on touch screen interactions. Ensure that your UI is usable without tooltips, or use an alternative component such as a [Popover](Popover.md) to show information in an adjacent element.

## Custom trigger

`TooltipTrigger` works with any focusable React Aria component (e.g. [Button](Button.md), [Link](Link.md), etc.). Use the `` component to wrap a custom trigger element such as a third party component or DOM element.

```tsx
"use client"
import {Focusable, TooltipTrigger} from 'react-aria-components/Tooltip';
import {Tooltip} from 'vanilla-starter/Tooltip';

  {/*- begin highlight -*/}
  
    <span role="button">Custom trigger</span>
  
  {/*- end highlight -*/}
  Tooltip

```

<InlineAlert variant="notice">
  Accessibility
  Any `` child must have an ARIA role or use an appropriate semantic HTML element so that screen readers can announce the tooltip. Trigger components must forward their `ref` and spread all props to a DOM element.

```tsx
const CustomTrigger = React.forwardRef((props, ref) => (
  <button {...props} ref={ref} />
));
```

[DialogTrigger](Modal.md#custom-trigger) or [MenuTrigger](Menu.md#custom-trigger) with a `` trigger also works with `TooltipTrigger`. All `` elements are already focusable, so there's no need to wrap them in ``.

## API

```tsx

  
  
    
  

```

### TooltipTrigger

### Tooltip

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `arrowBoundaryOffset` | `number | undefined` | 0 | The minimum distance the arrow's edge should be from the edge of the overlay element. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Tooltip' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `containerPadding` | `number | undefined` | 12 | The placement padding that should be applied between the element and its surrounding container. |
| `crossOffset` | `number | undefined` | 0 | The additional offset applied along the cross axis between the element and its anchor element. |
| `defaultOpen` | `boolean | undefined` | — | Whether the overlay is open by default (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
| `inert` | `boolean | undefined` | — |  |
| `isEntering` | `boolean | undefined` | — | Whether the tooltip is currently performing an entry animation. |
| `isExiting` | `boolean | undefined` | — | Whether the tooltip is currently performing an exit animation. |
| `isOpen` | `boolean | undefined` | — | Whether the element is rendered. |
| `lang` | `string | undefined` | — |  |
| `offset` | `number | undefined` | 0 | The additional offset applied along the main axis between the element and its anchor element. |
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
| `onOpenChange` | `((isOpen: boolean) => void) | undefined` | — | Handler that is called when the overlay's open state changes. |
| `onPointerCancel` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerCancelCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerDown` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerDownCapture` | `React.PointerEventHandler | undefined` | — |  |

## API (part 3)

| `onPointerEnter` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerLeave` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerMove` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerMoveCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOut` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOutCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOver` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOverCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerUp` | `React.PointerEventHandler | undefined` | — |  |
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
| `placement` | `Placement | undefined` | 'top' | The placement of the tooltip with respect to the trigger. |
| `render` | `DOMRenderFunction<"div", TooltipRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `shouldFlip` | `boolean | undefined` | true | Whether the element should flip its orientation (e.g. top to bottom or left to right) when there is insufficient room for it to render completely. |
| `style` | `(((values: TooltipRenderProps & { defaultStyle: CSSProperties; }) => CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `triggerRef` | `RefObject<Element | null> | undefined` | — | The ref for the element which the tooltip positions itself with respect to. When used within a TooltipTrigger this is set automatically. It is only required when used standalone. |

