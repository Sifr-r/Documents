# Menu

## Introduction

A menu displays a list of actions or options that a user can choose.

## Vanilla CSS example

```tsx
import {MenuTrigger, SubmenuTrigger, Menu, MenuItem, MenuSection, Separator, Text, Keyboard} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';
import {Ellipsis, FolderOpen, Pencil, Copy, Trash, Share, Mail, Smartphone, Instagram} from 'lucide-react';

  <Button aria-label="Actions">
    <Ellipsis size={18} />
  
  
    
      <MenuItem onAction={() => alert('open')}>
        
        <Text slot="label">Open
        ⌘O
      
      <MenuItem onAction={() => alert('rename')}>
        
        <Text slot="label">Rename…
        ⌘R
      
      <MenuItem onAction={() => alert('duplicate')}>
        
        <Text slot="label">Duplicate
        ⌘D
      
      <MenuItem onAction={() => alert('delete')}>
        
        <Text slot="label">Delete…
        ⌘⌫
      
      
        
          
          <Text slot="label">Share
        
        
          
            
            <Text slot="label">Email
          
          
            
            <Text slot="label">SMS
          
          
            
            <Text slot="label">Instagram
          
        
      
    
    
    <MenuSection selectionMode="multiple" defaultSelectedKeys={['files']}>
      <MenuItem id="files">Show files
      <MenuItem id="folders">Show folders
    
  

```

### Menu.tsx

```tsx
'use client';
import {Check, ChevronRight, Dot} from 'lucide-react';
import {
  Menu as AriaMenu,
  MenuItem as AriaMenuItem,
  MenuSection as AriaMenuSection,
  MenuTrigger as AriaMenuTrigger,
  SubmenuTrigger as AriaSubmenuTrigger,
  Header,
  Separator,
  Keyboard,
  type MenuItemProps,
  type MenuProps,
  type MenuSectionProps,
  type MenuTriggerProps,
  type SubmenuTriggerProps
} from 'react-aria-components/Menu';
import {Popover} from './Popover';
import {Text} from './Content';
import React from 'react';
import './Menu.css';

export function MenuTrigger(props: MenuTriggerProps) {
  let [trigger, menu] = React.Children.toArray(props.children) as [
    React.ReactElement,
    React.ReactElement
  ];
  return (
    <AriaMenuTrigger {...props}>
      {trigger}
      {menu}
    
  );
}

export function Menu(props: MenuProps) {
  return <AriaMenu {...props}>{props.children};
}

export function MenuItem(props: Omit<MenuItemProps, 'children'> & {children?: React.ReactNode}) {
  let textValue =
    props.textValue || (typeof props.children === 'string' ? props.children : undefined);
  return (
    <AriaMenuItem {...props} textValue={textValue}>
      {({hasSubmenu, isSelected, selectionMode}) => (
        <>
          {isSelected && selectionMode === 'multiple' ?  : null}
          {isSelected && selectionMode === 'single' ?  : null}
          {typeof props.children === 'string' ? (
            <Text slot="label">{props.children}
          ) : (
            props.children
          )}
          {hasSubmenu && }
        </>
      )}
    
  );
}

export function MenuSection(props: MenuSectionProps) {
  return <AriaMenuSection {...props} />;
}

## Vanilla CSS example (part 2)

export function SubmenuTrigger(props: SubmenuTriggerProps) {
  let [trigger, menu] = React.Children.toArray(props.children) as [
    React.ReactElement,
    React.ReactElement
  ];
  return (
    <AriaSubmenuTrigger {...props}>
      {trigger}
      <Popover hideArrow offset={-2} crossOffset={-4}>
        {menu}
      
    
  );
}

export {Text, Header, Separator, Keyboard};

```

### Menu.css

