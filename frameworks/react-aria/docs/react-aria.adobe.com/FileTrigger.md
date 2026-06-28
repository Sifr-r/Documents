# FileTrigger

## Introduction

A FileTrigger allows a user to access the file system with any pressable React Aria or React
Spectrum component, or custom components built with usePress.

```tsx
import {FileTrigger} from 'react-aria-components/FileTrigger';
import {Button} from 'vanilla-starter/Button';
import {useState} from 'react';

function Example(props) {
  let [files, setFiles] = useState<string[]>([]);

  return (
    <>
      {/*- begin focus -*/}
      <FileTrigger
        {...props}
        
        onSelect={(e) => {
          let files = e ? Array.from(e) : [];
          let filenames = files.map((file) => file.name);
          setFiles(filenames);
        }}>
        Select a file
      
      {/*- end focus -*/}
      {files.join(', ')}
    </>
  );
}
```

## Custom trigger

`FileTrigger` works with any pressable React Aria component (e.g. [Button](Button.md), [Link](Link.md), etc.). Use the `` component or [usePress](usePress.md) hook to wrap a custom trigger element such as a third party component or DOM element.

```tsx
"use client"
import {Pressable, FileTrigger} from 'react-aria-components/FileTrigger';

  {/*- begin highlight -*/}
  
    <span role="button">Custom trigger</span>
  
  {/*- end highlight -*/}

```

<InlineAlert variant="notice">
  Accessibility
  Any `` child must have an [interactive ARIA role](https://www.w3.org/TR/wai-aria-1.2/#widget_roles) or use an appropriate semantic HTML element so that screen readers can announce the trigger. Trigger components must forward their `ref` and spread all props to a DOM element.

```tsx
const CustomTrigger = React.forwardRef((props, ref) => (
  <button {...props} ref={ref} />
));
```

## API

```tsx

  

```

### FileTrigger

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `acceptDirectory` | `boolean | undefined` | — | Enables the selection of directories instead of individual files. |
| `acceptedFileTypes` | `readonly string[] | undefined` | — | Specifies what mime type of files are allowed. |
| `allowsMultiple` | `boolean | undefined` | — | Whether multiple files can be selected. |
| `children` | `React.ReactNode` | — | The children of the component. |
| `defaultCamera` | `"environment" | "user" | undefined` | — | Specifies the use of a media capture mechanism to capture the media on the spot. |
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
| `onSelect` | `((files: FileList | null) => void) | undefined` | — | Handler when a user selects a file. |
| `onTouchCancel` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchCancelCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchEnd` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchEndCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchMove` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchMoveCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchStart` | `React.TouchEventHandler | undefined` | — |  |

## API (part 3)

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
| `translate` | `"no" | "yes" | undefined` | — |  |

