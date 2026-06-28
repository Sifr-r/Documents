# TagGroup

## Introduction

A tag group is a focusable list of labels, categories, keywords, filters, or other items, with
support for keyboard navigation, selection, and removal.

## Vanilla CSS example

```tsx
import {TagGroup, Tag} from 'vanilla-starter/TagGroup';

  News
  Travel
  Gaming
  Shopping

```

### TagGroup.tsx

```tsx
'use client';
import {
  Button,
  Tag as AriaTag,
  TagGroup as AriaTagGroup,
  type TagGroupProps as AriaTagGroupProps,
  TagList,
  type TagListProps,
  type TagProps
} from 'react-aria-components/TagGroup';
import {Description, Label} from './Form';
import {Text} from './Content';
import {X} from 'lucide-react';
import './TagGroup.css';

export interface TagGroupProps
  extends
    Omit<AriaTagGroupProps, 'children'>,
    Pick<TagListProps, 'items' | 'children' | 'renderEmptyState'> {
  label?: string;
  description?: string;
  errorMessage?: string;
}

export function TagGroup({
  label,
  description,
  errorMessage,
  items,
  children,
  renderEmptyState,
  ...props
}: TagGroupProps) {
  return (
    <AriaTagGroup {...props}>
      {label && {label}}
      <TagList items={items} renderEmptyState={renderEmptyState}>
        {children}
      
      {description && {description}}
      {errorMessage && <Text slot="errorMessage">{errorMessage}}
    
  );
}

export function Tag({
  children,
  ...props
}: Omit<TagProps, 'children'> & {
  children?: React.ReactNode;
}) {
  let textValue = typeof children === 'string' ? children : undefined;
  return (
    <AriaTag textValue={textValue} {...props} className="react-aria-Tag button-base">
      {({allowsRemoving}) => (
        <>
          {children}
          {allowsRemoving && (
            <Button slot="remove" className="remove-button">
              
            
          )}
        </>
      )}
    
  );
}

```

### TagGroup.css

```css
@import './theme.css';
@import './utilities.css';

.react-aria-TagGroup {
  display: flex;
  flex-direction: column;
  font: var(--font-size) system-ui;
  color: var(--text-color);

  [slot='errorMessage'] {
    margin-top: var(--spacing);
    font-size: var(--font-size-sm);
    color: var(--invalid-color);
  }
}

.react-aria-TagList {
  display: flex;
  flex-wrap: wrap;
  gap: var(--spacing-2);
}

.react-aria-Tag {
  --button-color: var(--gray);
  --button-gradient-size: 4px;
  text-shadow: none;
  forced-color-adjust: none;
  border-radius: 9999px;
  height: var(--spacing-5);
  padding: 0 var(--spacing-3);
  font: var(--font-size-sm) system-ui;
  cursor: default;
  display: flex;
  align-items: center;
  gap: var(--spacing-1);
  transition-property: scale, background, border-color, box-shadow, text-shadow;
  transition-duration: 200ms;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-tap-highlight-color: transparent;

  &:has(.remove-button) {
    padding: 0 var(--spacing-1) 0 var(--spacing-2);
  }

  &[data-pressed] {
    scale: 0.96;
  }

  &[data-selected] {
    --button-color: var(--tint);
  }

  &[data-href] {
    text-decoration: none;
    cursor: pointer;
  }

## Vanilla CSS example (part 2)

.remove-button {
    background: none;
    border: none;
    padding: 0;
    color: var(--gray-1000);
    transition: color 200ms;
    outline: none;
    border-radius: 100%;
    aspect-ratio: 1/1;
    height: calc(100% - 4px);
    display: flex;
    align-items: center;
    justify-content: center;
    transition-property: background, color, scale;
    transition-duration: 200ms;

    svg {
      width: calc(100% - 2px);
      height: calc(100% - 2px);
    }

    &:where([data-hovered], [data-pressed]) {
      background: var(--gray-300);
      color: var(--gray-1200);
    }

    @media (forced-colors: active) {
      background: ButtonFace;
      color: ButtonText;
    }

    &[data-pressed] {
      scale: 0.9;
    }

    &[data-focus-visible] {
      outline: 2px solid var(--focus-ring-color);
      outline-offset: -1px;
    }
  }

  &[data-selected] {
    .remove-button {
      color: inherit;
      &[data-hovered] {
        background: rgb(255 255 255 / 0.2);
      }
    }
  }
}

```

## Tailwind example

```tsx
import {TagGroup, Tag} from 'tailwind-starter/TagGroup';

  News
  Travel
  Gaming
  Shopping

```

### TagGroup.tsx

