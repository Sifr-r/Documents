# ListBox

## Introduction

A listbox displays a list of options and allows a user to select one or more of them.

## Vanilla CSS example

```tsx
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';

<ListBox aria-label="Favorite animal">
  Aardvark
  Cat
  Dog
  Kangaroo
  Panda
  Snake

```

### ListBox.tsx

```tsx
'use client';
import {
  ListBox as AriaListBox,
  ListBoxItem as AriaListBoxItem,
  ListBoxSection as AriaListBoxSection,
  ListBoxLoadMoreItem as AriaListBoxLoadMoreItem,
  Header,
  type ListBoxItemProps,
  type ListBoxLoadMoreItemProps,
  type ListBoxProps,
  type ListBoxSectionProps
} from 'react-aria-components/ListBox';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {Check} from 'lucide-react';
import {Text} from './Content';
import {ProgressCircle} from './ProgressCircle';
import './ListBox.css';

export function ListBox({children, ...props}: ListBoxProps) {
  return <AriaListBox {...props}>{children};
}

export function ListBoxItem(props: ListBoxItemProps) {
  let textValue =
    props.textValue || (typeof props.children === 'string' ? props.children : undefined);
  return (
    <AriaListBoxItem {...props} textValue={textValue}>
      {composeRenderProps(props.children, children =>
        typeof children === 'string' ? <Text slot="label">{children} : children
      )}
    
  );
}

export function ListBoxSection(props: ListBoxSectionProps) {
  return <AriaListBoxSection {...props} />;
}

export function ListBoxLoadMoreItem(props: ListBoxLoadMoreItemProps) {
  return (
    <AriaListBoxLoadMoreItem {...props}>
      <ProgressCircle isIndeterminate aria-label="Loading more..." />
    
  );
}

export function DropdownListBox(props: ListBoxProps) {
  return <AriaListBox {...props} className="dropdown-listbox" />;
}

export function DropdownItem(props: ListBoxItemProps) {
  let textValue =
    props.textValue || (typeof props.children === 'string' ? props.children : undefined);
  return (
    <ListBoxItem {...props} textValue={textValue} className="dropdown-item">
      {composeRenderProps(props.children, (children, {isSelected}) => (
        <>
          {isSelected && }
          {typeof children === 'string' ? <Text slot="label">{children} : children}
        </>
      ))}
    
  );
}

export {Text, Header};

```

### ListBox.css

