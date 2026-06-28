# Popover

## Introduction

A popover is an overlay element positioned relative to a trigger.

## Vanilla CSS example

```tsx
import {DialogTrigger} from 'react-aria-components/Popover';
import {Popover} from 'vanilla-starter/Popover';
import {Button} from 'vanilla-starter/Button';
import {Switch} from 'vanilla-starter/Switch';
import {Settings2} from 'lucide-react';

function Example(props) {
  return (
    
      <Button aria-label="Settings">
        <Settings2 size={20} />
      
      {/*- begin focus -*/}
      <Popover {...props}>
        <div style={{display: 'flex', flexDirection: 'column', gap: 12}}>
          <Switch defaultSelected>Wi-Fi
          <Switch defaultSelected>Bluetooth
          Mute
        </div>
      
      {/*- end focus -*/}
    
  );
}
```

### Popover.tsx

```tsx
'use client';
import {
  OverlayArrow,
  Popover as AriaPopover,
  type PopoverProps as AriaPopoverProps
} from 'react-aria-components/Popover';
import clsx from 'clsx';
import './Popover.css';

export interface PopoverProps extends Omit<AriaPopoverProps, 'children'> {
  children: React.ReactNode;
  hideArrow?: boolean;
}

export function Popover({children, hideArrow, ...props}: PopoverProps) {
  return (
    <AriaPopover {...props} className={clsx('react-aria-Popover', props.className)}>
      {({trigger}) => (
        <>
          {!hideArrow && trigger !== 'MenuTrigger' && trigger !== 'SubmenuTrigger' && (
            
              <svg width={12} height={12} viewBox="0 0 12 12">
                <path d="M0 0 L6 6 L12 0" />
              </svg>
            
          )}
          {children}
        </>
      )}
    
  );
}

```

### Popover.css

```css
@import './theme.css';

.react-aria-Popover {
  --background-color: var(--overlay-background);

  outline: 1px solid var(--overlay-border);
  box-sizing: border-box;
  filter: drop-shadow(var(--popover-shadow));
  border-radius: var(--radius-lg);
  background: var(--background-color);
  color: var(--text-color);
  transition:
    transform 200ms,
    opacity 200ms;
  font: var(--font-size) system-ui;
  padding: 8px;

  &[data-trigger='MenuTrigger'],
  &[data-trigger='SubmenuTrigger'] {
    padding: 0;
  }

  .react-aria-OverlayArrow svg {
    display: block;
    fill: var(--background-color);
    stroke: var(--overlay-border);
    paint-order: stroke;
    stroke-width: 2px;
  }

  &[data-entering],
  &[data-exiting] {
    transform: var(--origin);
    opacity: 0;
  }

  &[data-placement='top'] {
    --origin: translateY(8px);

    &:has(.react-aria-OverlayArrow) {
      margin-bottom: 6px;
    }
  }

  &[data-placement='bottom'] {
    --origin: translateY(-8px);

    &:has(.react-aria-OverlayArrow) {
      margin-top: 6px;
    }

    .react-aria-OverlayArrow svg {
      transform: rotate(180deg);
    }
  }

  &[data-placement='right'] {
    --origin: translateX(-8px);

    &:has(.react-aria-OverlayArrow) {
      margin-left: 6px;
    }

    .react-aria-OverlayArrow svg {
      transform: rotate(90deg);
    }
  }

  &[data-placement='left'] {
    --origin: translateX(8px);

    &:has(.react-aria-OverlayArrow) {
      margin-right: 6px;
    }

    .react-aria-OverlayArrow svg {
      transform: rotate(-90deg);
    }
  }
}

```

## Tailwind example

```tsx
import {DialogTrigger} from 'react-aria-components/Popover';
import {Popover} from 'tailwind-starter/Popover';
import {Button} from 'tailwind-starter/Button';
import {Switch} from 'tailwind-starter/Switch';
import {Settings2} from 'lucide-react';

function Example(props) {
  return (
    
      <Button aria-label="Settings" variant="secondary">
        <Settings2 size={20} />
      
      {/*- begin focus -*/}
      <Popover
        
        className="flex flex-col gap-2 p-4"
        showArrow
        {...props}>
        <Switch defaultSelected>Wi-Fi
        <Switch defaultSelected>Bluetooth
        Mute
      
      {/*- end focus -*/}
    
  );
}
```

### Popover.tsx

