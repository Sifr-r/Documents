# Modal

## Introduction

A modal is an overlay element which blocks interaction with elements outside it.

## Vanilla CSS example

```tsx
import {DialogTrigger} from 'react-aria-components/Modal';
import {Modal} from 'vanilla-starter/Modal';
import {Dialog, Heading} from 'vanilla-starter/Dialog';
import {Form} from 'vanilla-starter/Form';
import {TextField} from 'vanilla-starter/TextField';
import {Button} from 'vanilla-starter/Button';

function Example(props) {
  return (
    
      Sign up…
      <Modal {...props}>
        
          <Heading slot="title">Subscribe to our newsletter
          <p>Enter your information to subscribe to our newsletter and receive updates about new features and announcements.</p>
          
            <TextField autoFocus label="Name" placeholder="Enter your full name" />
            <TextField label="Email" placeholder="Enter your email" />
            <div style={{display: 'flex', gap: 8, alignSelf: 'end'}}>
              <Button slot="close" variant="secondary">Cancel
              <Button slot="close">Subscribe
            </div>
          
        
      
    
  );
}
```

### Modal.tsx

```tsx
'use client';
import {Modal as RACModal, type ModalOverlayProps} from 'react-aria-components/Modal';
import './Modal.css';

export function Modal(props: ModalOverlayProps) {
  return <RACModal {...props} />;
}

```

### Modal.css

```css
@import './theme.css';

.react-aria-ModalOverlay {
  position: absolute;
  top: 0;
  left: 0;
  width: var(--page-width);
  height: var(--page-height);
  background: rgba(0 0 0 / 0.5);
  overflow: clip;
  z-index: 100;
  font-family: system-ui;
  font-size: var(--font-size);

  &[data-entering] {
    animation: modal-fade 200ms;
  }

  &[data-exiting] {
    animation: modal-fade 150ms reverse ease-in;
  }
}

.react-aria-Modal {
  position: sticky;
  max-height: calc(var(--visual-viewport-height) * 0.9);
  top: calc(var(--visual-viewport-height) / 2);
  margin-left: 50vw;
  translate: -50% -50%;
  box-shadow: 0 8px 32px rgba(0 0 0 / 0.2);
  border-radius: var(--radius-xl);
  background: var(--overlay-background);
  color: var(--text-color);
  outline: 1px solid var(--overlay-border);
  width: max-content;
  max-width: min(500px, 90vw);

  &[data-entering] {
    animation: modal-zoom 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
  }

  .react-aria-TextField {
    margin-bottom: 8px;
  }
}

@keyframes modal-fade {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

@keyframes modal-zoom {
  from {
    transform: scale(0.8);
  }

  to {
    transform: scale(1);
  }
}

```

## Tailwind example

```tsx
import {DialogTrigger} from 'react-aria-components/Modal';
import {Modal} from 'tailwind-starter/Modal';
import {Dialog, Heading} from 'tailwind-starter/Dialog';
import {Form} from 'tailwind-starter/Form';
import {TextField} from 'tailwind-starter/TextField';
import {Button} from 'tailwind-starter/Button';

function Example(props) {
  return (
    
      Sign up…
      <Modal {...props}>
        
          <Heading slot="title" className="text-xl mt-0">Subscribe to our newsletter
          <p className="text-sm">Enter your information to subscribe to our newsletter and receive updates about new features and announcements.</p>
          
            <TextField autoFocus label="Name" placeholder="Enter your full name" />
            <TextField label="Email" placeholder="Enter your email" />
            <div className="flex gap-2 self-end">
              <Button slot="close" variant="secondary">Cancel
              <Button slot="close">Subscribe
            </div>
          
        
      
    
  );
}
```

### Modal.tsx

```tsx
'use client';
import React from 'react';
import {ModalOverlay, type ModalOverlayProps, Modal as RACModal} from 'react-aria-components/Modal';
import {tv} from 'tailwind-variants';

const overlayStyles = tv({
  base: 'absolute top-0 left-0 w-full h-(--page-height) isolate z-20 bg-black/[50%] text-center backdrop-blur-lg',
  variants: {
    isEntering: {
      true: 'animate-in fade-in duration-200 ease-out'
    },
    isExiting: {
      true: 'animate-out fade-out duration-200 ease-in'
    }
  }
});

const modalStyles = tv({
  base: 'font-sans w-full max-w-[min(90vw,450px)] max-h-[calc(var(--visual-viewport-height)*.9)] rounded-2xl bg-white dark:bg-neutral-800/70 dark:backdrop-blur-2xl dark:backdrop-saturate-200 forced-colors:bg-[Canvas] text-left align-middle text-neutral-700 dark:text-neutral-300 shadow-2xl bg-clip-padding border border-black/10 dark:border-white/10',
  variants: {
    isEntering: {
      true: 'animate-in zoom-in-105 ease-out duration-200'
    },
    isExiting: {
      true: 'animate-out zoom-out-95 ease-in duration-200'
    }
  }
});

export function Modal(props: ModalOverlayProps) {
  return (
    <ModalOverlay {...props} className={overlayStyles}>
      <div className="sticky top-0 left-0 w-full h-(--visual-viewport-height) flex items-center justify-center box-border">
        <RACModal {...props} className={modalStyles} />
      </div>
    
  );
}

```