```css
@import './theme.css';

.react-aria-ListBox {
  max-height: inherit;
  overflow: auto;
  border: 0.5px solid var(--border-color);
  border-radius: calc(var(--radius) + var(--spacing-1));
  background: var(--overlay-background);
  forced-color-adjust: none;
  outline: none;
  box-sizing: border-box;
  font: var(--font-size) system-ui;
  color: var(--text-color);

  &:has(.react-aria-ListBoxSection) {
    scroll-padding: 24px;
  }

  &[data-focus-visible] {
    outline: 2px solid var(--focus-ring-color);
    outline-offset: -1px;
  }

  &[data-empty] {
    align-items: center;
    justify-content: center;
    font-style: italic;
  }

  &[data-drop-target] {
    outline: 2px solid var(--highlight-background);
    outline-offset: -1px;
    background: var(--highlight-overlay);
  }

  .react-aria-DropIndicator[data-drop-target] {
    z-index: 3;
    outline: 1px solid var(--highlight-background);
  }
}

## Vanilla CSS example (part 2)

.react-aria-ListBoxSection {
  .react-aria-Header {
    position: sticky;
    top: -0.5px;
    z-index: 2;
    font-size: var(--font-size-sm);
    font-weight: 600;
    font-variation-settings: initial;
    padding: var(--spacing-1) var(--spacing-4);
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

.react-aria-ListBoxItem {
  padding: var(--spacing-1) var(--spacing-3);
  border-radius: var(--radius);
  outline: none;
  cursor: default;
  color: var(--text-color);
  font: var(--font-size) system-ui;
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: center;
  min-height: var(--spacing-8);
  box-sizing: border-box;
  position: relative;
  transition-property: background, color, border-radius;
  transition-duration: 200ms;
  -webkit-tap-highlight-color: transparent;

  --border-color: var(--gray-300);
  &:not(:last-child)::after {
    content: '';
    display: block;
    position: absolute;
  }

  &[data-pressed] {
    background: var(--highlight-hover);
    border-radius: var(--radius);
  }

  &[data-focus-visible] {
    outline: 2px solid var(--focus-ring-color);
    outline-offset: -2px;
    z-index: 2;
  }

  &[data-selected] {
    background: var(--highlight-background);
    color: var(--highlight-foreground);
    --border-color: transparent;

    &[data-focus-visible] {
      outline-color: var(--highlight-foreground);
      outline-offset: -4px;
    }

    &[data-pressed] {
      background: var(--highlight-background-pressed);
    }

    &:has(+ [data-selected]),
    &:has(+ .react-aria-DropIndicator + [data-selected]) {
      --border-color: rgb(255 255 255 / 0.3);
    }
  }

  [slot='label'] {
    font-weight: 500;
  }

  [slot='description'] {
    font-size: var(--font-size-sm);
  }

  &[href] {
    text-decoration: none;
    cursor: pointer;
    -webkit-touch-callout: none;
  }

  &[data-disabled] {
    color: var(--text-color-disabled);
  }

  &[data-dragging] {
    opacity: 0.6;
  }

  &[data-drop-target] {
    outline: 2px solid var(--highlight-background);
    background: var(--highlight-overlay);
  }
}

.react-aria-ListBox {
  &[data-layout='stack'] {
    display: flex;

    &[data-orientation='vertical'] {
      flex-direction: column;
      width: 250px;
      max-height: 300px;
      min-height: 100px;

      .react-aria-ListBoxItem {
        margin-inline: var(--spacing-1);

        &:where(:nth-child(1 of .react-aria-ListBoxItem)) {
          margin-top: var(--spacing);
        }

        &:where(:nth-last-child(1 of .react-aria-ListBoxItem)) {
          margin-bottom: var(--spacing);
        }

        [role='presentation'] > & {
          margin: 0; /* virtualizer */
        }

        &:not(:last-child)::after {
          bottom: 0;
          width: calc(100% - var(--spacing-6));
          border-bottom: 0.5px solid var(--border-color);
        }

## Vanilla CSS example (part 3)

&[data-selected] {
          &:has(+ [data-selected]),
          &:has(+ .react-aria-DropIndicator + [data-selected]) {
            border-end-start-radius: 0;
            border-end-end-radius: 0;
          }

          + [data-selected],
          + .react-aria-DropIndicator + [data-selected] {
            border-start-start-radius: 0;
            border-start-end-radius: 0;
          }
        }
      }
    }

    &[data-orientation='horizontal'] {
      flex-direction: row;
      width: 100%;

      .react-aria-ListBoxItem {
        min-width: max-content;
        margin-block: var(--spacing-1);

        &:nth-child(1 of .react-aria-ListBoxItem) {
          margin-inline-start: var(--spacing);
        }

        &:nth-last-child(1 of .react-aria-ListBoxItem) {
          margin-inline-end: var(--spacing);
        }

        &:not(:last-child)::after {
          inset-inline-end: 0;
          height: calc(100% - var(--spacing-2));
          border-inline-end: 0.5px solid var(--border-color);
        }

        &[data-selected] {
          &:has(+ [data-selected]),
          &:has(+ .react-aria-DropIndicator + [data-selected]) {
            border-start-end-radius: 0;
            border-end-end-radius: 0;
          }

          + [data-selected],
          + .react-aria-DropIndicator + [data-selected] {
            border-start-start-radius: 0;
            border-end-start-radius: 0;
          }
        }
      }
    }
  }

  &[data-layout='grid'] {
    display: grid;
    gap: var(--spacing-1);
    width: fit-content;
    max-width: 100%;
    padding: var(--spacing-1);

    &[data-orientation='vertical'] {
      grid-template-columns: 1fr 1fr;
    }

    &[data-orientation='horizontal'] {
      grid-auto-flow: column;
      grid-template-rows: auto auto;
      grid-template-columns: none;
      grid-auto-columns: 160px;
    }
  }
}

.react-aria-ListBoxLoadingIndicator {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 24px;
  width: 100%;
}

.dropdown-listbox {
  display: block;
  max-height: inherit;
  overflow: auto;
  border-radius: inherit;
  forced-color-adjust: none;
  outline: none;
  box-sizing: border-box;
  font: var(--font-size) system-ui;
  color: var(--text-color);

  &[data-empty] {
    min-height: var(--spacing-8);
    padding: var(--spacing-2);
  }

  .react-aria-Header {
    padding-left: var(--spacing-7);
  }
}

.dropdown-item {
  padding: calc((var(--spacing-8) - 1lh) / 2) var(--spacing-3) calc((var(--spacing-8) - 1lh) / 2)
    var(--spacing-6);
  box-sizing: border-box;
  border-radius: var(--radius);
  outline: none;
  cursor: default;
  color: var(--text-color);
  font: var(--font-size) system-ui;
  font-weight: 500;
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: center;
  min-height: var(--spacing-8);
  margin-inline: var(--spacing-1);
  -webkit-tap-highlight-color: transparent;

  &:first-of-type {
    margin-top: var(--spacing);
  }

  &:last-of-type {
    margin-bottom: var(--spacing);
  }

  &[data-selected] {
    font-weight: 500;
    color: var(--text-color);

## Vanilla CSS example (part 4)

.lucide-check {
      position: absolute;
      top: 50%;
      left: var(--spacing-1);
      translate: 0 -50%;
      stroke-width: 3px;
      width: var(--spacing-4);
      height: var(--spacing-4);
    }
  }

  &[data-pressed] {
    background: var(--highlight-hover);
  }

  &[data-focused] {
    background: var(--highlight-background);
    color: var(--highlight-foreground);
  }

  [slot='label'] {
    font-weight: 500;
  }

  [slot='description'] {
    font-size: var(--font-size-sm);
  }

  &[data-disabled] {
    color: var(--text-color-disabled);
  }

  &[href] {
    text-decoration: none;
    cursor: pointer;
  }
}

```

## Tailwind example

```tsx
import {ListBox, ListBoxItem} from 'tailwind-starter/ListBox';

<ListBox aria-label="Favorite animal">
  Aardvark
  Cat
  Dog
  Kangaroo
  Panda
  Snake

```

### ListBox.tsx

```tsx
'use client';
import {Check} from 'lucide-react';
import React from 'react';
import {
  ListBox as AriaListBox,
  ListBoxItem as AriaListBoxItem,
  ListBoxSection,
  Header,
  Collection,
  type ListBoxProps as AriaListBoxProps,
  type ListBoxItemProps,
  type ListBoxSectionProps
} from 'react-aria-components/ListBox';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {tv} from 'tailwind-variants';
import {composeTailwindRenderProps, focusRing} from './utils';

interface ListBoxProps extends Omit<AriaListBoxProps, 'layout' | 'orientation'> {}

export function ListBox({children, ...props}: ListBoxProps) {
  return (
    <AriaListBox
      {...props}
      className={composeTailwindRenderProps(
        props.className,
        'outline-0 p-1 w-[200px] bg-white dark:bg-neutral-900 border border-neutral-300 dark:border-neutral-700 rounded-lg font-sans'
      )}>
      {children}
    
  );
}

export const itemStyles = tv({
  extend: focusRing,
  base: 'group relative flex items-center gap-8 cursor-default select-none py-1.5 px-2.5 rounded-md will-change-transform text-sm forced-color-adjust-none',
  variants: {
    isSelected: {
      false:
        'text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 pressed:bg-neutral-100 dark:hover:bg-neutral-800 dark:pressed:bg-neutral-800 -outline-offset-2',
      true: 'bg-blue-600 text-white forced-colors:bg-[Highlight] forced-colors:text-[HighlightText] [&:has(+[data-selected])]:rounded-b-none [&+[data-selected]]:rounded-t-none -outline-offset-4 outline-white dark:outline-white forced-colors:outline-[HighlightText]'
    },
    isDisabled: {
      true: 'text-neutral-300 dark:text-neutral-600 forced-colors:text-[GrayText]'
    }
  }
});

export function ListBoxItem(props: ListBoxItemProps) {
  let textValue =
    props.textValue || (typeof props.children === 'string' ? props.children : undefined);
  return (
    <AriaListBoxItem {...props} textValue={textValue} className={itemStyles}>
      {composeRenderProps(props.children, children => (
        <>
          {children}
          <div className="absolute left-4 right-4 bottom-0 h-px bg-white/20 forced-colors:bg-[HighlightText] hidden [.group[data-selected]:has(+[data-selected])_&]:block" />
        </>
      ))}
    
  );
}

## Tailwind example (part 2)

export const dropdownItemStyles = tv({
  base: 'group flex items-center gap-4 cursor-default select-none py-2 pl-3 pr-3 selected:pr-1 rounded-lg outline outline-0 text-sm forced-color-adjust-none no-underline [&[href]]:cursor-pointer [-webkit-tap-highlight-color:transparent]',
  variants: {
    isDisabled: {
      false: 'text-neutral-900 dark:text-neutral-100',
      true: 'text-neutral-300 dark:text-neutral-600 forced-colors:text-[GrayText]'
    },
    isPressed: {
      true: 'bg-neutral-100 dark:bg-neutral-800'
    },
    isFocused: {
      true: 'bg-blue-600 dark:bg-blue-600 text-white forced-colors:bg-[Highlight] forced-colors:text-[HighlightText]'
    }
  },
  compoundVariants: [
    {
      isFocused: false,
      isOpen: true,
      className: 'bg-neutral-100 dark:bg-neutral-700/60'
    }
  ]
});

export function DropdownItem(props: ListBoxItemProps) {
  let textValue =
    props.textValue || (typeof props.children === 'string' ? props.children : undefined);
  return (
    <AriaListBoxItem {...props} textValue={textValue} className={dropdownItemStyles}>
      {composeRenderProps(props.children, (children, {isSelected}) => (
        <>
          <span className="flex items-center flex-1 gap-2 font-normal truncate group-selected:font-semibold">
            {children}
          </span>
          <span className="flex items-center w-5">
            {isSelected && <Check className="w-4 h-4" />}
          </span>
        </>
      ))}
    
  );
}

export interface DropdownSectionProps extends ListBoxSectionProps {
  title?: string;
  items?: any;
}

export function DropdownSection(props: DropdownSectionProps) {
  return (
    <ListBoxSection className="first:-mt-[5px] after:content-[''] after:block after:h-[5px] last:after:hidden">
      <Header className="text-sm font-semibold text-neutral-500 dark:text-neutral-300 px-4 py-1 truncate sticky -top-[5px] -mt-px -mx-1 z-10 bg-neutral-100/60 dark:bg-neutral-700/60 backdrop-blur-md supports-[-moz-appearance:none]:bg-neutral-100 border-y border-y-neutral-200 dark:border-y-neutral-700 [&+*]:mt-1">
        {props.title}
      
      <Collection items={props.items}>{props.children}
    
  );
}

```

## Content

`ListBox` follows the [Collection Components API](collections.md?component=ListBox), accepting both static and dynamic collections. This example shows a dynamic collection, passing a list of objects to the `items` prop, and a function to render the children.

```tsx
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';

function Example() {
  let options = [
    { id: 1, name: 'Aardvark' },
    { id: 2, name: 'Cat' },
    { id: 3, name: 'Dog' },
    { id: 4, name: 'Kangaroo' },
    { id: 5, name: 'Koala' },
    { id: 6, name: 'Penguin' },
    { id: 7, name: 'Snake' },
    { id: 8, name: 'Turtle' },
    { id: 9, name: 'Wombat' }
  ];

  return (
    /*- begin highlight -*/
    <ListBox aria-label="Animals" items={options} selectionMode="single">
      {(item) => {item.name}}
    
    /*- end highlight -*/
  );
}
```

### Text slots

Use the `"label"` and `"description"` slots to separate primary and secondary content within a ``. This improves screen reader announcements and can also be used for styling purposes.

```tsx
import {ListBox, ListBoxItem, Text} from 'vanilla-starter/ListBox';

<ListBox aria-label="Permissions" selectionMode="single">
  <ListBoxItem textValue="Read">
    {/*- begin highlight -*/}
    <Text slot="label">Read
    <Text slot="description">Read only
    {/*- end highlight -*/}
  
  <ListBoxItem textValue="Write">
    <Text slot="label">Write
    <Text slot="description">Read and write only
  
  <ListBoxItem textValue="Admin">
    <Text slot="label">Admin
    <Text slot="description">Full access
  

```

<InlineAlert variant="notice">
  Accessibility warning
  Interactive elements (e.g. buttons) within listbox items are not allowed. This will break keyboard and screen reader navigation. Only add textual or decorative graphics (e.g. icons or images) as children. Use [GridList](GridList.md) if interactive children are needed.

### Sections

Use the `` component to group options. A `` element may also be included to label the section. Sections without a header must have an `aria-label`.

```tsx
import {ListBox, ListBoxItem, ListBoxSection, Header} from 'vanilla-starter/ListBox';

<ListBox aria-label="Sandwich contents" selectionMode="multiple">
  {/*- begin highlight -*/}
  
    Veggies
    {/*- end highlight -*/}
    <ListBoxItem id="lettuce">Lettuce
    <ListBoxItem id="tomato">Tomato
    <ListBoxItem id="onion">Onion
  
  
    Protein
    <ListBoxItem id="ham">Ham
    <ListBoxItem id="tuna">Tuna
    <ListBoxItem id="tofu">Tofu
  
  
    Condiments
    <ListBoxItem id="mayo">Mayonaise
    <ListBoxItem id="mustard">Mustard
    <ListBoxItem id="ranch">Ranch
  

```

### Asynchronous loading

Use [renderEmptyState](#empty-state) to display a spinner during initial load. To enable infinite scrolling, render a `` at the end of the list or section. Use whatever data fetching library you prefer – this example uses `useAsyncList` from `react-stately`.

```tsx
import {ListBox, ListBoxItem, ListBoxLoadMoreItem} from 'vanilla-starter/ListBox';
import {ProgressCircle} from 'vanilla-starter/ProgressCircle';
import {Collection} from 'react-aria-components/Collection';
import {useAsyncList} from 'react-aria-components/useAsyncList';

## Content (part 2)

interface Character {
  name: string
}

function AsyncLoadingExample() {
  let list = useAsyncList({
    async load({signal, cursor}) {
      let res = await fetch(
        cursor || `https://pokeapi.co/api/v2/pokemon`,
        { signal }
      );
      let json = await res.json();

      return {
        items: json.results,
        cursor: json.next
      };
    }
  });

  return (
    <ListBox
      aria-label="Pick a Pokemon"
      selectionMode="single"
      renderEmptyState={() => (
        <ProgressCircle isIndeterminate aria-label="Loading..." />
      )}>
      <Collection items={list.items}>
        {(item) => <ListBoxItem id={item.name}>{item.name}}
      
      {/*- begin highlight -*/}
      <ListBoxLoadMoreItem
        onLoadMore={list.loadMore}
        isLoading={list.loadingState === 'loadingMore'} />
      {/*- end highlight -*/}
    
  );
}
```

### Links

Use the `href` prop on a `` to create a link.

By default, link items in a ListBox are not selectable, and only perform navigation when the user interacts with them. However, with `selectionBehavior="replace"`, items will be selected when single clicking or pressing the Space key, and navigate to the link when double clicking or pressing the Enter key.

```tsx
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';

<ListBox aria-label="Links" selectionMode="multiple">
  {/*- begin highlight -*/}
  <ListBoxItem href="https://adobe.com/" target="_blank">Adobe
  {/*- end highlight -*/}
  <ListBoxItem href="https://apple.com/" target="_blank">Apple
  <ListBoxItem href="https://google.com/" target="_blank">Google
  <ListBoxItem href="https://microsoft.com/" target="_blank">Microsoft

```

By default, links are rendered as an `<a>` element. Use the `render` prop to integrate your framework's link component. An `href` should still be passed to `ListBoxItem` so React Aria knows it is a link.

```tsx
<ListBoxItem
  {...props}
  render={domProps =>
    'href' in domProps
      ? <RouterLink {...domProps} />
      : <div {...domProps} />
  } />
```

### Empty state

```tsx
import {ListBox} from 'vanilla-starter/ListBox';

<ListBox
  aria-label="Search results"
  renderEmptyState={() => 'No results found.'}>
  {[]}

```

## Selection

Use the `selectionMode` prop to enable single or multiple selection. The selected items can be controlled via the `selectedKeys` prop, matching the `id` prop of the items. Items can be disabled with the `isDisabled` prop. See the [selection guide](selection.md?component=ListBox) for more details.

```tsx
import type {Selection} from 'react-aria-components/ListBox';
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';
import {useState} from 'react';

function Example(props) {
  let [selected, setSelected] = useState(new Set(['cheese']));

  return (
    <div>
      <ListBox
        {...props}
        aria-label="Sandwich contents"
        
        selectedKeys={selected}
        onSelectionChange={setSelected}
      >
        <ListBoxItem id="lettuce">Lettuce
        <ListBoxItem id="tomato">Tomato
        <ListBoxItem id="cheese">Cheese
        <ListBoxItem id="tuna" isDisabled>Tuna Salad
        <ListBoxItem id="egg">Egg Salad
        <ListBoxItem id="ham">Ham
      
      <p>Current selection: {selected === 'all' ? 'all' : [...selected].join(', ')}</p>
    </div>
  );
}
```

## Layouts

Use the `layout` and `orientation` props to create horizontal and vertical stacks and grids. This affects keyboard navigation and drag and drop behavior.

```tsx
import {ListBox, ListBoxItem, Text} from 'vanilla-starter/ListBox';

let planets = [
  {
    id: 1,
    title: 'Mercury',
    description: 'A year lasts 88 days'
  },
  {
    id: 2,
    title: 'Venus',
    description: 'Spins backwards!'
  },
  {
    id: 3,
    title: 'Earth',
    description: 'Only planet with life'
  },
  {
    id: 4,
    title: 'Mars',
    description: 'Has the tallest volcano'
  },
  {
    id: 5,
    title: 'Jupiter',
    description: 'Can fit 1,300 Earths'
  },
  {
    id: 6,
    title: 'Saturn',
    description: 'Rings made of ice'
  },
  {
    id: 7,
    title: 'Uranus',
    description: 'Rolls on its side'
  },
  {
    id: 8,
    title: 'Neptune',
    description: 'Fastest winds in space'
  }
];

<ListBox
  aria-label="Planets"
  /*- begin highlight -*/
  
  /*- end highlight -*/
  items={planets}
  selectionMode="multiple">
  {item => (
    <ListBoxItem textValue={item.title}>
      <Text slot="label">{item.title}
      <Text slot="description">{item.description}
    
  )}

```

## Drag and drop

ListBox supports drag and drop interactions when the `dragAndDropHooks` prop is provided using the `useDragAndDrop` hook. Users can drop data on the list as a whole, on individual items, insert new items between existing ones, or reorder items. React Aria supports drag and drop via mouse, touch, keyboard, and screen reader interactions. See the [drag and drop guide](dnd.md?component=ListBox) to learn more.

```tsx
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';
import {useDragAndDrop} from 'react-aria-components/useDragAndDrop';
import {useListData} from 'react-aria-components/useListData';

function Example() {
  let list = useListData({
    initialItems: [
      {id: 1, name: 'Adobe Photoshop'},
      {id: 2, name: 'Adobe XD'},
      {id: 3, name: 'Adobe Dreamweaver'},
      {id: 4, name: 'Adobe InDesign'},
      {id: 5, name: 'Adobe Connect'}
    ]
  });

  let {dragAndDropHooks} = useDragAndDrop({
    getItems: (keys, items: typeof list.items) => items.map(item => ({'text/plain': item.name})),
    onReorder(e) {
      if (e.target.dropPosition === 'before') {
        list.moveBefore(e.target.key, e.keys);
      } else if (e.target.dropPosition === 'after') {
        list.moveAfter(e.target.key, e.keys);
      }
    }
  });

  return (
    <ListBox
      aria-label="Reorderable list"
      selectionMode="multiple"
      items={list.items}
      dragAndDropHooks={dragAndDropHooks}
    >
      {item => {item.name}}
    
  );
}
```

## Examples

<ExampleList
  tag="listbox"
  pages={props.pages}
/>

## API

```tsx

  
    <Text slot="label" />
    <Text slot="description" />
    
  
  
    
    
  
  