```tsx
'use client';
import {
  OverlayArrow,
  Popover as AriaPopover,
  type PopoverProps as AriaPopoverProps
} from 'react-aria-components/Popover';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import React from 'react';
import {tv} from 'tailwind-variants';

export interface PopoverProps extends Omit<AriaPopoverProps, 'children'> {
  showArrow?: boolean;
  children: React.ReactNode;
}

const styles = tv({
  base: 'font-sans bg-white dark:bg-neutral-900/70 dark:backdrop-blur-2xl dark:backdrop-saturate-200 forced-colors:bg-[Canvas] shadow-2xl rounded-xl bg-clip-padding border border-black/10 dark:border-white/10 text-neutral-700 dark:text-neutral-300 outline-0',
  variants: {
    isEntering: {
      true: 'animate-in fade-in placement-bottom:slide-in-from-top-1 placement-top:slide-in-from-bottom-1 placement-left:slide-in-from-right-1 placement-right:slide-in-from-left-1 ease-out duration-200'
    },
    isExiting: {
      true: 'animate-out fade-out placement-bottom:slide-out-to-top-1 placement-top:slide-out-to-bottom-1 placement-left:slide-out-to-right-1 placement-right:slide-out-to-left-1 ease-in duration-150'
    }
  }
});

export function Popover({children, showArrow, className, ...props}: PopoverProps) {
  let offset = showArrow ? 12 : 8;
  return (
    <AriaPopover
      offset={offset}
      {...props}
      className={composeRenderProps(className, (className, renderProps) =>
        styles({...renderProps, className})
      )}>
      {showArrow && (
        <OverlayArrow className="group">
          <svg
            width={12}
            height={12}
            viewBox="0 0 12 12"
            className="block fill-white dark:fill-[#1f1f21] forced-colors:fill-[Canvas] stroke-1 stroke-black/10 dark:stroke-neutral-700 forced-colors:stroke-[ButtonBorder] group-placement-bottom:rotate-180 group-placement-left:-rotate-90 group-placement-right:rotate-90">
            <path d="M0 0 L6 6 L12 0" />
          </svg>
        
      )}
      {children}
    
  );
}

```

## Custom trigger

`DialogTrigger` works with any pressable React Aria component (e.g. [Button](Button.md), [Link](Link.md), etc.). Use the `` component or [usePress](usePress.md) hook to wrap a custom trigger element such as a third party component or DOM element.

```tsx
"use client"
import {Pressable, DialogTrigger} from 'react-aria-components/Popover';
import {Popover} from 'vanilla-starter/Popover';

  {/*- begin highlight -*/}
  
    <span role="button">Custom trigger</span>
  
  {/*- end highlight -*/}
  <Popover style={{padding: 16}}>
    This popover was triggered by a custom button.
  

```

<InlineAlert variant="notice">
  Accessibility
  Any `` child must have an [interactive ARIA role](https://www.w3.org/TR/wai-aria-1.2/#widget_roles) or use an appropriate semantic HTML element so that screen readers can announce the trigger. Trigger components must forward their `ref` and spread all props to a DOM element.

```tsx
const CustomTrigger = React.forwardRef((props, ref) => (
  <button {...props} ref={ref} />
));
```

## Custom anchor

To position a popover relative to a different element than its trigger, use the `triggerRef` and `isOpen` props instead of ``. `onOpenChange` will be called when the user closes the popover.

```tsx
import {useState, useRef} from 'react';
import {Popover} from 'vanilla-starter/Popover';
import {Button} from 'vanilla-starter/Button';

function Example() {
  let [isOpen, setOpen] = useState(false);
  let triggerRef = useRef(null);

  return (
    <div>
      <Button onPress={() => setOpen(true)}>Trigger
      <span ref={triggerRef} style={{paddingLeft: 12}}>Popover will be positioned relative to me</span>
      <Popover
        style={{padding: 16}}
        /*- begin highlight -*/
        triggerRef={triggerRef}
        isOpen={isOpen}
        onOpenChange={setOpen}>
        {/*- end highlight -*/}
        I'm over here!
      
    </div>
  );
}
```

## Examples

<ExampleList
  tag="popover"
  pages={props.pages}
/>

## API

```tsx

  
  
    
  

```

### DialogTrigger

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `ReactNode` | — |  |
| `defaultOpen` | `boolean | undefined` | — | Whether the overlay is open by default (uncontrolled). |
| `isOpen` | `boolean | undefined` | — | Whether the overlay is open by default (controlled). |
| `onOpenChange` | `((isOpen: boolean) => void) | undefined` | — | Handler that is called when the overlay's open state changes. |

### Popover

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `arrowBoundaryOffset` | `number | undefined` | 0 | The minimum distance the arrow's edge should be from the edge of the overlay element. |
| `arrowRef` | `RefObject<Element | null> | undefined` | — | A ref for the popover arrow element. |
| `boundaryElement` | `Element | undefined` | document.body | Element that that serves as the positioning boundary. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Popover' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `containerPadding` | `number | undefined` | 12 | The placement padding that should be applied between the element and its surrounding container. |
| `crossOffset` | `number | undefined` | 0 | The additional offset applied along the cross axis between the element and its anchor element. |
| `defaultOpen` | `boolean | undefined` | — | Whether the overlay is open by default (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
| `inert` | `boolean | undefined` | — |  |
| `isEntering` | `boolean | undefined` | — | Whether the popover is currently performing an entry animation. |
| `isExiting` | `boolean | undefined` | — | Whether the popover is currently performing an exit animation. |
| `isKeyboardDismissDisabled` | `boolean | undefined` | false | Whether pressing the escape key to close the popover should be disabled. Most popovers should not use this option. When set to true, an alternative way to close the popover with a keyboard must be provided. |
| `isNonModal` | `boolean | undefined` | — | Whether the popover is non-modal, i.e. elements outside the popover may be interacted with by assistive technologies. Most popovers should not use this option as it may negatively impact the screen reader experience. Only use with components such as combobox, which are designed to handle this situation carefully. |
| `isOpen` | `boolean | undefined` | — | Whether the overlay is open by default (controlled). |
| `lang` | `string | undefined` | — |  |
| `maxHeight` | `number | undefined` | — | The maxHeight specified for the overlay element. By default, it will take all space up to the current viewport height. |
| `offset` | `number | undefined` | 8 | The additional offset applied along the main axis between the element and its anchor element. |
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

## API (part 3)

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
| `placement` | `Placement | undefined` | 'bottom' | The placement of the element with respect to its anchor element. |
| `render` | `DOMRenderFunction<"div", PopoverRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `scrollRef` | `RefObject<Element | null> | undefined` | overlayRef | A ref for the scrollable region within the overlay. |
| `shouldCloseOnInteractOutside` | `((element: Element) => boolean) | undefined` | — | When user interacts with the argument element outside of the popover ref, return true if onClose should be called. This gives you a chance to filter out interaction with elements that should not dismiss the popover. By default, onClose will always be called on interaction outside the popover ref. |
| `shouldFlip` | `boolean | undefined` | true | Whether the element should flip its orientation (e.g. top to bottom or left to right) when there is insufficient room for it to render completely. |

## API (part 4)

| `shouldUpdatePosition` | `boolean | undefined` | true | Whether the overlay should update its position automatically. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: PopoverRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `trigger` | `string | undefined` | — | The name of the component that triggered the popover. This is reflected on the element as the `data-trigger` attribute, and can be used to provide specific styles for the popover depending on which element triggered it. |
| `triggerRef` | `RefObject<Element | null> | undefined` | — | The ref for the element which the popover positions itself with respect to. When used within a trigger component such as DialogTrigger, MenuTrigger, Select, etc., this is set automatically. It is only required when used standalone. |

## API (part 6)

| `aria-live` | `"assertive" | "off" | "polite" | undefined` | — | Indicates that an element will be updated, and describes the types of updates the user agents, assistive technologies, and user can expect from the live region. |
| `aria-modal` | `(boolean | "true" | "false") | undefined` | — | Indicates whether an element is modal when displayed. |
| `aria-multiline` | `(boolean | "true" | "false") | undefined` | — | Indicates whether a text box accepts multiple lines of input or only a single line. |
| `aria-multiselectable` | `(boolean | "true" | "false") | undefined` | — | Indicates that the user may select more than one item from the current selectable descendants. |
| `aria-orientation` | `"horizontal" | "vertical" | undefined` | — | Indicates whether the element's orientation is horizontal, vertical, or unknown/ambiguous. |
| `aria-owns` | `string | undefined` | — | Identifies an element (or elements) in order to define a visual, functional, or contextual parent/child relationship between DOM elements where the DOM hierarchy cannot be used to represent the relationship. |
| `aria-placeholder` | `string | undefined` | — | Defines a short hint (a word or short phrase) intended to aid the user with data entry when the control has no value. A hint could be a sample value or a brief description of the expected format. |
| `aria-posinset` | `number | undefined` | — | Defines an element's number or position in the current set of listitems or treeitems. Not required if all elements in the set are present in the DOM. |
| `aria-pressed` | `boolean | "true" | "false" | "mixed" | undefined` | — | Indicates the current "pressed" state of toggle buttons. |
| `aria-readonly` | `(boolean | "true" | "false") | undefined` | — | Indicates that the element is not editable, but is otherwise operable. |
| `aria-relevant` | `"additions" | "additions removals" | "additions text" | "all" | "removals" | "removals additions" | "removals text" | "text" | "text additions" | "text removals" | undefined` | — | Indicates what notifications the user agent will trigger when the accessibility tree within a live region is modified. |
| `aria-required` | `(boolean | "true" | "false") | undefined` | — | Indicates that user input is required on the element before a form may be submitted. |
| `aria-roledescription` | `string | undefined` | — | Defines a human-readable, author-localized description for the role of an element. |
| `aria-rowcount` | `number | undefined` | — | Defines the total number of rows in a table, grid, or treegrid. |
| `aria-rowindex` | `number | undefined` | — | Defines an element's row index or position with respect to the total number of rows within a table, grid, or treegrid. |
| `aria-rowindextext` | `string | undefined` | — | Defines a human readable text alternative of aria-rowindex. |
| `aria-rowspan` | `number | undefined` | — | Defines the number of rows spanned by a cell or gridcell within a table, grid, or treegrid. |
| `aria-selected` | `(boolean | "true" | "false") | undefined` | — | Indicates the current "selected" state of various widgets. |
| `aria-setsize` | `number | undefined` | — | Defines the number of items in the current set of listitems or treeitems. Not required if all elements in the set are present in the DOM. |
| `aria-sort` | `"ascending" | "descending" | "none" | "other" | undefined` | — | Indicates if items in a table or grid are sorted in ascending or descending order. |
| `aria-valuemax` | `number | undefined` | — | Defines the maximum allowed value for a range widget. |
| `aria-valuemin` | `number | undefined` | — | Defines the minimum allowed value for a range widget. |
| `aria-valuenow` | `number | undefined` | — | Defines the current value for a range widget. |
| `aria-valuetext` | `string | undefined` | — | Defines the human readable text alternative of aria-valuenow for a range widget. |
| `autoCapitalize` | `"characters" | "none" | "off" | "on" | "sentences" | "words" | (string & {}) | undefined` | — |  |
| `autoCorrect` | `string | undefined` | — |  |
| `autoFocus` | `boolean | undefined` | — |  |
| `autoSave` | `string | undefined` | — |  |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-OverlayArrow' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `color` | `string | undefined` | — |  |
| `content` | `string | undefined` | — |  |
| `contentEditable` | `"inherit" | "plaintext-only" | (boolean | "true" | "false") | undefined` | — |  |

## API (part 7)

| `contextMenu` | `string | undefined` | — |  |
| `dangerouslySetInnerHTML` | `{ __html: string | TrustedHTML; } | undefined` | — |  |
| `datatype` | `string | undefined` | — |  |
| `defaultChecked` | `boolean | undefined` | — |  |
| `defaultValue` | `number | string | readonly string[] | undefined` | — |  |
| `dir` | `string | undefined` | — |  |
| `draggable` | `(boolean | "true" | "false") | undefined` | — |  |
| `enterKeyHint` | `"done" | "enter" | "go" | "next" | "previous" | "search" | "send" | undefined` | — |  |
| `exportparts` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — |  |
| `inert` | `boolean | undefined` | — |  |
| `inlist` | `any` | — |  |
| `inputMode` | `"decimal" | "email" | "none" | "numeric" | "search" | "tel" | "text" | "url" | undefined` | — | Hints at the type of data that might be entered by the user while editing the element or its contents |
| `is` | `string | undefined` | — | Specify that a standard HTML element should behave like a defined custom built-in element |
| `itemID` | `string | undefined` | — |  |
| `itemProp` | `string | undefined` | — |  |
| `itemRef` | `string | undefined` | — |  |
| `itemScope` | `boolean | undefined` | — |  |
| `itemType` | `string | undefined` | — |  |
| `lang` | `string | undefined` | — |  |
| `nonce` | `string | undefined` | — |  |
| `onAbort` | `React.ReactEventHandler | undefined` | — |  |
| `onAbortCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onAnimationEnd` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationEndCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIteration` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIterationCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStart` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStartCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAuxClick` | `React.MouseEventHandler | undefined` | — |  |
| `onAuxClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onBeforeInput` | `React.InputEventHandler | undefined` | — |  |
| `onBeforeInputCapture` | `React.FormEventHandler | undefined` | — |  |
| `onBeforeToggle` | `React.ToggleEventHandler | undefined` | — |  |
| `onBlur` | `React.FocusEventHandler | undefined` | — |  |
| `onBlurCapture` | `React.FocusEventHandler | undefined` | — |  |
| `onCanPlay` | `React.ReactEventHandler | undefined` | — |  |
| `onCanPlayCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onCanPlayThrough` | `React.ReactEventHandler | undefined` | — |  |
| `onCanPlayThroughCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onChange` | `React.FormEventHandler | undefined` | — |  |
| `onChangeCapture` | `React.FormEventHandler | undefined` | — |  |
| `onClick` | `React.MouseEventHandler | undefined` | — |  |
| `onClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onCompositionEnd` | `React.CompositionEventHandler | undefined` | — |  |
| `onCompositionEndCapture` | `React.CompositionEventHandler | undefined` | — |  |
| `onCompositionStart` | `React.CompositionEventHandler | undefined` | — |  |
| `onCompositionStartCapture` | `React.CompositionEventHandler | undefined` | — |  |
| `onCompositionUpdate` | `React.CompositionEventHandler | undefined` | — |  |
| `onCompositionUpdateCapture` | `React.CompositionEventHandler | undefined` | — |  |
| `onContextMenu` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenuCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onCopy` | `React.ClipboardEventHandler | undefined` | — |  |
| `onCopyCapture` | `React.ClipboardEventHandler | undefined` | — |  |
| `onCut` | `React.ClipboardEventHandler | undefined` | — |  |
| `onCutCapture` | `React.ClipboardEventHandler | undefined` | — |  |
| `onDoubleClick` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onDrag` | `React.DragEventHandler | undefined` | — |  |
| `onDragCapture` | `React.DragEventHandler | undefined` | — |  |
| `onDragEnd` | `React.DragEventHandler | undefined` | — |  |
| `onDragEndCapture` | `React.DragEventHandler | undefined` | — |  |
| `onDragEnter` | `React.DragEventHandler | undefined` | — |  |
| `onDragEnterCapture` | `React.DragEventHandler | undefined` | — |  |
| `onDragExit` | `React.DragEventHandler | undefined` | — |  |
| `onDragExitCapture` | `React.DragEventHandler | undefined` | — |  |
| `onDragLeave` | `React.DragEventHandler | undefined` | — |  |
| `onDragLeaveCapture` | `React.DragEventHandler | undefined` | — |  |

## API (part 8)

| `onDragOver` | `React.DragEventHandler | undefined` | — |  |
| `onDragOverCapture` | `React.DragEventHandler | undefined` | — |  |
| `onDragStart` | `React.DragEventHandler | undefined` | — |  |
| `onDragStartCapture` | `React.DragEventHandler | undefined` | — |  |
| `onDrop` | `React.DragEventHandler | undefined` | — |  |
| `onDropCapture` | `React.DragEventHandler | undefined` | — |  |
| `onDurationChange` | `React.ReactEventHandler | undefined` | — |  |
| `onDurationChangeCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onEmptied` | `React.ReactEventHandler | undefined` | — |  |
| `onEmptiedCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onEncrypted` | `React.ReactEventHandler | undefined` | — |  |
| `onEncryptedCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onEnded` | `React.ReactEventHandler | undefined` | — |  |
| `onEndedCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onError` | `React.ReactEventHandler | undefined` | — |  |
| `onErrorCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onFocus` | `React.FocusEventHandler | undefined` | — |  |
| `onFocusCapture` | `React.FocusEventHandler | undefined` | — |  |
| `onGotPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onGotPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onInput` | `React.FormEventHandler | undefined` | — |  |
| `onInputCapture` | `React.FormEventHandler | undefined` | — |  |
| `onInvalid` | `React.FormEventHandler | undefined` | — |  |
| `onInvalidCapture` | `React.FormEventHandler | undefined` | — |  |
| `onKeyDown` | `React.KeyboardEventHandler | undefined` | — |  |
| `onKeyDownCapture` | `React.KeyboardEventHandler | undefined` | — |  |
| `onKeyUp` | `React.KeyboardEventHandler | undefined` | — |  |
| `onKeyUpCapture` | `React.KeyboardEventHandler | undefined` | — |  |
| `onLoad` | `React.ReactEventHandler | undefined` | — |  |
| `onLoadCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onLoadedData` | `React.ReactEventHandler | undefined` | — |  |
| `onLoadedDataCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onLoadedMetadata` | `React.ReactEventHandler | undefined` | — |  |
| `onLoadedMetadataCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onLoadStart` | `React.ReactEventHandler | undefined` | — |  |
| `onLoadStartCapture` | `React.ReactEventHandler | undefined` | — |  |
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
| `onPaste` | `React.ClipboardEventHandler | undefined` | — |  |
| `onPasteCapture` | `React.ClipboardEventHandler | undefined` | — |  |
| `onPause` | `React.ReactEventHandler | undefined` | — |  |
| `onPauseCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onPlay` | `React.ReactEventHandler | undefined` | — |  |
| `onPlayCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onPlaying` | `React.ReactEventHandler | undefined` | — |  |
| `onPlayingCapture` | `React.ReactEventHandler | undefined` | — |  |
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

## API (part 9)

| `onPointerOver` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOverCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerUp` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerUpCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onProgress` | `React.ReactEventHandler | undefined` | — |  |
| `onProgressCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onRateChange` | `React.ReactEventHandler | undefined` | — |  |
| `onRateChangeCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onReset` | `React.FormEventHandler | undefined` | — |  |
| `onResetCapture` | `React.FormEventHandler | undefined` | — |  |
| `onScroll` | `React.UIEventHandler | undefined` | — |  |
| `onScrollCapture` | `React.UIEventHandler | undefined` | — |  |
| `onScrollEnd` | `React.UIEventHandler | undefined` | — |  |
| `onScrollEndCapture` | `React.UIEventHandler | undefined` | — |  |
| `onSeeked` | `React.ReactEventHandler | undefined` | — |  |
| `onSeekedCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onSeeking` | `React.ReactEventHandler | undefined` | — |  |
| `onSeekingCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onSelect` | `React.ReactEventHandler | undefined` | — |  |
| `onSelectCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onStalled` | `React.ReactEventHandler | undefined` | — |  |
| `onStalledCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onSubmit` | `React.FormEventHandler | undefined` | — |  |
| `onSubmitCapture` | `React.FormEventHandler | undefined` | — |  |
| `onSuspend` | `React.ReactEventHandler | undefined` | — |  |
| `onSuspendCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onTimeUpdate` | `React.ReactEventHandler | undefined` | — |  |
| `onTimeUpdateCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onToggle` | `React.ToggleEventHandler | undefined` | — |  |
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
| `onVolumeChange` | `React.ReactEventHandler | undefined` | — |  |
| `onVolumeChangeCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onWaiting` | `React.ReactEventHandler | undefined` | — |  |
| `onWaitingCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onWheel` | `React.WheelEventHandler | undefined` | — |  |
| `onWheelCapture` | `React.WheelEventHandler | undefined` | — |  |
| `part` | `string | undefined` | — |  |
| `popover` | `"" | "auto" | "manual" | undefined` | — |  |
| `popoverTarget` | `string | undefined` | — |  |
| `popoverTargetAction` | `"hide" | "show" | "toggle" | undefined` | — |  |
| `prefix` | `string | undefined` | — |  |
| `property` | `string | undefined` | — |  |
| `radioGroup` | `string | undefined` | — |  |
| `rel` | `string | undefined` | — |  |
| `render` | `DOMRenderFunction<"div", OverlayArrowRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `resource` | `string | undefined` | — |  |
| `results` | `number | undefined` | — |  |
| `rev` | `string | undefined` | — |  |
| `role` | `React.AriaRole | undefined` | — |  |

## API (part 10)

| `security` | `string | undefined` | — |  |
| `slot` | `string | undefined` | — |  |
| `spellCheck` | `(boolean | "true" | "false") | undefined` | — |  |
| `style` | `(((values: OverlayArrowRenderProps & { defaultStyle: CSSProperties; }) => CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `suppressContentEditableWarning` | `boolean | undefined` | — |  |
| `suppressHydrationWarning` | `boolean | undefined` | — |  |
| `tabIndex` | `number | undefined` | — |  |
| `title` | `string | undefined` | — |  |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `typeof` | `string | undefined` | — |  |
| `unselectable` | `"off" | "on" | undefined` | — |  |
| `vocab` | `string | undefined` | — |  |