```tsx
'use client';
import {XIcon} from 'lucide-react';
import React, {createContext, useContext} from 'react';
import {
  Tag as AriaTag,
  TagGroup as AriaTagGroup,
  type TagGroupProps as AriaTagGroupProps,
  type TagProps as AriaTagProps,
  Button,
  TagList,
  type TagListProps,
  Text
} from 'react-aria-components/TagGroup';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {twMerge} from 'tailwind-merge';
import {tv} from 'tailwind-variants';
import {Description, Label} from './Field';
import {focusRing} from './utils';

const colors = {
  gray: 'bg-white text-neutral-600 border-neutral-200 hover:border-neutral-300 dark:bg-neutral-900 dark:text-neutral-300 dark:border-neutral-600 dark:hover:border-neutral-500',
  green:
    'bg-green-100 text-green-700 border-green-200 hover:border-green-300 dark:bg-green-300/20 dark:text-green-400 dark:border-green-300/10 dark:hover:border-green-300/20',
  yellow:
    'bg-yellow-100 text-yellow-700 border-yellow-200 hover:border-yellow-300 dark:bg-yellow-300/20 dark:text-yellow-400 dark:border-yellow-300/10 dark:hover:border-yellow-300/20',
  blue: 'bg-blue-100 text-blue-700 border-blue-200 hover:border-blue-300 dark:bg-blue-400/20 dark:text-blue-300 dark:border-blue-400/10 dark:hover:border-blue-400/20'
};

type Color = keyof typeof colors;
const ColorContext = createContext('gray');

const tagStyles = tv({
  extend: focusRing,
  base: 'transition cursor-default text-xs rounded-full border px-3 py-0.5 flex items-center max-w-fit gap-1 font-sans [-webkit-tap-highlight-color:transparent]',
  variants: {
    color: {
      gray: '',
      green: '',
      yellow: '',
      blue: ''
    },
    allowsRemoving: {
      true: 'pr-1'
    },
    isSelected: {
      true: 'bg-blue-600 text-white border-transparent forced-colors:bg-[Highlight] forced-colors:text-[HighlightText] forced-color-adjust-none'
    },
    isDisabled: {
      true: 'bg-neutral-100 dark:bg-transparent dark:border-white/20 text-neutral-300 dark:text-neutral-600 forced-colors:text-[GrayText]'
    }
  },
  compoundVariants: (Object.keys(colors) as Color[]).map(color => ({
    isSelected: false,
    isDisabled: false,
    color,
    class: colors[color]
  }))
});

export interface TagGroupProps
  extends
    Omit<AriaTagGroupProps, 'children'>,
    Pick<TagListProps, 'items' | 'children' | 'renderEmptyState'> {
  color?: Color;
  label?: string;
  description?: string;
  errorMessage?: string;
}

export interface TagProps extends AriaTagProps {
  color?: Color;
}

## Tailwind example (part 2)

export function TagGroup({
  label,
  description,
  errorMessage,
  items,
  children,
  renderEmptyState,
  ...props
}: TagGroupProps) {
  return (
    <AriaTagGroup {...props} className={twMerge('flex flex-col gap-2 font-sans', props.className)}>
      {label}
      <ColorContext.Provider value={props.color || 'gray'}>
        <TagList items={items} renderEmptyState={renderEmptyState} className="flex flex-wrap gap-1">
          {children}
        
      </ColorContext.Provider>
      {description && {description}}
      {errorMessage && (
        <Text slot="errorMessage" className="text-sm text-red-600">
          {errorMessage}
        
      )}
    
  );
}

const removeButtonStyles = tv({
  extend: focusRing,
  base: 'cursor-default rounded-full transition-[background-color] p-0.5 flex items-center justify-center bg-transparent text-[inherit] border-0 hover:bg-black/10 dark:hover:bg-white/10 pressed:bg-black/20 dark:pressed:bg-white/20'
});

export function Tag({children, color, ...props}: TagProps) {
  let textValue = typeof children === 'string' ? children : undefined;
  let groupColor = useContext(ColorContext);
  return (
    <AriaTag
      textValue={textValue}
      {...props}
      className={composeRenderProps(props.className, (className, renderProps) =>
        tagStyles({...renderProps, className, color: color || groupColor})
      )}>
      {composeRenderProps(children, (children, {allowsRemoving}) => (
        <>
          {children}
          {allowsRemoving && (
            <Button slot="remove" className={removeButtonStyles}>
              <XIcon aria-hidden className="w-3 h-3" />
            
          )}
        </>
      ))}
    
  );
}

```

## Content

`TagGroup` follows the [Collection Components API](collections.md?component=TagGroup), accepting both static and dynamic collections. This example shows a dynamic collection, passing a list of objects to the `items` prop, and a function to render the children. Items can be removed via the `onRemove` event.