```

### ListBox

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `autoFocus` | `boolean | FocusStrategy | undefined` | — | Whether to auto focus the listbox or an option. |
| `children` | `((item: T) => ReactNode) | React.ReactNode` | — | The contents of the collection. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-ListBox' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultSelectedKeys` | `"all" | Iterable | undefined` | — | The initial selected keys in the collection (uncontrolled). |
| `dependencies` | `readonly any[] | undefined` | — | Values that should invalidate the item cache when using dynamic collections. |
| `dir` | `string | undefined` | — |  |
| `disabledKeys` | `Iterable | undefined` | — | The item keys that are disabled. These items cannot be selected, focused, or otherwise interacted with. |
| `disallowEmptySelection` | `boolean | undefined` | — | Whether the collection allows empty selection. |
| `dragAndDropHooks` | `DragAndDropHooks | undefined` | — | The drag and drop hooks returned by `useDragAndDrop` used to enable drag and drop behavior for the ListBox. |
| `escapeKeyBehavior` | `"clearSelection" | "none" | undefined` | 'clearSelection' | Whether pressing the escape key should clear selection in the listbox or not. Most experiences should not modify this option as it eliminates a keyboard user's ability to easily clear selection. Only use if the escape key is being handled externally or should not trigger selection clearing contextually. |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `items` | `Iterable | undefined` | — | Item objects in the collection. |
| `lang` | `string | undefined` | — |  |
| `layout` | `"grid" | "stack" | undefined` | 'stack' | Whether the items are arranged in a stack or grid. |
| `onAction` | `((key: Key) => void) | undefined` | — | Handler that is called when a user performs an action on an item. The exact user event depends on the collection's `selectionBehavior` prop and the interaction modality. |
| `onAnimationEnd` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationEndCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIteration` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIterationCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStart` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStartCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAuxClick` | `React.MouseEventHandler | undefined` | — |  |
| `onAuxClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onBlur` | `((e: React.FocusEvent) => void) | undefined` | — | Handler that is called when the element loses focus. |
| `onClick` | `React.MouseEventHandler | undefined` | — |  |
| `onClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenu` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenuCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClick` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onFocus` | `((e: React.FocusEvent) => void) | undefined` | — | Handler that is called when the element receives focus. |
| `onFocusChange` | `((isFocused: boolean) => void) | undefined` | — | Handler that is called when the element's focus status changes. |
| `onGotPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onGotPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onLostPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onLostPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onMouseDown` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseDownCapture` | `React.MouseEventHandler | undefined` | — |  |

