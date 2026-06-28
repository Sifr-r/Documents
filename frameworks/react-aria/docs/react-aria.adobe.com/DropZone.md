# DropZone

## Introduction

A drop zone is an area into which one or multiple objects can be dragged and dropped.

## Vanilla CSS example

```tsx
import {DropZone, Text} from 'vanilla-starter/DropZone';
import {useState} from 'react';
import React from 'react';

function Example() {
  let [content, setContent] = useState<string | React.ReactElement | null>(null);
  return (
    <DropZone
      // Determine whether dragged content should be accepted.
      getDropOperation={types => (
        ['text/plain', 'image/jpeg', 'image/png', 'image.gif'].some(t => types.has(t))
          ? 'copy'
          : 'cancel'
      )}
      onDrop={async (event) => {
        // Find the first accepted item.
        let item = event.items.find(item => (
          (item.kind === 'text' && item.types.has('text/plain')) ||
          (item.kind === 'file' && item.type.startsWith('image/'))
        ));

        if (item?.kind === 'text') {
          let text = await item.getText('text/plain');
          setContent(text);
        } else if (item?.kind === 'file') {
          let file = await item.getFile();
          let url = URL.createObjectURL(file);
          setContent(<img src={url} alt={item.name} style={{maxHeight: 100, maxWidth: '100%'}} />)
        }
      }}>
      <Text slot="label">
        {content || "Drop or paste text or images here"}
      
    
  );
}
```

### DropZone.tsx

```tsx
'use client';
import {type DropZoneProps, DropZone as RACDropZone, Text} from 'react-aria-components/DropZone';
import './DropZone.css';

export function DropZone(props: DropZoneProps) {
  return <RACDropZone {...props} />;
}

export {Text};

```

### DropZone.css

```css
@import './theme.css';

.react-aria-DropZone {
  color: var(--text-color);
  background: var(--overlay-background);
  border: 1px solid var(--border-color);
  forced-color-adjust: none;
  border-radius: var(--radius);
  appearance: none;
  vertical-align: middle;
  font-size: 1rem;
  line-height: 1.5;
  text-align: center;
  margin: 0;
  outline: none;
  padding: 24px 12px;
  width: 30%;
  min-height: 96px;
  display: flex;
  align-items: center;
  justify-content: center;
  text-wrap: balance;

  &[data-focus-visible],
  &[data-drop-target] {
    outline: 2px solid var(--focus-ring-color);
    outline-offset: -1px;
  }

  &[data-drop-target] {
    background: var(--highlight-overlay);
  }
}

```

## Tailwind example

```tsx
import {DropZone, Text} from 'tailwind-starter/DropZone';
import {useState} from 'react';
import React from 'react';

function Example() {
  let [content, setContent] = useState<string | React.ReactElement | null>(null);
  return (
    <DropZone
      // Determine whether dragged content should be accepted.
      getDropOperation={types => (
        ['text/plain', 'image/jpeg', 'image/png', 'image/gif'].some(t => types.has(t)) ? 'copy' : 'cancel'
      )}
      onDrop={async (event) => {
        // Find the first accepted item.
        let item = event.items.find(item => (
          (item.kind === 'text' && item.types.has('text/plain')) ||
          (item.kind === 'file' && item.type.startsWith('image/'))
        ));

        if (item?.kind === 'text') {
          let text = await item.getText('text/plain');
          setContent(text);
        } else if (item?.kind === 'file') {
          let file = await item.getFile();
          let url = URL.createObjectURL(file);
          setContent(<img src={url} alt={item.name} style={{maxHeight: 100, maxWidth: '100%'}} />)
        }
      }}>
      <Text slot="label">
        {content || "Drop or paste text or images here"}
      
    
  );
}
```

### DropZone.tsx

```tsx
'use client';
import React from 'react';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {type DropZoneProps, DropZone as RACDropZone, Text} from 'react-aria-components/DropZone';
import {tv} from 'tailwind-variants';

const dropZone = tv({
  base: 'flex items-center justify-center p-8 min-h-24 w-[30%] font-sans text-base text-balance text-center rounded-lg border border-1 border-neutral-300 dark:border-neutral-800 bg-white dark:bg-neutral-900',
  variants: {
    isFocusVisible: {
      true: 'outline outline-2 -outline-offset-1 outline-blue-600 dark:outline-blue-500 forced-colors:outline-[Highlight]'
    },
    isDropTarget: {
      true: 'bg-blue-200 dark:bg-blue-800 outline outline-2 -outline-offset-1 outline-blue-600 dark:outline-blue-500 forced-colors:outline-[Highlight]'
    }
  }
});

export function DropZone(props: DropZoneProps) {
  return (
    <RACDropZone
      {...props}
      className={composeRenderProps(props.className, (className, renderProps) =>
        dropZone({...renderProps, className})
      )}
    />
  );
}

export {Text};

```

## Examples

<ExampleList
  tag="dropzone"
  pages={props.pages}
/>

## API

```tsx

  <Text slot="label" />

```

### DropZone

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-DropZone' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `dir` | `string | undefined` | — |  |
| `getDropOperation` | `((types: DragTypes, allowedOperations: DropOperation[]) => DropOperation) | undefined` | — | A function returning the drop operation to be performed when items matching the given types are dropped on the drop target. |
| `hidden` | `boolean | undefined` | — |  |
| `inert` | `boolean | undefined` | — |  |
| `isDisabled` | `boolean | undefined` | — | Whether the drop target is disabled. If true, the drop target will not accept any drops. |
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
| `onDrop` | `((e: DropEvent) => void) | undefined` | — | Handler that is called when a valid drag is dropped on the drop target. |
| `onDropActivate` | `((e: DropActivateEvent) => void) | undefined` | — | Handler that is called after a valid drag is held over the drop target for a period of time. This typically opens the item so that the user can drop within it. |
| `onDropEnter` | `((e: DropEnterEvent) => void) | undefined` | — | Handler that is called when a valid drag enters the drop target. |
| `onDropExit` | `((e: DropExitEvent) => void) | undefined` | — | Handler that is called when a valid drag exits the drop target. |
| `onDropMove` | `((e: DropMoveEvent) => void) | undefined` | — | Handler that is called when a valid drag is moved within the drop target. |
| `onGotPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onGotPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onHoverChange` | `((isHovering: boolean) => void) | undefined` | — | Handler that is called when the hover state changes. |
| `onHoverEnd` | `((e: HoverEvent) => void) | undefined` | — | Handler that is called when a hover interaction ends. |
| `onHoverStart` | `((e: HoverEvent) => void) | undefined` | — | Handler that is called when a hover interaction starts. |
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

## API (part 3)

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
| `render` | `DOMRenderFunction<"div", DropZoneRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: DropZoneRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

