# VisuallyHidden

## Introduction

VisuallyHidden hides its children visually, while keeping content visible
to screen readers.

```tsx
import {VisuallyHidden} from 'react-aria/VisuallyHidden';

I am hidden
```

<InlineAlert variant="notice">
  Positioning
  VisuallyHidden is positioned absolutely, so it must have a `position: relative` or `position: absolute` ancestor. Otherwise, undesired scrollbars may appear.

## API

### VisuallyHidden

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-activedescendant` | `string | undefined` | — | Identifies the currently active element when DOM focus is on a composite widget, textbox, group, or application. |
| `aria-atomic` | `(boolean | "true" | "false") | undefined` | — | Indicates whether assistive technologies will present all, or only parts of, the changed region based on the change notifications defined by the aria-relevant attribute. |
| `aria-autocomplete` | `"both" | "inline" | "list" | "none" | undefined` | — | Indicates whether inputting text could trigger display of one or more predictions of the user's intended value for an input and specifies how predictions would be presented if they are made. |
| `aria-braillelabel` | `string | undefined` | — | Indicates an element is being modified and that assistive technologies MAY want to wait until the modifications are complete before exposing them to the user. |
| `aria-brailleroledescription` | `string | undefined` | — | Defines a human-readable, author-localized abbreviated description for the role of an element, which is intended to be converted into Braille. |
| `aria-busy` | `(boolean | "true" | "false") | undefined` | — |  |
| `aria-checked` | `boolean | "true" | "false" | "mixed" | undefined` | — | Indicates the current "checked" state of checkboxes, radio buttons, and other widgets. |
| `aria-colcount` | `number | undefined` | — | Defines the total number of columns in a table, grid, or treegrid. |
| `aria-colindex` | `number | undefined` | — | Defines an element's column index or position with respect to the total number of columns within a table, grid, or treegrid. |
| `aria-colindextext` | `string | undefined` | — | Defines a human readable text alternative of aria-colindex. |
| `aria-colspan` | `number | undefined` | — | Defines the number of columns spanned by a cell or gridcell within a table, grid, or treegrid. |
| `aria-controls` | `string | undefined` | — | Identifies the element (or elements) whose contents or presence are controlled by the current element. |
| `aria-current` | `boolean | "true" | "false" | "date" | "location" | "page" | "step" | "time" | undefined` | — | Indicates the element that represents the current item within a container or set of related elements. |
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-description` | `string | undefined` | — | Defines a string value that describes or annotates the current element. |
| `aria-details` | `string | undefined` | — | Identifies the element that provides a detailed, extended description for the object. |
| `aria-disabled` | `(boolean | "true" | "false") | undefined` | — | Indicates that the element is perceivable but disabled, so it is not editable or otherwise operable. |
| `aria-errormessage` | `string | undefined` | — | Identifies the element that provides an error message for the object. |
| `aria-expanded` | `(boolean | "true" | "false") | undefined` | — | Indicates whether the element, or another grouping element it controls, is currently expanded or collapsed. |
| `aria-flowto` | `string | undefined` | — | Identifies the next element (or elements) in an alternate reading order of content which, at the user's discretion, allows assistive technology to override the general default of reading in document source order. |
| `aria-haspopup` | `boolean | "true" | "false" | "dialog" | "grid" | "listbox" | "menu" | "tree" | undefined` | — | Indicates the availability and type of interactive popup element, such as menu or dialog, that can be triggered by an element. |
| `aria-hidden` | `(boolean | "true" | "false") | undefined` | — | Indicates whether the element is exposed to an accessibility API. |
| `aria-invalid` | `boolean | "true" | "false" | "grammar" | "spelling" | undefined` | — | Indicates the entered value does not conform to the format expected by the application. |
| `aria-keyshortcuts` | `string | undefined` | — | Indicates keyboard shortcuts that an author has implemented to activate or give focus to an element. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `aria-level` | `number | undefined` | — | Defines the hierarchical level of an element within a structure. |
| `aria-live` | `"assertive" | "off" | "polite" | undefined` | — | Indicates that an element will be updated, and describes the types of updates the user agents, assistive technologies, and user can expect from the live region. |

## API (part 3)

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
| `children` | `React.ReactNode` | — | The content to visually hide. |
| `className` | `string | undefined` | — |  |
| `dangerouslySetInnerHTML` | `{ __html: string | TrustedHTML; } | undefined` | — |  |
| `elementType` | `string | React.JSXElementConstructor<any> | undefined` | 'div' | The element type for the container. |
| `id` | `string | undefined` | — |  |
| `isFocusable` | `boolean | undefined` | — | Whether the element should become visible on focus, for example skip links. |
| `onAbort` | `React.ReactEventHandler | undefined` | — |  |
| `onAbortCapture` | `React.ReactEventHandler | undefined` | — |  |
| `onAnimationEnd` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationEndCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIteration` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIterationCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStart` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStartCapture` | `React.AnimationEventHandler | undefined` | — |  |

## API (part 4)

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

## API (part 5)

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

## API (part 6)

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
| `role` | `React.AriaRole | undefined` | — |  |
| `style` | `React.CSSProperties | undefined` | — |  |
| `tabIndex` | `number | undefined` | — |  |

## API (part 7)

### useVisuallyHidden

For additional rendering flexibility, use the `useVisuallyHidden` hook . It supports the same
options as the component, and returns props to spread onto the element that should be hidden.

<FunctionAPI
  links={docs.links}
  function={docs.exports.useVisuallyHidden}
/>