## Sheet

Overlays such as trays, drawers, and sheets can be built using a `Modal` with custom entry and exit animations.

```tsx
import {DialogTrigger} from 'react-aria-components/Modal';
import {Sheet, Heading} from 'vanilla-starter/Sheet';
import {Button} from 'vanilla-starter/Button';

  Open sheet
  
    <Heading slot="title">Notice
    <p>This is a modal with a custom modal overlay.</p>
    <Button slot="close">Close
  

```

## Controlled

Use the `isOpen` prop to show a modal programmatically or mount in a different part of the JSX tree (e.g. outside a menu).

```tsx
import {useState} from 'react';
import {MenuTrigger, Menu, MenuItem} from 'vanilla-starter/Menu';
import {Modal} from 'vanilla-starter/Modal';
import {Dialog, Heading} from 'vanilla-starter/Dialog';
import {Button} from 'vanilla-starter/Button';

function Example() {
  let [isOpen, setOpen] = useState(false);

  return (
    <>
      
        Menu
        
          <MenuItem onAction={() => setOpen(true)}>Open dialog…
        
      
      <Modal isDismissable isOpen={isOpen} onOpenChange={setOpen}>
        
          <Heading slot="title">Notice
          <p>Click outside or press Escape to close this dialog.</p>
        
      
    </>
  );
}
```

## Custom trigger

`DialogTrigger` works with any pressable React Aria component (e.g. [Button](Button.md), [Link](Link.md), etc.). Use the `` component or [usePress](usePress.md) hook to wrap a custom trigger element such as a third party component or DOM element.

```tsx
"use client"
import {Pressable, DialogTrigger} from 'react-aria-components/Modal';
import {Modal} from 'vanilla-starter/Modal';
import {Dialog, Heading} from 'vanilla-starter/Dialog';
import {Button} from 'vanilla-starter/Button';

  {/*- begin highlight -*/}
  
    <span role="button">Custom trigger</span>
  
  {/*- end highlight -*/}
  
    
      <Heading slot="title">Dialog
      <p>This dialog was triggered by a custom button.</p>
      <Button slot="close">Close
    
  

```

<InlineAlert variant="notice">
  Accessibility
  Any `` child must have an [interactive ARIA role](https://www.w3.org/TR/wai-aria-1.2/#widget_roles) or use an appropriate semantic HTML element so that screen readers can announce the trigger. Trigger components must forward their `ref` and spread all props to a DOM element.

```tsx
const CustomTrigger = React.forwardRef((props, ref) => (
  <button {...props} ref={ref} />
));
```

## Examples

<ExampleList
  tag="modal"
  pages={props.pages}
/>

## API

```tsx

  
  
    
      
        <Heading slot="title" />
        <Button slot="close" />
      
    
  

```

### DialogTrigger

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `ReactNode` | — |  |
| `defaultOpen` | `boolean | undefined` | — | Whether the overlay is open by default (uncontrolled). |
| `isOpen` | `boolean | undefined` | — | Whether the overlay is open by default (controlled). |
| `onOpenChange` | `((isOpen: boolean) => void) | undefined` | — | Handler that is called when the overlay's open state changes. |

### Modal

### ModalOverlay

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-ModalOverlay' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultOpen` | `boolean | undefined` | — | Whether the overlay is open by default (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
| `inert` | `boolean | undefined` | — |  |
| `isDismissable` | `boolean | undefined` | false | Whether to close the modal when the user interacts outside it. |
| `isEntering` | `boolean | undefined` | — | Whether the modal is currently performing an entry animation. |
| `isExiting` | `boolean | undefined` | — | Whether the modal is currently performing an exit animation. |
| `isKeyboardDismissDisabled` | `boolean | undefined` | false | Whether pressing the escape key to close the modal should be disabled. |
| `isOpen` | `boolean | undefined` | — | Whether the overlay is open by default (controlled). |
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
| `onOpenChange` | `((isOpen: boolean) => void) | undefined` | — | Handler that is called when the overlay's open state changes. |
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
| `render` | `DOMRenderFunction<"div", ModalRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `shouldCloseOnInteractOutside` | `((element: Element) => boolean) | undefined` | — | When user interacts with the argument element outside of the overlay ref, return true if onClose should be called.  This gives you a chance to filter out interaction with elements that should not dismiss the overlay. By default, onClose will always be called on interaction outside the overlay ref. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: ModalRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 4)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `((opts: DialogRenderProps) => ReactNode) | React.ReactNode` | — | Children of the dialog. A function may be provided to access a function to close the dialog. |
| `className` | `string | undefined` | 'react-aria-Dialog' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
| `dir` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
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
| `onScrollCapture` | `React.UIEventHandler | undefined` | — |  |
| `onTouchCancel` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchCancelCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchEnd` | `React.TouchEventHandler | undefined` | — |  |

## API (part 5)

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
| `render` | `DOMRenderFunction<"section", undefined> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `role` | `"alertdialog" | "dialog" | undefined` | 'dialog' | The accessibility role for the dialog. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |

