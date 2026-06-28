# Toolbar

## Introduction

A toolbar is a container for a set of interactive controls, such as buttons, dropdown menus, or
checkboxes, with arrow key navigation.

## Vanilla CSS example

```tsx
import {Toolbar} from 'vanilla-starter/Toolbar';
import {ToggleButtonGroup} from 'vanilla-starter/ToggleButtonGroup';
import {ToggleButton} from 'vanilla-starter/ToggleButton';
import {Button} from 'vanilla-starter/Button';
import {Select, SelectItem} from 'vanilla-starter/Select';
import {Separator} from 'vanilla-starter/Separator';
import {Group} from 'react-aria-components/Group';
import {Bold, Italic, Underline, ClipboardCopy, Scissors, ClipboardPaste} from 'lucide-react';

  <ToggleButtonGroup aria-label="Style">
    <ToggleButton id="bold" aria-label="Bold">
      <Bold size={16} />
    
    <ToggleButton id="italic" aria-label="Italic">
      <Italic size={16} />
    
    <ToggleButton id="underline" aria-label="Underline">
      <Underline size={16} />
    
  
  
  <Group aria-label="Clipboard">
    <Button aria-label="Copy">
      <ClipboardCopy size={16} />
    
    <Button aria-label="Cut">
      <Scissors size={16} />
    
    <Button aria-label="Paste">
      <ClipboardPaste size={16} />
    
  
  
  <Select aria-label="Font" defaultSelectedKey="helvetica">
    <SelectItem id="helvetica">Helvetica
    <SelectItem id="times">Times
    <SelectItem id="comic-sans">Comic Sans
  

```

### Toolbar.tsx

```tsx
'use client';
import {Toolbar as RACToolbar, type ToolbarProps} from 'react-aria-components/Toolbar';
import {SeparatorContext} from 'react-aria-components/Separator';
import {ToggleButtonGroupContext} from 'react-aria-components/ToggleButtonGroup';
import './Toolbar.css';

export function Toolbar(props: ToolbarProps) {
  let {orientation = 'horizontal'} = props;
  return (
    <ToggleButtonGroupContext.Provider value={{orientation}}>
      <SeparatorContext.Provider
        value={{orientation: orientation === 'horizontal' ? 'vertical' : 'horizontal'}}>
        <RACToolbar {...props} />
      </SeparatorContext.Provider>
    </ToggleButtonGroupContext.Provider>
  );
}

```

### Toolbar.css

```css
@import './theme.css';

.react-aria-Toolbar {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: var(--spacing-1);
  width: fit-content;

  &[data-orientation='horizontal'] {
    flex-direction: row;
  }

  &[data-orientation='vertical'] {
    flex-direction: column;
    align-items: start;
  }

  .react-aria-Group {
    display: contents;
  }

  .react-aria-Separator {
    &[aria-orientation='vertical'] {
      height: auto;
      margin: 0px var(--spacing-1);
    }
  }
}

```

## Tailwind example

```tsx
import {Toolbar} from 'tailwind-starter/Toolbar';
import {ToggleButtonGroup} from 'tailwind-starter/ToggleButtonGroup';
import {ToggleButton} from 'tailwind-starter/ToggleButton';
import {Button} from 'tailwind-starter/Button';
import {Select, SelectItem} from 'tailwind-starter/Select';
import {Group} from 'react-aria-components/Group';
import {Bold, Italic, Underline, ClipboardCopy, Scissors, ClipboardPaste} from 'lucide-react';

  <ToggleButtonGroup selectionMode="multiple" aria-label="Style">
    <ToggleButton aria-label="Bold">
      <Bold size={16} />
    
    <ToggleButton aria-label="Italic">
      <Italic size={16} />
    
    <ToggleButton aria-label="Underline">
      <Underline size={16} />
    
  
  <Group aria-label="Clipboard" className="flex gap-1" style={{flexDirection: 'inherit'}}>
    <Button aria-label="Copy" variant="secondary">
      <ClipboardCopy size={16} />
    
    <Button aria-label="Cut" variant="secondary">
      <Scissors size={16} />
    
    <Button aria-label="Paste" variant="secondary">
      <ClipboardPaste size={16} />
    
  
  <Select aria-label="Font" defaultSelectedKey="helvetica">
    <SelectItem id="helvetica">Helvetica
    <SelectItem id="times">Times
    <SelectItem id="comic-sans">Comic Sans
  

```

### Toolbar.tsx

```tsx
'use client';
import React from 'react';
import {Toolbar as RACToolbar, type ToolbarProps} from 'react-aria-components/Toolbar';
import {ToggleButtonGroupContext} from 'react-aria-components/ToggleButtonGroup';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {tv} from 'tailwind-variants';

const styles = tv({
  base: 'flex flex-wrap gap-2',
  variants: {
    orientation: {
      horizontal: 'flex-row items-center',
      vertical: 'flex-col items-start'
    }
  }
});

export function Toolbar(props: ToolbarProps) {
  return (
    <ToggleButtonGroupContext.Provider value={{orientation: props.orientation}}>
      <RACToolbar
        {...props}
        className={composeRenderProps(props.className, (className, renderProps) =>
          styles({...renderProps, className})
        )}
      />
    </ToggleButtonGroupContext.Provider>
  );
}

```

## API

```tsx

  
  
    
  
  
  
    
  
  

```

### Toolbar

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Toolbar' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `dir` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
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
| `onTouchEndCapture` | `React.TouchEventHandler | undefined` | — |  |

## API (part 3)

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
| `orientation` | `Orientation | undefined` | 'horizontal' | The orientation of the entire toolbar. |
| `render` | `DOMRenderFunction<"div", ToolbarRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: ToolbarRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

