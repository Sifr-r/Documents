# DisclosureGroup

## Introduction

A DisclosureGroup is a grouping of related disclosures, sometimes called an accordion.
It supports both single and multiple expanded items.

## Vanilla CSS example

```tsx
import {DisclosureGroup} from 'vanilla-starter/DisclosureGroup';
import {Disclosure, DisclosureHeader, DisclosurePanel} from 'vanilla-starter/Disclosure';

  
    Personal Information
    Personal information form here.
  
  
    Billing Address
    Billing address form here.
  

```

### DisclosureGroup.tsx

```tsx
'use client';
import {
  DisclosureGroup as RACDisclosureGroup,
  type DisclosureGroupProps
} from 'react-aria-components/DisclosureGroup';
import './DisclosureGroup.css';

export function DisclosureGroup(props: DisclosureGroupProps) {
  return <RACDisclosureGroup {...props} />;
}

```

### DisclosureGroup.css

```css
@import './theme.css';

.react-aria-DisclosureGroup {
  width: 200px;
}

```

## Tailwind example

```tsx
import {DisclosureGroup} from 'tailwind-starter/DisclosureGroup';
import {Disclosure, DisclosureHeader, DisclosurePanel} from 'tailwind-starter/Disclosure';

  
    Personal Information
    Personal information form here.
  
  
    Billing Address
    Billing address form here.
  

```

### DisclosureGroup.tsx

```tsx
'use client';
import React from 'react';
import {
  DisclosureGroup as AriaDisclosureGroup,
  type DisclosureGroupProps as AriaDisclosureGroupProps
} from 'react-aria-components/DisclosureGroup';

export interface DisclosureGroupProps extends AriaDisclosureGroupProps {
  children: React.ReactNode;
}

export function DisclosureGroup({children, ...props}: DisclosureGroupProps) {
  return <AriaDisclosureGroup {...props}>{children};
}

```

## Expanding

Use the `defaultExpandedKeys` or `expandedKeys` prop to set the expanded items, and `onExpandedChange` to handle user interactions. The expanded keys correspond to the `id` prop of each ``.

```tsx
import type {Key} from 'react-aria-components/DisclosureGroup';
import {DisclosureGroup} from 'vanilla-starter/DisclosureGroup';
import {Disclosure, DisclosureHeader, DisclosurePanel} from 'vanilla-starter/Disclosure';
import {useState} from 'react';

function Example() {
  let [expandedKeys, setExpandedKeys] = useState(new Set(['system']));

  return (
    <DisclosureGroup
      /*- begin highlight -*/
      expandedKeys={expandedKeys}
      onExpandedChange={setExpandedKeys}>
      {/*- end highlight -*/}
      <Disclosure id="settings">
        Settings
        Application settings content
      
      <Disclosure id="preferences">
        Preferences
        User preferences content
      
      <Disclosure id="advanced">
        Advanced
        Advanced configuration options
      
    
  );
}
```

## API

```tsx

  

```

### DisclosureGroup

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `allowsMultipleExpanded` | `boolean | undefined` | — | Whether multiple items can be expanded at the same time. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-DisclosureGroup' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultExpandedKeys` | `Iterable | undefined` | — | The initial expanded keys in the group (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `expandedKeys` | `Iterable | undefined` | — | The currently expanded keys in the group (controlled). |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
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
| `onExpandedChange` | `((keys: Set) => any) | undefined` | — | Handler that is called when items are expanded or collapsed. |
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
| `onScrollCapture` | `React.UIEventHandler | undefined` | — |  |
| `onTouchCancel` | `React.TouchEventHandler | undefined` | — |  |

## API (part 3)

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
| `render` | `DOMRenderFunction<"div", DisclosureGroupRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style` | `(((values: DisclosureGroupRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