```css
@import './theme.css';

.react-aria-Menu {
  min-height: 0;
  max-height: inherit;
  box-sizing: border-box;
  overflow: auto;
  min-width: 150px;
  box-sizing: border-box;
  outline: none;
  border-radius: inherit;
  display: grid;
  --check-width: 0;
  grid-template-columns: var(--spacing-3) var(--check-width) auto 1fr auto var(--spacing-3);
  grid-auto-rows: max-content;

  &:has(> [data-selection-mode]) {
    --check-width: var(--spacing-6);
  }

  &[data-empty] {
    display: flex;
    align-items: center;
    justify-content: center;
    font-style: italic;
    min-height: var(--spacing-8);
  }
}

.react-aria-MenuItem {
  margin-inline: var(--spacing-1);
  padding: calc((var(--spacing-8) - 1lh) / 2) 0;
  border-radius: calc(var(--radius-lg) - var(--spacing-1));
  outline: none;
  cursor: default;
  color: var(--text-color);
  font: var(--font-size) system-ui;
  position: relative;
  display: grid;
  grid-column-start: 1;
  grid-column-end: -1;
  grid-template-areas:
    '. check icon label end .'
    '. . . desc end .';
  grid-template-columns: subgrid;
  align-items: center;
  forced-color-adjust: none;
  -webkit-tap-highlight-color: transparent;

  > svg:not(.lucide-check, .lucide-dot, .lucide-chevron-right) {
    grid-area: icon;
    width: var(--spacing-4);
    height: var(--spacing-4);
    justify-self: center;
    margin-inline-end: var(--spacing-2);
  }

  &:first-of-type {
    margin-top: var(--spacing);
  }

  &:last-of-type {
    margin-bottom: var(--spacing);
  }

  &[data-open],
  &[data-pressed] {
    background: var(--highlight-hover);
  }

  &[data-focused] {
    background: var(--highlight-background);
    color: var(--highlight-foreground);
  }

  &[data-selection-mode] {
    .lucide-check,
    .lucide-dot {
      grid-area: check;
      width: var(--spacing-4);
      height: var(--spacing-4);
    }

    .lucide-check {
      stroke-width: 3px;
    }

    .lucide-dot {
      scale: 3;
    }
  }

  &[href] {
    text-decoration: none;
    cursor: pointer;
  }

  &[data-disabled] {
    color: var(--text-color-disabled);
  }

  .react-aria-Text:not([slot]),
  [slot='label'] {
    grid-area: label;
    font-weight: 500;
  }

  [slot='description'] {
    font-size: var(--font-size-sm);
    grid-area: desc;
  }

  kbd {
    grid-area: end;
    justify-self: end;
    margin-inline-start: var(--spacing-4);
    font-family: system-ui;
    font-size: var(--font-size-sm);
    text-align: end;
    background: var(--highlight-hover);
    border: 0.5px solid var(--highlight-pressed);
    padding: 0 var(--spacing-1);
    border-radius: var(--radius-sm);
  }

  &[data-focused] kbd {
    background: rgb(255 255 255 / 0.1);
    border-color: rgb(255 255 255 / 0.2);
  }

## Vanilla CSS example (part 3)

.lucide-chevron-right {
    grid-area: end;
    margin-left: var(--spacing-1);
    justify-self: end;
    width: var(--spacing-4);
    height: var(--spacing-4);
  }
}

.react-aria-MenuSection {
  display: grid;
  grid-column-start: 1;
  grid-column-end: -1;
  --check-width: 0;
  grid-template-columns: var(--spacing-3) var(--check-width) auto 1fr auto var(--spacing-3);

  &:has(> [data-selection-mode]) {
    --check-width: var(--spacing-6);
  }

  .react-aria-Header {
    grid-column-start: 1;
    grid-column-end: -1;
    font-size: var(--font-size-sm);
    font-weight: 600;
    font-variation-settings: initial;
    padding: var(--spacing-1) var(--spacing-3);
    background: var(--gray-100);
    border-block: 0.5px solid var(--gray-400);
    cursor: default;
    user-select: none;
    box-shadow:
      inset 0px 1px 0px white,
      inset 0px -4px 8px var(--gray-200);

    @media (prefers-color-scheme: dark) {
      box-shadow: inset 0px 4px 8px var(--gray-200);
    }
  }

  &:first-child .react-aria-Header {
    margin-top: -0.5px;
  }
}

.react-aria-Menu .react-aria-Separator {
  grid-column-start: 1;
  grid-column-end: -1;
  margin: 0 var(--spacing-2);
  border: 0;
  border-top: 0.5px solid var(--border-color);
  height: auto;
  width: auto;

  .react-aria-MenuItem + & {
    margin-block-start: var(--spacing-1);
  }

  &:has(+ .react-aria-MenuItem) {
    margin-block-end: var(--spacing-1);
  }
}

```

## Tailwind example

```tsx
import {MenuTrigger, SubmenuTrigger, Menu, MenuItem, MenuSection, MenuSeparator} from 'tailwind-starter/Menu';
import {Button} from 'tailwind-starter/Button';
import {MoreHorizontal} from 'lucide-react';

  <Button aria-label="Actions" variant="secondary">
    <MoreHorizontal className="w-5 h-5" />
  
  
    <MenuItem onAction={() => alert('open')}>Open
    <MenuItem onAction={() => alert('rename')}>Rename…
    <MenuItem onAction={() => alert('duplicate')}>Duplicate
    <MenuItem onAction={() => alert('delete')}>Delete…
    
      Share
      
        Email
        SMS
        Instagram
      
    
    
    <MenuSection selectionMode="multiple" defaultSelectedKeys={['files']}>
      <MenuItem id="files">Show files
      <MenuItem id="folders">Show folders
    
  

```

### Menu.tsx

```tsx
'use client';
import {Check, ChevronRight} from 'lucide-react';
import React from 'react';
import {
  Menu as AriaMenu,
  MenuItem as AriaMenuItem,
  type MenuProps,
  type MenuItemProps,
  MenuSection as AriaMenuSection,
  type MenuSectionProps as AriaMenuSectionProps,
  MenuTrigger as AriaMenuTrigger,
  SubmenuTrigger as AriaSubmenuTrigger,
  Separator,
  type SeparatorProps,
  Header,
  Collection,
  type SubmenuTriggerProps,
  type MenuTriggerProps as AriaMenuTriggerProps
} from 'react-aria-components/Menu';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {dropdownItemStyles} from './ListBox';
import {Popover, type PopoverProps} from './Popover';

export function Menu(props: MenuProps) {
  return (
    <AriaMenu
      {...props}
      className="font-sans p-1 outline outline-0 max-h-[inherit] overflow-auto [clip-path:inset(0_0_0_0_round_.75rem)] empty:text-center empty:pb-2"
    />
  );
}

export function MenuItem(props: MenuItemProps) {
  let textValue =
    props.textValue || (typeof props.children === 'string' ? props.children : undefined);
  return (
    <AriaMenuItem textValue={textValue} {...props} className={dropdownItemStyles}>
      {composeRenderProps(props.children, (children, {selectionMode, isSelected, hasSubmenu}) => (
        <>
          {selectionMode !== 'none' && (
            <span className="flex items-center w-4">
              {isSelected && <Check aria-hidden className="w-4 h-4" />}
            </span>
          )}
          <span className="flex items-center flex-1 gap-2 font-normal truncate group-selected:font-semibold">
            {children}
          </span>
          {hasSubmenu && <ChevronRight aria-hidden className="absolute w-4 h-4 right-2" />}
        </>
      ))}
    
  );
}

export function MenuSeparator(props: SeparatorProps) {
  return (
    <Separator
      {...props}
      className="mx-3 my-1 border-b border-neutral-300 dark:border-neutral-700"
    />
  );
}

export interface MenuSectionProps extends AriaMenuSectionProps {
  title?: string;
  items?: any;
}

## Tailwind example (part 2)

export function MenuSection(props: MenuSectionProps) {
  return (
    <AriaMenuSection
      {...props}
      className="first:-mt-[5px] after:content-[''] after:block after:h-[5px]">
      {props.title && (
        <Header className="text-sm font-semibold text-neutral-500 dark:text-neutral-300 px-4 py-1 truncate sticky -top-[5px] -mt-px -mx-1 z-10 bg-neutral-100/60 dark:bg-neutral-700/60 backdrop-blur-md supports-[-moz-appearance:none]:bg-neutral-100 border-y border-y-neutral-200 dark:border-y-neutral-700 [&+*]:mt-1">
          {props.title}
        
      )}
      <Collection items={props.items}>{props.children}
    
  );
}

interface MenuTriggerProps extends AriaMenuTriggerProps {
  placement?: PopoverProps['placement'];
}

export function MenuTrigger(props: MenuTriggerProps) {
  let [trigger, menu] = React.Children.toArray(props.children) as [
    React.ReactElement,
    React.ReactElement
  ];
  return (
    <AriaMenuTrigger {...props}>
      {trigger}
      <Popover placement={props.placement} className="min-w-[150px]">
        {menu}
      
    
  );
}

export function SubmenuTrigger(props: SubmenuTriggerProps) {
  let [trigger, menu] = React.Children.toArray(props.children) as [
    React.ReactElement,
    React.ReactElement
  ];
  return (
    <AriaSubmenuTrigger {...props}>
      {trigger}
      <Popover offset={-2} crossOffset={-4}>
        {menu}
      
    
  );
}

```

## Content

`Menu` follows the [Collection Components API](collections.md?component=Menu), accepting both static and dynamic collections. This example shows a dynamic collection, passing a list of objects to the `items` prop, and a function to render the children.

```tsx
import {MenuTrigger, Menu, MenuItem} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';

function Example() {
  let items = [
    { id: 1, name: 'New file…' },
    { id: 2, name: 'New window' },
    { id: 3, name: 'Open…' },
    { id: 4, name: 'Save' },
    { id: 5, name: 'Save as…' },
    { id: 6, name: 'Revert file' },
    { id: 7, name: 'Print…' },
    { id: 8, name: 'Close window' },
    { id: 9, name: 'Quit' }
  ];

  return (
    
      File
      {/*- begin highlight -*/}
      <Menu items={items}>
        {(item) => {item.name}}
      
      {/*- end highlight -*/}
    
  );
}
```

### Text slots

Use the `"label"` and `"description"` slots to separate primary and secondary content within a ``. This improves screen reader announcements and can also be used for styling purposes. Use the `` component to display a keyboard shortcut.

```tsx
import {MenuTrigger, Menu, MenuItem, Text, Keyboard} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';

  Permissions
  
    <MenuItem textValue="Copy">
      {/*- begin highlight -*/}
      <Text slot="label">Copy
      <Text slot="description">Copy the selected text
      {/*- end highlight -*/}
      ⌘C
    
    <MenuItem textValue="Cut">
      <Text slot="label">Cut
      <Text slot="description">Cut the selected text
      ⌘X
    
    <MenuItem textValue="Paste">
      <Text slot="label">Paste
      <Text slot="description">Paste the copied text
      ⌘V
    
  

```

<InlineAlert variant="notice">
  Accessibility
  Interactive elements (e.g. buttons) within menu items are not allowed. This will break keyboard and screen reader navigation. Only add textual or decorative graphics (e.g. icons or images) as children.

### Sections

Use the `` component to group options. A `` element may also be included to label the section. Sections without a header must have an `aria-label`.

```tsx
import {MenuTrigger, Menu, MenuItem, MenuSection, Header} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';

  Publish
  
    {/*- begin highlight -*/}
    
      Export
      {/*- end highlight -*/}
      Image…
      Video…
      Text…
    
    
      Share
      YouTube…
      Instagram…
      Email…
    
  

```

### Submenus

Wrap a `` with a `` to create a submenu.

```tsx
import {MenuTrigger, SubmenuTrigger, Menu, MenuItem} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';

  Actions
  
    Cut
    Copy
    Delete
    {/*- begin highlight -*/}
    
      Share
      {/*- end highlight -*/}
      
        SMS
        Instagram
        
          Email
          
            Work
            Personal
          
        
      
    
  

```

### Separators

Separators may be added between menu items or sections in order to create non-labeled groupings.

## Content (part 2)

```tsx
import {MenuTrigger, Menu, MenuItem, Separator} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';

  Actions
  
    New…
    Open…
    {/*- begin highlight -*/}
    
    {/*- end highlight -*/}
    Save
    Save as…
    Rename…
    
    Page setup…
    Print…
  

```

### Links

Use the `href` prop on a `` to create a link.

```tsx
import {MenuTrigger, Menu, MenuItem} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';

  Links
  
    {/*- begin highlight -*/}
    <MenuItem href="https://adobe.com/" target="_blank">Adobe
    {/*- end highlight -*/}
    <MenuItem href="https://apple.com/" target="_blank">Apple
    <MenuItem href="https://google.com/" target="_blank">Google
    <MenuItem href="https://microsoft.com/" target="_blank">Microsoft
  

```

By default, links are rendered as an `<a>` element. Use the `render` prop to integrate your framework's link component. An `href` should still be passed to `MenuItem` so React Aria knows it is a link.

```tsx
<MenuItem
  {...props}
  render={domProps =>
    'href' in domProps
      ? <RouterLink {...domProps} />
      : <div {...domProps} />
  } />
```

### Autocomplete

Popovers can include additional components as siblings of a menu. This example uses an [Autocomplete](Autocomplete.md) with a [SearchField](SearchField.md) to let the user filter the items.

```tsx
import {Autocomplete, useFilter} from 'react-aria-components/Autocomplete';
import {MenuTrigger, Menu, MenuItem} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';
import {SearchField} from 'vanilla-starter/SearchField';

function Example() {
  let {contains} = useFilter({sensitivity: 'base'});

  return (
    
      Add tag...
      <div style={{display: 'flex', flexDirection: 'column', maxHeight: 'inherit'}}>
        {/*- begin highlight -*/}
        <Autocomplete filter={contains}>
          <SearchField aria-label="Search tags" placeholder="Search tags" autoFocus style={{margin: 4}} />
          <Menu style={{flex: 1}}>
            {/*- end highlight -*/}
            News
            Travel
            Shopping
            Business
            Entertainment
            Food
            Technology
            Health
            Science
          
        
      </div>
    
  );
}
```

## Selection

Use the `selectionMode` prop to enable single or multiple selection. The selected items can be controlled via the `selectedKeys` prop, matching the `id` prop of the items. Items can be disabled with the `isDisabled` prop. See the [selection guide](selection.md?component=Menu) for more details.

```tsx
import type {Selection} from 'react-aria-components/Menu';
import {MenuTrigger, Menu, MenuItem} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';
import {useState} from 'react';

function Example(props) {
  let [selected, setSelected] = useState(new Set(['rulers']));

  return (
    <>
      
        View
        <Menu
          {...props}
          
          selectedKeys={selected}
          onSelectionChange={setSelected}>
          {/*- end highlight -*/}
          <MenuItem id="grid">Pixel grid
          <MenuItem id="rulers">Rulers
          <MenuItem id="comments" isDisabled>Comments
          <MenuItem id="layout">Layout guides
          <MenuItem id="toolbar">Toolbar
        
      
      <p>Current selection: {selected === 'all' ? 'all' : [...selected].join(', ')}</p>
    </>
  );
}
```

### Section-level selection

Each section in a menu may have independent selection states by passing `selectionMode` and `selectedKeys` to the `MenuSection`.

```tsx
import type {Selection} from 'react-aria-components/Menu';
import {MenuTrigger, Menu, MenuItem, MenuSection, Header} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';
import {useState} from 'react';

function Example() {
  let [style, setStyle] = useState(new Set(['bold']));
  let [align, setAlign] = useState(new Set(['left']));
  return (
    
      Edit
      
        
          Clipboard
          Cut
          Copy
          Paste
        
        {/*- begin highlight -*/}
        <MenuSection
          selectionMode="multiple"
          selectedKeys={style}
          onSelectionChange={setStyle}>
          {/*- end highlight -*/}
          Text style
          <MenuItem id="bold">Bold
          <MenuItem id="italic">Italic
          <MenuItem id="underline">Underline
        
        <MenuSection selectionMode="single" selectedKeys={align} onSelectionChange={setAlign}>
          Text alignment
          <MenuItem id="left">Left
          <MenuItem id="center">Center
          <MenuItem id="right">Right
        
      
    
  );
}
```

## Menu trigger

### Custom trigger