## API (part 3)

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
| `orientation` | `Orientation | undefined` | 'vertical' | The primary orientation of the items. Usually this is the direction that the collection scrolls. |
| `render` | `DOMRenderFunction<"div", ListBoxRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `renderEmptyState` | `((props: ListBoxRenderProps) => ReactNode) | undefined` | — | Provides content to display when there are no items in the list. |
| `selectedKeys` | `"all" | Iterable | undefined` | — | The currently selected keys in the collection (controlled). |
| `selectionBehavior` | `SelectionBehavior | undefined` | 'toggle' | How multiple selection should behave in the collection. |
| `selectionMode` | `SelectionMode | undefined` | — | The type of selection that is allowed in the collection. |
| `shouldFocusOnHover` | `boolean | undefined` | — | Whether options should be focused when the user hovers over them. |

## API (part 4)

| `shouldFocusWrap` | `boolean | undefined` | — | Whether focus should wrap around when the end/start is reached. |
| `shouldSelectOnPressUp` | `boolean | undefined` | — | Whether selection should occur on press up instead of press down. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: ListBoxRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 5)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-label` | `string | undefined` | — | An accessibility label for this item. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-ListBoxItem' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `dir` | `string | undefined` | — |  |
| `download` | `boolean | string | undefined` | — | Causes the browser to download the linked URL. A string may be provided to suggest a file name. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#download). |
| `hidden` | `boolean | undefined` | — |  |
| `href` | `string | undefined` | — | A URL to link to. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#href). |
| `hrefLang` | `string | undefined` | — | Hints at the human language of the linked URL. See[MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#hreflang). |
| `id` | `Key | undefined` | — | The unique id of the item. |
| `inert` | `boolean | undefined` | — |  |
| `isDisabled` | `boolean | undefined` | — | Whether the item is disabled. |
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
| `onBlur` | `((e: React.FocusEvent<HTMLDivElement, Element>) => void) | undefined` | — | Handler that is called when the element loses focus. |
| `onClick` | `((e: React.MouseEvent) => void) | undefined` | — | **Not recommended – use `onPress` instead.** `onClick` is an alias for `onPress` provided for compatibility with other libraries. `onPress` provides additional event details for non-mouse interactions. |
| `onClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenu` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenuCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClick` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onFocus` | `((e: React.FocusEvent<HTMLDivElement, Element>) => void) | undefined` | — | Handler that is called when the element receives focus. |
| `onFocusChange` | `((isFocused: boolean) => void) | undefined` | — | Handler that is called when the element's focus status changes. |
| `onGotPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onGotPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onHoverChange` | `((isHovering: boolean) => void) | undefined` | — | Handler that is called when the hover state changes. |
| `onHoverEnd` | `((e: HoverEvent) => void) | undefined` | — | Handler that is called when a hover interaction ends. |
| `onHoverStart` | `((e: HoverEvent) => void) | undefined` | — | Handler that is called when a hover interaction starts. |
| `onKeyDown` | `((e: KeyboardEvent) => void) | undefined` | — | Handler that is called when a key is pressed. |
| `onKeyUp` | `((e: KeyboardEvent) => void) | undefined` | — | Handler that is called when a key is released. |
| `onLostPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onLostPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onMouseDown` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseDownCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseEnter` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseLeave` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseMove` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseMoveCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseOut` | `React.MouseEventHandler | undefined` | — |  |

## API (part 6)

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

## API (part 7)

| `render` | `((props: React.DetailedHTMLProps<Required<Pick<React.AnchorHTMLAttributes, "href">> & Omit<React.AnchorHTMLAttributes, "href">, HTMLAnchorElement> | React.DetailedHTMLProps<React.HTMLAttributes, HTMLDivElement>, renderProps: ListBoxItemRenderProps) => React.ReactElement) | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Note: You can check if `'href' in props` in order to tell whether to render an `<a>` element. Requirements: - You must render the expected element type (e.g. if `<a>` is expected, you cannot render a   `<button>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `routerOptions` | `undefined` | — | Options for the configured client side router. |
| `style` | `(((values: ListBoxItemRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `target` | `React.HTMLAttributeAnchorTarget | undefined` | — | The target window for the link. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#target). |
| `textValue` | `string | undefined` | — | A string representation of the item's contents, used for features like typeahead. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `value` | `T | undefined` | — | The object value that this item represents. When using dynamic collections, this is set automatically. |

## API (part 8)

### ListBoxSection

## API (part 9)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-label` | `string | undefined` | — | An accessibility label for the section. |
| `children` | `((item: T) => React.ReactElement) | React.ReactNode` | — | Static child items or a function to render children. |
| `className` | `string | undefined` | 'react-aria-ListBoxSection' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
| `dependencies` | `readonly any[] | undefined` | — | Values that should invalidate the item cache when using dynamic collections. |
| `dir` | `string | undefined` | — |  |
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
| `onTouchCancel` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchCancelCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchEnd` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchEndCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchMove` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchMoveCapture` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchStart` | `React.TouchEventHandler | undefined` | — |  |

## API (part 10)

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
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `value` | `T | undefined` | — | The object value that this section represents. When using dynamic collections, this is set automatically. |

## API (part 11)

### ListBoxLoadMoreItem

## API (part 12)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `React.ReactNode` | — | The load more spinner to render when loading additional items. |
| `className` | `string | undefined` | 'react-aria-ListBoxLoadMoreItem' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
| `dir` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
| `inert` | `boolean | undefined` | — |  |
| `isLoading` | `boolean | undefined` | — | Whether or not the loading spinner should be rendered or not. |
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
| `onLoadMore` | `(() => any) | undefined` | — | Handler that is called when more items should be loaded, e.g. while scrolling near the bottom. |
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
| `onTransitionCancel` | `React.TransitionEventHandler | undefined` | — |  |