```tsx
import {TagGroup, Tag} from 'vanilla-starter/TagGroup';
import {useListData} from 'react-aria-components/useListData';

function Example() {
  let list = useListData({
    initialItems: [
      { id: 1, name: 'News' },
      { id: 2, name: 'Travel' },
      { id: 3, name: 'Gaming' },
      { id: 4, name: 'Shopping' }
    ]
  });

  return (
    <TagGroup
      label="Categories"
      /*- begin highlight -*/
      items={list.items}
      onRemove={(keys) => list.remove(...keys)}
      renderEmptyState={() => <div>No categories</div>}>
      {/*- end highlight -*/}
      {(item) => {item.name}}
    
  );
}
```

### Links

Use the `href` prop on a `` to create a link.

```tsx
import {TagGroup, Tag} from 'vanilla-starter/TagGroup';

<TagGroup label="Photo categories">
  {/*- begin highlight -*/}
  <Tag href="https://en.wikipedia.org/wiki/Landscape_photography" target="_blank">Landscape
  {/*- end highlight -*/}
  <Tag href="https://en.wikipedia.org/wiki/Portrait_photography" target="_blank">Portrait
  <Tag href="https://en.wikipedia.org/wiki/Macro_photography" target="_blank">Macro
  <Tag href="https://en.wikipedia.org/wiki/Night_photography" target="_blank">Night
  <Tag href="https://en.wikipedia.org/wiki/Dualphotography" target="_blank">Dual
  <Tag href="https://en.wikipedia.org/wiki/Golden_hour_(photography)" target="_blank">Golden Hour

```