`MenuTrigger` works with any pressable React Aria component (e.g. [Button](Button.md), [Link](Link.md), etc.). Use the `` component or [usePress](usePress.md) hook to wrap a custom trigger element such as a third party component or DOM element.

```tsx
import {Pressable} from 'react-aria-components/Menu';
import {MenuTrigger, Menu, MenuItem} from 'vanilla-starter/Menu';

  {/*- begin highlight -*/}
  
    <span role="button">Custom trigger</span>
  
  {/*- end highlight -*/}
  
    Open
    Rename…
    Duplicate
    Delete…
  

```

<InlineAlert variant="notice">
  Accessibility
  Any `` child must have an [interactive ARIA role](https://www.w3.org/TR/wai-aria-1.2/#widget_roles) or use an appropriate semantic HTML element so that screen readers can announce the trigger. Trigger components must forward their `ref` and spread all props to a DOM element.

```tsx
const CustomTrigger = React.forwardRef((props, ref) => (
  <button {...props} ref={ref} />
));
```

### Long press

Use `trigger="longPress"` to open the menu on long press instead of on click/tap. Keyboard users can open the menu using Alt ▼. This is useful when the menu trigger has a primary action on press, and the menu provides secondary actions.

```tsx
import {MenuTrigger, Menu, MenuItem} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';
import {ChevronDown} from 'lucide-react';

<MenuTrigger trigger="longPress">
  <Button onPress={() => alert('crop')}>
    <span>Crop</span>
    <ChevronDown size={18} />
  
  
    Rotate
    Slice
    Clone stamp
  

```

## Examples

<ExampleList
  tag="menu"
  pages={props.pages}
/>

## API

```tsx

  
  
    
      
        <Text slot="label" />
        <Text slot="description" />
        
        
      
      
      
        
        
      
      
        
        
          
        
      
    
  

```

### MenuTrigger

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `React.ReactNode` | — |  |
| `defaultOpen` | `boolean | undefined` | — | Whether the overlay is open by default (uncontrolled). |
| `isOpen` | `boolean | undefined` | — | Whether the overlay is open by default (controlled). |
| `onOpenChange` | `((isOpen: boolean) => void) | undefined` | — | Handler that is called when the overlay's open state changes. |
| `trigger` | `MenuTriggerType | undefined` | 'press' | How the menu is triggered. |

### Menu

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `autoFocus` | `boolean | FocusStrategy | undefined` | — | Where the focus should be set. |
| `children` | `((item: T) => ReactNode) | React.ReactNode` | — | The contents of the collection. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Menu' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultSelectedKeys` | `"all" | Iterable | undefined` | — | The initial selected keys in the collection (uncontrolled). |
| `dependencies` | `readonly any[] | undefined` | — | Values that should invalidate the item cache when using dynamic collections. |
| `dir` | `string | undefined` | — |  |
| `disabledKeys` | `Iterable | undefined` | — | The item keys that are disabled. These items cannot be selected, focused, or otherwise interacted with. |
| `disallowEmptySelection` | `boolean | undefined` | — | Whether the collection allows empty selection. |
| `escapeKeyBehavior` | `"clearSelection" | "none" | undefined` | 'clearSelection' | Whether pressing the escape key should clear selection in the menu or not. Most experiences should not modify this option as it eliminates a keyboard user's ability to easily clear selection. Only use if the escape key is being handled externally or should not trigger selection clearing contextually. |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `items` | `Iterable | undefined` | — | Item objects in the collection. |
| `lang` | `string | undefined` | — |  |
| `onAction` | `((key: Key) => void) | undefined` | — | Handler that is called when an item is selected. |
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
| `onClose` | `(() => void) | undefined` | — | Handler that is called when the menu should close after selecting an item. |
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

## API (part 3)

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
| `render` | `DOMRenderFunction<"div", MenuRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `renderEmptyState` | `(() => ReactNode) | undefined` | — | Provides content to display when there are no items in the list. |
| `selectedKeys` | `"all" | Iterable | undefined` | — | The currently selected keys in the collection (controlled). |
| `selectionMode` | `SelectionMode | undefined` | — | The type of selection that is allowed in the collection. |
| `shouldCloseOnSelect` | `boolean | undefined` | — | Whether the menu should close when the menu item is selected. |
| `shouldFocusWrap` | `boolean | undefined` | — | Whether keyboard navigation is circular. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: MenuRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 4)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-label` | `string | undefined` | — | An accessibility label for this item. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-MenuItem' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `dir` | `string | undefined` | — |  |
| `download` | `boolean | string | undefined` | — | Causes the browser to download the linked URL. A string may be provided to suggest a file name. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#download). |
| `hidden` | `boolean | undefined` | — |  |
| `href` | `string | undefined` | — | A URL to link to. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#href). |
| `hrefLang` | `string | undefined` | — | Hints at the human language of the linked URL. See[MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#hreflang). |
| `id` | `Key | undefined` | — | The unique id of the item. |
| `inert` | `boolean | undefined` | — |  |
| `isDisabled` | `boolean | undefined` | — | Whether the item is disabled. |
| `lang` | `string | undefined` | — |  |
| `onAction` | `(() => void) | undefined` | — | Handler that is called when the item is selected. |
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

## API (part 5)

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
| `render` | `((props: React.DetailedHTMLProps<Required<Pick<React.AnchorHTMLAttributes, "href">> & Omit<React.AnchorHTMLAttributes, "href">, HTMLAnchorElement> | React.DetailedHTMLProps<React.HTMLAttributes, HTMLDivElement>, renderProps: MenuItemRenderProps) => ReactElement) | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Note: You can check if `'href' in props` in order to tell whether to render an `<a>` element. Requirements: - You must render the expected element type (e.g. if `<a>` is expected, you cannot render a   `<button>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `routerOptions` | `undefined` | — | Options for the configured client side router. |

## API (part 6)

| `shouldCloseOnSelect` | `boolean | undefined` | — | Whether the menu should close when the menu item is selected. |
| `style` | `(((values: MenuItemRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `target` | `React.HTMLAttributeAnchorTarget | undefined` | — | The target window for the link. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#target). |
| `textValue` | `string | undefined` | — | A string representation of the item's contents, used for features like typeahead. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `value` | `T | undefined` | — | The object value that this item represents. When using dynamic collections, this is set automatically. |

## API (part 7)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-label` | `string | undefined` | — | An accessibility label for the section. |
| `children` | `((item: T) => ReactElement) | React.ReactNode` | — | Static child items or a function to render children. |
| `className` | `string | undefined` | 'react-aria-MenuSection' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
| `defaultSelectedKeys` | `"all" | Iterable | undefined` | — | The initial selected keys in the collection (uncontrolled). |
| `dependencies` | `readonly any[] | undefined` | — | Values that should invalidate the item cache when using dynamic collections. |
| `dir` | `string | undefined` | — |  |
| `disallowEmptySelection` | `boolean | undefined` | — | Whether the collection allows empty selection. |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `Key | undefined` | — | The unique id of the section. |
| `inert` | `boolean | undefined` | — |  |
| `items` | `Iterable | undefined` | — | Item objects in the section. |
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
| `onSelectionChange` | `((keys: Selection) => void) | undefined` | — | Handler that is called when the selection changes. |
| `onTouchCancel` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchCancelCapture` | `React.TouchEventHandler | undefined` | — |  |

## API (part 8)

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
| `render` | `DOMRenderFunction<"section", undefined> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `selectedKeys` | `"all" | Iterable | undefined` | — | The currently selected keys in the collection (controlled). |
| `selectionMode` | `SelectionMode | undefined` | — | The type of selection that is allowed in the collection. |
| `shouldCloseOnSelect` | `boolean | undefined` | — | Whether the menu should close when the menu item is selected. |
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `value` | `T | undefined` | — | The object value that this section represents. When using dynamic collections, this is set automatically. |

## API (part 9)

### SubmenuTrigger

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `React.ReactElement<React.JSXElementConstructor<any> | unknown, string>[]` | — | The contents of the SubmenuTrigger. The first child should be an Item (the trigger) and the second child should be the Popover (for the submenu). |
| `delay` | `number | undefined` | 200 | The delay time in milliseconds for the submenu to appear after hovering over the trigger. |

