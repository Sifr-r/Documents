# ToggleButtonGroup

## Introduction

A toggle button group allows a user to toggle multiple options, with single or multiple
selection.

## Vanilla CSS example

```tsx
import {ToggleButtonGroup} from 'vanilla-starter/ToggleButtonGroup';
import {ToggleButton} from 'vanilla-starter/ToggleButton';

  <ToggleButton id="left">Bold
  <ToggleButton id="center">Italic
  <ToggleButton id="right">Underline

```

### ToggleButtonGroup.tsx

```tsx
'use client';
import {
  ToggleButtonGroup as RACToggleButtonGroup,
  type ToggleButtonGroupProps
} from 'react-aria-components/ToggleButtonGroup';
import './ToggleButtonGroup.css';

export function ToggleButtonGroup(props: ToggleButtonGroupProps) {
  return <RACToggleButtonGroup {...props} />;
}

```

### ToggleButtonGroup.css

```css
@import './theme.css';

.react-aria-ToggleButtonGroup {
  display: flex;

  > .react-aria-ToggleButton {
    z-index: 1;

    > span {
      transition: scale 200ms;
    }

    &[data-pressed] {
      scale: 1;

      > span {
        scale: 0.9;
      }
    }

    &[data-disabled] {
      z-index: 0;
    }

    &[data-selected],
    &[data-focus-visible] {
      z-index: 2;
    }
  }
}

.react-aria-ToggleButtonGroup[data-orientation='horizontal'] {
  flex-direction: row;

  > .react-aria-ToggleButton {
    margin-inline-start: -1px;
    border-radius: 0;

    &:first-child {
      border-radius: var(--radius) 0 0 var(--radius);
      margin-inline-start: 0;
    }

    &:last-child {
      border-radius: 0 var(--radius) var(--radius) 0;
    }
  }
}

.react-aria-ToggleButtonGroup[data-orientation='vertical'] {
  flex-direction: column;
  width: fit-content;

  > .react-aria-ToggleButton {
    margin-block-start: -1px;
    border-radius: 0;

    &:first-child {
      border-radius: var(--radius) var(--radius) 0 0;
      margin-block-start: 0;
    }

    &:last-child {
      border-radius: 0 0 var(--radius) var(--radius);
    }
  }
}

```

## Tailwind example

```tsx
import {ToggleButtonGroup} from 'tailwind-starter/ToggleButtonGroup';
import {ToggleButton} from 'tailwind-starter/ToggleButton';

  <ToggleButton id="left">Bold
  <ToggleButton id="center">Italic
  <ToggleButton id="right">Underline

```

### ToggleButtonGroup.tsx

```tsx
'use client';
import React from 'react';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {
  ToggleButtonGroup as RACToggleButtonGroup,
  type ToggleButtonGroupProps
} from 'react-aria-components/ToggleButtonGroup';
import {tv} from 'tailwind-variants';

const styles = tv({
  base: 'flex gap-1',
  variants: {
    orientation: {
      horizontal: 'flex-row',
      vertical: 'flex-col'
    }
  }
});

export function ToggleButtonGroup(props: ToggleButtonGroupProps) {
  return (
    <RACToggleButtonGroup
      {...props}
      className={composeRenderProps(props.className, (className, renderProps) =>
        styles({...renderProps, className})
      )}
    />
  );
}

```

## Selection

Use the `selectionMode` prop to enable single or multiple selection. The selected items can be controlled via the `selectedKeys` prop, matching the `id` of each ``. Items can be disabled with the `isDisabled` prop. See the [selection guide](selection.md?component=ToggleButtonGroup) for more details.

```tsx
import type {Key} from 'react-aria-components/ToggleButtonGroup';
import {useState} from 'react';
import {ToggleButtonGroup} from 'vanilla-starter/ToggleButtonGroup';
import {ToggleButton} from 'vanilla-starter/ToggleButton';
import {Bold, Italic, Underline, Strikethrough} from 'lucide-react';

function Example(props) {
  let [selected, setSelected] = useState(new Set(['bold']));

  return (
    <>
      <ToggleButtonGroup
        {...props}
        aria-label="Text style"
        /*- begin highlight -*/
        
        selectedKeys={selected}
        onSelectionChange={setSelected}>
        {/*- end highlight -*/}
        <ToggleButton id="bold" aria-label="Bold">
          <Bold size={18} />
        
        <ToggleButton id="italic" aria-label="Italic" isDisabled>
          <Italic size={18} />
        
        <ToggleButton id="underline" aria-label="Underline">
          <Underline size={18} />
        
        <ToggleButton id="strike" aria-label="Strikethrough">
          <Strikethrough size={18} />
        
      
      <p>Current selection: {[...selected].join(', ')}</p>
    </>
  );
}
```

### Animation

Render a [SelectionIndicator](selection.md#animated-selectionindicator) within each `ToggleButton` to animate selection changes.

```tsx
import {ToggleButtonGroup, ToggleButton, ToggleButtonProps, SelectionIndicator} from 'react-aria-components/ToggleButtonGroup';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import 'vanilla-starter/SegmentedControl.css';

function SegmentedControlItem(props: ToggleButtonProps) {
  return (
    <ToggleButton {...props} className="segmented-control-item">
      {/*- begin highlight -*/}
      {composeRenderProps(props.children, (children) => (<>
        <SelectionIndicator className="react-aria-SelectionIndicator button-base" data-selected />
        <span>{children}</span>
      </>))}
      {/*- end highlight -*/}
    
  );
}

<ToggleButtonGroup
  className="segmented-control button-base"
  data-variant="secondary"
  aria-label="Time period"
  defaultSelectedKeys={['day']}
  disallowEmptySelection>
  <SegmentedControlItem id="day">Day
  <SegmentedControlItem id="week">Week
  <SegmentedControlItem id="month">Month
  <SegmentedControlItem id="year">Year

```

## API

```tsx

  
    
  

```

### ToggleButtonGroup

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-ToggleButtonGroup' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultSelectedKeys` | `Iterable | undefined` | — | The initial selected keys in the collection (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `disallowEmptySelection` | `boolean | undefined` | — | Whether the collection allows empty selection. |
| `hidden` | `boolean | undefined` | — |  |
| `inert` | `boolean | undefined` | — |  |
| `isDisabled` | `boolean | undefined` | — | Whether all items are disabled. |
| `lang` | `string | undefined` | — |  |
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
| `onPointerUpCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onScroll` | `React.UIEventHandler | undefined` | — |  |

## API (part 3)

| `onScrollCapture` | `React.UIEventHandler | undefined` | — |  |
| `onSelectionChange` | `((keys: Set) => void) | undefined` | — | Handler that is called when the selection changes. |
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
| `orientation` | `Orientation | undefined` | 'horizontal' | The orientation of the the toggle button group. |
| `render` | `DOMRenderFunction<"div", ToggleButtonGroupRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `selectedKeys` | `Iterable | undefined` | — | The currently selected keys in the collection (controlled). |
| `selectionMode` | `"multiple" | "single" | undefined` | 'single' | Whether single or multiple selection is enabled. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: ToggleButtonGroupRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