<InlineAlert variant="notice">
  Client-side routing
  Due to [HTML spec limitations](https://github.com/w3c/html-aria/issues/473), tags cannot be rendered as `<a>` elements. React Aria handles link clicks with JavaScript and triggers native navigation. When using a client-side router, use the `onAction` event to programmatically trigger navigation instead of the `href` prop.

## Selection and actions

Use the `selectionMode` prop to enable single or multiple selection. The selected items can be controlled via the `selectedKeys` prop, matching the `id` prop of the items. Items can be disabled with the `isDisabled` prop. See the [selection guide](selection.md?component=TagGroup) for more details.

```tsx
import type {Selection} from 'react-aria-components/TagGroup';
import {TagGroup, Tag} from 'vanilla-starter/TagGroup';
import {useState} from 'react';

function Example(props) {
  let [selected, setSelected] = useState(new Set());

  return (
    <div>
      <TagGroup
        {...props}
        label="Amenities"
        
        selectedKeys={selected}
        onSelectionChange={setSelected}
      >
        <Tag id="laundry">Laundry
        <Tag id="fitness">Fitness center
        <Tag id="parking" isDisabled>Parking
        <Tag id="pool">Swimming pool
        <Tag id="breakfast">Breakfast
      
      <p>Current selection: {selected === 'all' ? 'all' : [...selected].join(', ')}</p>
    </div>
  );
}
```

Use the `onAction` prop to handle item actions.

```tsx
import {TagGroup, Tag} from 'vanilla-starter/TagGroup';

function Example() {
  return (
    <TagGroup
      label="Music genres"
      onAction={key => alert(`Clicked ${key}`)}
    >
      <Tag id="rock">Rock
      <Tag id="jazz">Jazz
      <Tag id="pop">Pop
      <Tag id="classical">Classical
      <Tag id="edm">EDM
    
  );
}
```

## Examples

<ExampleList
  tag="taggroup"
  pages={props.pages}
/>

## API

```tsx

  
  
    
      
      <Button slot="remove" />
    
  
  <Text slot="description" />
  <Text slot="errorMessage" />

```

### TagGroup

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `React.ReactNode` | — | The children of the component. |
| `className` | `string | undefined` | 'react-aria-TagGroup' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
| `defaultSelectedKeys` | `"all" | Iterable | undefined` | — | The initial selected keys in the collection (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `disabledKeys` | `Iterable | undefined` | — | The item keys that are disabled. These items cannot be selected, focused, or otherwise interacted with. |
| `disallowEmptySelection` | `boolean | undefined` | — | Whether the collection allows empty selection. |
| `escapeKeyBehavior` | `"clearSelection" | "none" | undefined` | 'clearSelection' | Whether pressing the escape key should clear selection in the TagGroup or not. Most experiences should not modify this option as it eliminates a keyboard user's ability to easily clear selection. Only use if the escape key is being handled externally or should not trigger selection clearing contextually. |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `lang` | `string | undefined` | — |  |
| `onAction` | `((key: Key) => void) | undefined` | — | Handler that is called when a user performs an action on an item. The exact user event depends on the collection's `selectionBehavior` prop and the interaction modality. |
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

## API (part 3)

| `onPointerMove` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerMoveCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOut` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOutCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOver` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOverCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerUp` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerUpCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onRemove` | `((keys: Set) => void) | undefined` | — | Handler that is called when a user deletes a tag. |
| `onScroll` | `React.UIEventHandler | undefined` | — |  |
| `onScrollCapture` | `React.UIEventHandler | undefined` | — |  |
| `onSelectionChange` | `((keys: Selection) => void) | undefined` | — | Handler that is called when the selection changes. |
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
| `render` | `DOMRenderFunction<"div", undefined> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `selectedKeys` | `"all" | Iterable | undefined` | — | The currently selected keys in the collection (controlled). |
| `selectionBehavior` | `SelectionBehavior | undefined` | 'toggle' | How multiple selection should behave in the collection. |
| `selectionMode` | `SelectionMode | undefined` | — | The type of selection that is allowed in the collection. |
| `shouldSelectOnPressUp` | `boolean | undefined` | — | Whether selection should occur on press up instead of press down. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 4)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `((item: T) => ReactNode) | React.ReactNode` | — | The contents of the collection. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-TagList' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `dependencies` | `readonly any[] | undefined` | — | Values that should invalidate the item cache when using dynamic collections. |
| `dir` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
| `inert` | `boolean | undefined` | — |  |
| `items` | `Iterable | undefined` | — | Item objects in the collection. |
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
| `onTouchMove` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchMoveCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchStart` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchStartCapture` | `React.TouchEventHandler | undefined` | — |  |

## API (part 5)

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
| `render` | `DOMRenderFunction<"div", TagListRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `renderEmptyState` | `((props: TagListRenderProps) => ReactNode) | undefined` | — | Provides content to display when there are no items in the tag list. |
| `style` | `(((values: TagListRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 6)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Tag' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `dir` | `string | undefined` | — |  |
| `download` | `boolean | string | undefined` | — | Causes the browser to download the linked URL. A string may be provided to suggest a file name. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#download). |
| `hidden` | `boolean | undefined` | — |  |
| `href` | `string | undefined` | — | A URL to link to. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#href). |
| `hrefLang` | `string | undefined` | — | Hints at the human language of the linked URL. See[MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#hreflang). |
| `id` | `Key | undefined` | — | A unique id for the tag. |
| `inert` | `boolean | undefined` | — |  |
| `isDisabled` | `boolean | undefined` | — | Whether the tag is disabled. |
| `lang` | `string | undefined` | — |  |
| `onAction` | `(() => void) | undefined` | — | Handler that is called when a user performs an action on the item. The exact user event depends on the collection's `selectionBehavior` prop and the interaction modality. |
| `onAnimationEnd` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationEndCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIteration` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIterationCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStart` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStartCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAuxClick` | `React.MouseEventHandler | undefined` | — |  |
| `onAuxClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onBlur` | `((e: React.FocusEvent) => void) | undefined` | — | Handler that is called when the element loses focus. |
| `onClick` | `((e: React.MouseEvent) => void) | undefined` | — | **Not recommended – use `onPress` instead.** `onClick` is an alias for `onPress` provided for compatibility with other libraries. `onPress` provides additional event details for non-mouse interactions. |
| `onClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenu` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenuCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClick` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onFocus` | `((e: React.FocusEvent) => void) | undefined` | — | Handler that is called when the element receives focus. |
| `onFocusChange` | `((isFocused: boolean) => void) | undefined` | — | Handler that is called when the element's focus status changes. |
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
| `onMouseUpCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onPointerCancel` | `React.PointerEventHandler | undefined` | — |  |

## API (part 7)

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
| `onPress` | `((e: PressEvent) => void) | undefined` | — | Handler that is called when the press is released over the target. |
| `onPressChange` | `((isPressed: boolean) => void) | undefined` | — | Handler that is called when the press state changes. |
| `onPressEnd` | `((e: PressEvent) => void) | undefined` | — | Handler that is called when a press interaction ends, either over the target or when the pointer leaves the target. |
| `onPressStart` | `((e: PressEvent) => void) | undefined` | — | Handler that is called when a press interaction starts. |
| `onPressUp` | `((e: PressEvent) => void) | undefined` | — | Handler that is called when a press is released over the target, regardless of whether it started on the target or not. |
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
| `ping` | `string | undefined` | — | A space-separated list of URLs to ping when the link is followed. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#ping). |
| `referrerPolicy` | `React.HTMLAttributeReferrerPolicy | undefined` | — | How much of the referrer to send when following the link. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#referrerpolicy). |
| `rel` | `string | undefined` | — | The relationship between the linked resource and the current page. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rel). |
| `render` | `DOMRenderFunction<"div", TagRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `routerOptions` | `undefined` | — | Options for the configured client side router. |
| `style` | `(((values: TagRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |

## API (part 8)

| `target` | `React.HTMLAttributeAnchorTarget | undefined` | — | The target window for the link. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#target). |
| `textValue` | `string | undefined` | — | A string representation of the tags's contents, used for accessibility. Required if children is not a plain text string. |
| `translate` | `"no" | "yes" | undefined` | — |  |

