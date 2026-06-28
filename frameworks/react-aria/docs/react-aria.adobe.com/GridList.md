# GridList

## Introduction

A grid list displays a list of interactive items, with support for keyboard navigation,
single or multiple selection, and row actions.

## Vanilla CSS example

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';

## Vanilla CSS example (part 2)

<GridListItem textValue="Desert Sunset">
    <img src="https://images.unsplash.com/photo-1705034598432-1694e203cdf3?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={400} alt="" />
    Desert Sunset
    <Text slot="description">PNG • 2/3/2024
  
  <GridListItem textValue="Hiking Trail">
    <img src="https://images.unsplash.com/photo-1722233987129-61dc344db8b6?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} alt="" />
    Hiking Trail
    <Text slot="description">JPEG • 1/10/2022
  
  <GridListItem textValue="Lion">
    <img src="https://images.unsplash.com/photo-1629812456605-4a044aa38fbc?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={899} alt="" />
    Lion
    <Text slot="description">JPEG • 8/28/2021
  
  <GridListItem textValue="Mountain Sunrise">
    <img src="https://images.unsplash.com/photo-1722172118908-1a97c312ce8c?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} alt="" />
    Mountain Sunrise
    <Text slot="description">PNG • 3/15/2015
  
  <GridListItem textValue="Giraffe tongue">
    <img src="https://images.unsplash.com/photo-1574870111867-089730e5a72b?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} alt="" />
    Giraffe tongue
    <Text slot="description">PNG • 11/27/2019
  
  <GridListItem textValue="Golden Hour">
    <img src="https://images.unsplash.com/photo-1718378037953-ab21bf2cf771?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={402} alt="" />
    Golden Hour
    <Text slot="description">WEBP • 7/24/2024
  
  <GridListItem textValue="Architecture">
    <img src="https://images.unsplash.com/photo-1721661657253-6621d52db753?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDYxfE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D" width={600} height={900} alt="" />
    Architecture
    <Text slot="description">PNG • 12/24/2016
  
  <GridListItem textValue="Peeking leopard">
    <img src="https://images.unsplash.com/photo-1456926631375-92c8ce872def?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={400} alt="" />
    Peeking leopard
    <Text slot="description">JPEG • 3/2/2016
  
  <GridListItem textValue="Roofs">
    <img src="https://images.unsplash.com/photo-1721598359121-363311b3b263?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDc0fE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D" width={600} height={900} alt="" />
    Roofs
    <Text slot="description">JPEG • 4/24/2025
  
  <GridListItem textValue="Half Dome Deer">
    <img src="https://images.unsplash.com/photo-1472396961693-142e6e269027?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={990} alt="" />
    Half Dome Deer
    <Text slot="description">DNG • 8/28/2018

## Vanilla CSS example (part 3)

```

### GridList.tsx

```tsx
'use client';
import {
  Button,
  GridList as AriaGridList,
  GridListItem as AriaGridListItem,
  GridListLoadMoreItem as AriaGridListLoadMoreItem,
  Text,
  GridListSection,
  GridListHeader,
  type GridListItemProps,
  type GridListProps,
  type GridListLoadMoreItemProps
} from 'react-aria-components/GridList';
import {Checkbox} from './Checkbox';
import {GripVertical} from 'lucide-react';
import {ProgressCircle} from './ProgressCircle';
import './GridList.css';

export function GridList({children, layout = 'grid', ...props}: GridListProps) {
  return (
    <AriaGridList {...props} layout={layout}>
      {children}
    
  );
}

export function GridListItem({
  children,
  ...props
}: Omit<GridListItemProps, 'children'> & {
  children?: React.ReactNode;
}) {
  let textValue = typeof children === 'string' ? children : undefined;
  return (
    <AriaGridListItem textValue={textValue} {...props}>
      {({selectionMode, selectionBehavior, allowsDragging}) => (
        <>
          {/* Add elements for drag and drop and selection. */}
          {allowsDragging && (
            <Button slot="drag">
              <GripVertical size={16} />
            
          )}
          {selectionMode === 'multiple' && selectionBehavior === 'toggle' && (
            <Checkbox slot="selection" />
          )}
          {children}
        </>
      )}
    
  );
}

export function GridListLoadMoreItem(props: GridListLoadMoreItemProps) {
  return (
    <AriaGridListLoadMoreItem {...props}>
      <ProgressCircle isIndeterminate aria-label="Loading more..." />
    
  );
}

export {GridListSection, GridListHeader, Text};

```

### GridList.css

```css
@import './theme.css';

.react-aria-GridList {
  justify-content: center;
  gap: var(--spacing-4);
  padding: var(--spacing-2);
  scroll-padding: var(--spacing-2);
  border-radius: var(--radius);
  max-height: inherit;
  overflow: auto;
  forced-color-adjust: none;
  outline: none;
  width: 100%;
  max-height: 500px;
  min-height: 100px;
  box-sizing: border-box;
  --grid-item-size: 200px;

  &:has(.react-aria-GridListSection) {
    scroll-padding: 50px;
  }

  &[data-layout='grid']:not(:has(.react-aria-GridListSection)):not([data-empty]) {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(100px, var(--grid-item-size)));
    grid-auto-rows: min-content;
  }

  &[data-layout='grid'] > .react-aria-GridListSection {
    grid-template-columns: repeat(auto-fit, minmax(100px, var(--grid-item-size)));
    grid-auto-rows: min-content;
  }

  .react-aria-GridListSection:not(:first-child) {
    margin-top: var(--spacing-4);
  }

  &[data-layout='stack'] > .react-aria-GridListSection {
    grid-template-columns: auto;
    align-items: center;
  }

  &[data-size='small'] {
    --grid-item-size: 150px;
  }

  @media (width < 500px) {
    &[data-layout='grid'] {
      --grid-item-size: 150px;
    }

    &[data-layout='grid']:not(:has(.react-aria-GridListSection)) {
      grid-template-columns: 1fr 1fr;
    }
  }

  &[data-layout='stack']:not([data-empty]) {
    display: grid;
    grid-template-columns: auto;
    align-items: center;

## Vanilla CSS example (part 4)

&[data-orientation='horizontal'] {
      display: flex;
      flex-direction: row;
      justify-content: normal;

      .react-aria-GridListItem {
        flex-shrink: 0;
        width: var(--grid-item-size);
      }
    }
  }

  &[data-layout='grid'][data-orientation='horizontal'] {
    grid-auto-flow: column;
    grid-template-rows: auto auto;
    grid-template-columns: none;
    grid-auto-columns: var(--grid-item-size);
    justify-content: normal;
    max-height: none;
  }

  &[data-focus-visible] {
    outline: 2px solid var(--focus-ring-color);
  }

  &[data-empty] {
    display: flex;
    align-items: center;
    justify-content: center;
    font-style: italic;
  }

  &[data-drop-target] {
    outline: 2px solid var(--highlight-background);
    outline-offset: -1px;
    background: var(--highlight-overlay);
  }

  .react-aria-DropIndicator {
    display: none;
    &[data-drop-target] {
      display: block;
      outline: 2px solid var(--highlight-background);
      outline-offset: -1px;
      background: var(--highlight-overlay);
      border-radius: var(--radius);
    }
  }
}

.react-aria-GridListItem {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-2);
  border-radius: var(--radius);
  outline: none;
  cursor: default;
  color: var(--text-color);
  font: var(--font-size) system-ui;
  box-sizing: border-box;
  padding-bottom: var(--spacing-4);
  background: var(--overlay-background);
  box-shadow: 0 2px 8px rgb(0 0 0 / 0.15);
  min-width: 0;
  max-width: 250px;
  overflow: clip;
  position: relative;
  transform: translateZ(0);
  transition-property: scale;
  transition-duration: 200ms;
  -webkit-tap-highlight-color: transparent;

  &[data-focus-visible] {
    outline: 2px solid var(--focus-ring-color);
    outline-offset: 2px;
  }

  &[data-pressed] {
    scale: 0.98;
  }

  &::after {
    content: '';
    position: absolute;
    inset: 0;
    pointer-events: none;
    border-radius: inherit;
    border: 2px solid light-dark(black, white);
    outline: 2px solid light-dark(rgb(255 255 255 / 0.7), rgb(0 0 0 / 0.7));
    outline-offset: -4px;
    opacity: 0;
    transition: opacity 200ms;
  }

  &[data-selected] {
    &::after {
      opacity: 1;
    }
  }

  &[data-href] {
    cursor: pointer;
  }

  &[data-disabled] {
    color: var(--text-color-disabled);
  }

  .react-aria-CheckboxField {
    position: absolute;
    top: var(--spacing-4);
    inset-inline-start: var(--spacing-4);

    .react-aria-CheckboxButton {
      --focus-ring-color: var(--highlight-foreground);
      --checkmark-color: light-dark(white, black);

      .indicator {
        --indicator-border: light-dark(rgb(0 0 0 / 0.9), rgb(255 255 255 / 0.7));

        @media (forced-colors: active) {
          --indicator-border: ButtonBorder;
        }
      }

      &[data-selected] .indicator {
        --indicator-color: light-dark(black, var(--highlight-foreground));
        --indicator-shadow: transparent;

        @media (forced-colors: active) {
          --indicator-color: Highlight;
          --checkmark-color: HighlightText;
        }
      }

## Vanilla CSS example (part 5)

&::before {
        content: '';
        position: absolute;
        inset: -4px;
        background: light-dark(rgb(255 255 255 / 0.51), rgb(0 0 0 / 0.56));
        box-shadow: rgba(0, 0, 0, 0.24) 0px 2px 8px 0px;
        border-radius: var(--radius);
      }
    }
  }

  img {
    width: 100%;
    height: var(--grid-item-size);
    object-fit: cover;
    padding-bottom: var(--spacing-2);
    -webkit-user-drag: none;
    -webkit-touch-callout: none;
    flex-shrink: 0;
  }

  .react-aria-Text {
    padding: 0 var(--spacing-4);
    display: -webkit-box;
    overflow: hidden;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;

    &:not([slot]) {
      font-weight: 500;
    }

    &[slot='description'] {
      font-size: var(--font-size-sm);
    }
  }

  .react-aria-Button[slot='drag'] {
    all: unset;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    position: absolute;
    bottom: var(--spacing-2);
    inset-inline-end: var(--spacing-2);
    border-radius: var(--radius);
    color: var(--text-color);

    &[data-focus-visible] {
      border-radius: 4px;
      outline: 2px solid var(--focus-ring-color);
    }
  }

  &[data-dragging] {
    opacity: 0.6;
  }

  &[data-drop-target] {
    &::before {
      content: '';
      position: absolute;
      inset: 0;
      border-radius: inherit;
      z-index: 5;
      outline: 2px solid var(--highlight-background);
      outline-offset: -2px;
      background: var(--highlight-overlay);
    }
  }
}

.react-aria-GridListLoadingIndicator {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 24px;
  width: 100%;
}

.react-aria-GridListSection {
  display: grid;
  justify-content: center;
  gap: var(--spacing-4);
  color: var(--text-color);
  width: 100%;

  > .react-aria-GridListHeader {
    grid-column: 1 / -1;
  }
}

.react-aria-GridListHeader {
  position: sticky;
  z-index: 2;
  top: calc(var(--spacing-2) * -1);
  font-size: var(--font-size-lg);
  font-weight: 500;
  background: var(--gray-100);
  border: 0.5px solid var(--gray-400);
  cursor: default;
  user-select: none;
  box-shadow:
    inset 0px 1px 0px white,
    inset 0px -4px 8px var(--gray-200);
  border-radius: var(--radius);
  padding: var(--spacing-1) var(--spacing-4);

  @media (prefers-color-scheme: dark) {
    box-shadow: inset 0px 4px 8px var(--gray-200);
  }
}

```

## Tailwind example

```tsx
import {GridList, GridListItem} from 'tailwind-starter/GridList';

  Aardvark
  Cat
  Dog
  Kangaroo
  Panda
  Snake

```

### GridList.tsx

```tsx
'use client';
import React from 'react';
import {
  GridList as AriaGridList,
  GridListItem as AriaGridListItem,
  GridListHeader as AriaGridListHeader,
  Button,
  type GridListItemProps,
  type GridListProps
} from 'react-aria-components/GridList';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {tv} from 'tailwind-variants';
import {Checkbox} from './Checkbox';
import {composeTailwindRenderProps, focusRing} from './utils';
import {type HTMLAttributes} from 'react';
import {twMerge} from 'tailwind-merge';

export function GridList({children, ...props}: GridListProps) {
  let isHorizontal =
    (props as {orientation?: 'horizontal' | 'vertical'}).orientation === 'horizontal';
  return (
    <AriaGridList
      {...props}
      className={composeTailwindRenderProps(
        props.className,
        isHorizontal
          ? 'flex flex-row flex-nowrap overflow-x-auto relative w-full max-w-[500px] bg-white dark:bg-neutral-900 border border-neutral-300 dark:border-neutral-700 rounded-lg font-sans empty:flex empty:items-center empty:justify-center empty:italic empty:text-sm'
          : 'overflow-auto w-[200px] relative bg-white dark:bg-neutral-900 border border-neutral-300 dark:border-neutral-700 rounded-lg font-sans empty:flex empty:items-center empty:justify-center empty:italic empty:text-sm'
      )}>
      {children}
    
  );
}

const itemStyles = tv({
  extend: focusRing,
  base: [
    'relative flex gap-3 cursor-default select-none py-2 px-3 text-sm text-neutral-900 dark:text-neutral-200 border-transparent -outline-offset-2',
    '[[data-orientation=vertical]_&]:border-t [[data-orientation=vertical]_&]:dark:border-t-neutral-700 [[data-orientation=vertical]_&]:first:border-t-0 [[data-orientation=vertical]_&]:first:rounded-t-lg [[data-orientation=vertical]_&]:last:rounded-b-lg',
    '[[data-orientation=horizontal]_&]:border-l [[data-orientation=horizontal]_&]:dark:border-l-neutral-700 [[data-orientation=horizontal]_&]:first:border-l-0 [[data-orientation=horizontal]_&]:first:rounded-s-lg [[data-orientation=horizontal]_&]:last:rounded-e-lg [[data-orientation=horizontal]_&]:flex-shrink-0'
  ].join(' '),
  variants: {
    isSelected: {
      false:
        'hover:bg-neutral-100 pressed:bg-neutral-100 dark:hover:bg-neutral-700/60 dark:pressed:bg-neutral-700/60',
      true: [
        'bg-blue-100 dark:bg-blue-700/30 hover:bg-blue-200 pressed:bg-blue-200 dark:hover:bg-blue-700/40 dark:pressed:bg-blue-700/40 z-20',
        '[[data-orientation=vertical]_&]:border-y-blue-200 [[data-orientation=vertical]_&]:dark:border-y-blue-900',
        '[[data-orientation=horizontal]_&]:border-x-blue-200 [[data-orientation=horizontal]_&]:dark:border-x-blue-900 '
      ].join(' ')
    },
    isDisabled: {
      true: 'text-neutral-300 dark:text-neutral-600 forced-colors:text-[GrayText] z-10'
    }
  }
});

## Tailwind example (part 2)

export function GridListItem({children, ...props}: GridListItemProps) {
  let textValue = typeof children === 'string' ? children : undefined;
  return (
    <AriaGridListItem textValue={textValue} {...props} className={itemStyles}>
      {composeRenderProps(
        children,
        (children, {selectionMode, selectionBehavior, allowsDragging}) => (
          <>
            {/* Add elements for drag and drop and selection. */}
            {allowsDragging && <Button slot="drag">≡}
            {selectionMode !== 'none' && selectionBehavior === 'toggle' && (
              <Checkbox slot="selection" />
            )}
            {children}
          </>
        )
      )}
    
  );
}

export function GridListHeader({children, ...props}: HTMLAttributes) {
  return (
    <AriaGridListHeader
      {...props}
      className={twMerge(
        'text-sm font-semibold text-neutral-500 dark:text-neutral-300 px-4 py-1 -mt-px z-10 bg-neutral-100/60 dark:bg-neutral-700/60 backdrop-blur-md supports-[-moz-appearance:none]:bg-neutral-100 border-y border-y-neutral-200 dark:border-y-neutral-700',
        props.className
      )}>
      {children}
    
  );
}

```

## Content

`GridList` follows the [Collection Components API](collections.md?component=GridList), accepting both static and dynamic collections. This example shows a dynamic collection, passing a list of objects to the `items` prop, and a function to render the children.

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';

## Content (part 4)

image: "https://images.unsplash.com/photo-1737496538329-a59d10148a08?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "VhKJHOz2tJ8",
    title: "Heart Nebula",
    user: "Arnaud Girault",
    image: "https://images.unsplash.com/photo-1737478598284-b9bc11cb1e9b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 266
  },
  {
    id: "w5QmH_uqB0U",
    title: "A pile of shells sitting on top of a sandy beach",
    user: "Toa Heftiba",
    image: "https://images.unsplash.com/photo-1725366351350-a64a1be919ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  }
];

## Content (part 5)

function Example() {
  return (
    <GridList
      aria-label="Nature photos"
      selectionMode="multiple"
      layout="grid"
      /*- begin highlight -*/
      items={images}>
      {/*- end highlight -*/}
      {(image) => (
        <GridListItem textValue={image.title}>
          <img src={image.image} width={image.width} height={image.height} alt="" />
          {image.title}
          <Text slot="description">By {image.user}
        
      )}
    
  );
}
```

### Asynchronous loading

Use [renderEmptyState](#empty-state) to display a spinner during initial load. To enable infinite scrolling, render a `` at the end of the list. Use whatever data fetching library you prefer – this example uses `useAsyncList` from `react-stately`.

```tsx
import {GridList, GridListItem, GridListLoadMoreItem, Text} from 'vanilla-starter/GridList';
import {Collection} from 'react-aria-components/Collection';
import {useAsyncList} from 'react-aria-components/useAsyncList';
import {ProgressCircle} from 'vanilla-starter/ProgressCircle';

type Item = {
  id: string;
  description?: string;
  alt_description?: string;
  urls: {regular: string};
  width: number;
  height: number;
  user: {name: string};
};

function AsyncLoadingExample() {
  let list = useAsyncList<Item, number | null>({
    async load({signal, cursor, items}) {
      let page = cursor || 1;
      let res = await fetch(
        `https://api.unsplash.com/topics/nature/photos?page=${page}&per_page=30&client_id=AJuU-FPh11hn7RuumUllp4ppT8kgiLS7LtOHp_sp4nc`,
        {signal}
      );
      let nextItems = await res.json();
      // Filter duplicates which might be returned by the API.
      let existingKeys = new Set(items.map(i => i.id));
      nextItems = nextItems.filter(i => !existingKeys.has(i.id) && (i.description || i.alt_description));
      return {items: nextItems, cursor: nextItems.length ? page + 1 : null};
    }
  });

  return (
    <GridList
      aria-label="Nature photos"
      layout="grid"
      selectionMode="multiple"
      renderEmptyState={() => (
        <ProgressCircle isIndeterminate aria-label="Loading..." />
      )}>
      <Collection items={list.items}>
        {(item) => (
          <GridListItem textValue={item.description || item.alt_description}>
            <img src={item.urls.regular} width={item.width} height={item.height} alt="" />
            {item.description || item.alt_description}
            <Text slot="description">By {item.user.name}
          
        )}
      
      {/*- begin highlight -*/}
      <GridListLoadMoreItem
        onLoadMore={list.loadMore}
        isLoading={list.loadingState === 'loadingMore'} />
      {/*- end highlight -*/}
    
  );
}
```

### Links

Use the `href` prop on a `` to create a link. Link interactions vary depending on the selection behavior. See the [selection guide](selection.md?component=GridList#selection-behavior) for more details.

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';

## Content (part 6)

let images = [
  {
    id: "dxylfBs2Xzc",
    title: "Tropical island",
    image: "https://images.unsplash.com/photo-1757258632083-e9b8a5345047?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTc2MDYyMjY4NHw&ixlib=rb-4.1.0&q=80&w=1080",
    width: 5464,
    height: 3640,
    href: "https://unsplash.com/photos/aerial-view-of-a-tropical-island-coastline-with-clear-blue-water-dxylfBs2Xzc"
  },
  {
    id: "xloDEfz0X7g",
    title: "Bryce Canyon",
    image: "https://images.unsplash.com/photo-1759872409669-05565abbb575?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTc2MDYyMjY4NHw&ixlib=rb-4.1.0&q=80&w=1080",
    width: 4032,
    height: 3024,
    href: "https://unsplash.com/photos/orange-rock-formations-with-green-trees-and-blue-sky-xloDEfz0X7g"
  },
  {
    id: "oTBY78rZcEU",
    title: "Snowy river",
    image: "https://images.unsplash.com/photo-1735577561802-380c3afb0146?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTc2MDYyMjY4NHw&ixlib=rb-4.1.0&q=80&w=1080",
    width: 3264,
    height: 4896,
    href: "https://unsplash.com/photos/a-river-surrounded-by-snow-covered-trees-and-mountains-oTBY78rZcEU"
  },
  {
    id: "Go811IU9a2g",
    title: "Ocean waves",
    image: "https://images.unsplash.com/photo-1759997604062-c31f20012ac1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTc2MDYyMjY4NHw&ixlib=rb-4.1.0&q=80&w=1080",
    width: 5250,
    height: 3500,
    href: "https://unsplash.com/photos/a-large-wave-crashes-on-a-sandy-beach-Go811IU9a2g"
  },
  {
    id: "B0mydNIV-sI",
    title: "Mount Kazbek at Dawn",
    image: "https://images.unsplash.com/photo-1760464864365-2188cd2afcde?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTc2MDYyMjY4NHw&ixlib=rb-4.1.0&q=80&w=1080",
    width: 3947,
    height: 5920,
    href: "https://unsplash.com/photos/snow-capped-mountain-peak-illuminated-by-sunrise-B0mydNIV-sI"
  },
  {
    id: "IHfbPJYsnsI",
    title: "Snowy mountain sunrise",
    image: "https://images.unsplash.com/photo-1759675795062-a657fcb278b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTc2MDYyMjY4NHw&ixlib=rb-4.1.0&q=80&w=1080",
    width: 5794,
    height: 3360,
    href: "https://unsplash.com/photos/snowy-mountains-rise-from-the-ocean-at-sunrise-IHfbPJYsnsI"
  },
  {
    id: "mmcSaJrRuCM",
    title: "Mount Blum",
    image: "https://images.unsplash.com/photo-1760301269447-fbc82b5a8d14?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTc2MDYyMjY4NHw&ixlib=rb-4.1.0&q=80&w=1080",
    width: 5862,
    height: 4000,
    href: "https://unsplash.com/photos/majestic-mountain-peak-illuminated-by-sunrise-light-mmcSaJrRuCM"
  },
  {
    id: "SSpEIUBRG9s",
    title: "Sunset",
    image: "https://images.unsplash.com/photo-1760199025509-2ecc68d39acd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTc2MDYyMjY4NHw&ixlib=rb-4.1.0&q=80&w=1080",
    width: 6000,
    height: 4000,
    href: "https://unsplash.com/photos/silhouette-of-trees-and-plants-against-a-sunset-sky-SSpEIUBRG9s"
  }
];

## Content (part 7)

<GridList layout="grid" items={images}>
  {image => (
    <GridListItem
      /*- begin highlight -*/
      href={image.href}
      target="_blank"
      /*- end highlight -*/
      textValue={image.title}>
      <img src={image.image} width={image.width} height={image.height} alt="" />
      {image.title}
    
  )}

```

<InlineAlert
  variant="notice"
  UNSAFE_style={{marginTop: '2rem'}}
>
  Client-side routing
  Due to [HTML spec limitations](https://github.com/w3c/html-aria/issues/473), GridListItems cannot be rendered as `<a>` elements. React Aria handles link clicks with JavaScript and triggers native navigation. When using a client-side router, use the `onAction` event to programmatically trigger navigation instead of the `href` prop.

### Empty state

```tsx
import {GridList} from 'vanilla-starter/GridList';

<GridList
  aria-label="Search results"
  renderEmptyState={() => 'No results found.'}>
  {[]}

```

### Sections (alpha)

Use the `` component to group options. A `` element may also be included to label the section. Sections without a header must have an `aria-label`.

```tsx
import {GridList, GridListItem, GridListHeader, GridListSection, Text} from 'vanilla-starter/GridList';

## Content (part 8)

<GridList
  layout="grid"
  aria-label="Photos">
    
      Fruit
      <GridListItem textValue="Apple">
        <img src="https://images.unsplash.com/photo-1630563451961-ac2ff27616ab?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={400} />
        Apple
        <Text slot="description">PNG • 9/2/2021
      
      <GridListItem textValue="Peach">
        <img src="https://images.unsplash.com/photo-1642372849486-f88b963cb734?q=80&w=2858&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} />
        Peach
        <Text slot="description">JPEG • 1/16/2022
      
      <GridListItem textValue="Blueberry">
        <img src="https://images.unsplash.com/photo-1606757389667-45c2024f9fa4?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} />
        Blueberry
        <Text slot="description">JPEG • 11/30/2020
      
    
    
      Vegetables
      <GridListItem textValue="Broccoli">
        <img src="https://images.unsplash.com/photo-1685504445355-0e7bdf90d415?q=80&w=928&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} />
        Broccoli
        <Text slot="description">PNG • 5/30/2023
      
      <GridListItem textValue="Brussels Sprouts">
        <img src="https://images.unsplash.com/photo-1685504507286-dc290728c01a?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} />
        Brussels Sprouts
        <Text slot="description">PNG • 7/3/2021
      
      <GridListItem textValue="Peas">
        <img src="https://images.unsplash.com/photo-1587411768345-867e228218c8?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} />
        Peas
        <Text slot="description">PNG • 4/20/2020
      
    

```

## Selection and actions

Use the `selectionMode` prop to enable single or multiple selection. The selected items can be controlled via the `selectedKeys` prop, matching the `id` prop of the items. The `onAction` event handles item actions. Items can be disabled with the `isDisabled` prop. See the [selection guide](selection.md?component=GridList) for more details.

```tsx
import type {Selection} from 'react-aria-components/GridList';
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';
import {useState} from 'react';

function Example(props) {
  let [selected, setSelected] = useState(new Set());

## Selection and actions (part 2)

return (
    <>
      <GridList
        {...props}
        aria-label="Nature photos"
        layout="grid"
        
        selectedKeys={selected}
        onSelectionChange={setSelected}
        onAction={key => alert(`Clicked ${key}`)}
      >
        <GridListItem id={1} textValue="Desert Sunset">
          <img src="https://images.unsplash.com/photo-1705034598432-1694e203cdf3?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={400} alt="" />
          Desert Sunset
          <Text slot="description">PNG • 2/3/2024
        
        <GridListItem id={2} isDisabled textValue="Hiking Trail">
          <img src="https://images.unsplash.com/photo-1722233987129-61dc344db8b6?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} alt="" />
          Hiking Trail
          <Text slot="description">JPEG • 1/10/2022
        
        <GridListItem id={3} textValue="Lion">
          <img src="https://images.unsplash.com/photo-1629812456605-4a044aa38fbc?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={899} alt="" />
          Lion
          <Text slot="description">JPEG • 8/28/2021
        
        <GridListItem id={4} textValue="Mountain Sunrise">
          <img src="https://images.unsplash.com/photo-1722172118908-1a97c312ce8c?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} alt="" />
          Mountain Sunrise
          <Text slot="description">PNG • 3/15/2015
        
        <GridListItem id={5} textValue="Giraffe tongue">
          <img src="https://images.unsplash.com/photo-1574870111867-089730e5a72b?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} alt="" />
          Giraffe tongue
          <Text slot="description">PNG • 11/27/2019
        
        <GridListItem id={6} textValue="Golden Hour">
          <img src="https://images.unsplash.com/photo-1718378037953-ab21bf2cf771?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={402} alt="" />
          Golden Hour
          <Text slot="description">WEBP • 7/24/2024
        
        <GridListItem id={7} textValue="Architecture">
          <img src="https://images.unsplash.com/photo-1721661657253-6621d52db753?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDYxfE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D" width={600} height={900} alt="" />
          Architecture
          <Text slot="description">PNG • 12/24/2016
        
        <GridListItem id={8} textValue="Peeking leopard">
          <img src="https://images.unsplash.com/photo-1456926631375-92c8ce872def?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={400} alt="" />
          Peeking leopard
          <Text slot="description">JPEG • 3/2/2016
        
        <GridListItem id={9} textValue="Roofs">
          <img src="https://images.unsplash.com/photo-1721598359121-363311b3b263?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDc0fE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D" width={600} height={900} alt="" />
          Roofs
          <Text slot="description">JPEG • 4/24/2025
        
        <GridListItem id={10} textValue="Half Dome Deer">
          <img src="https://images.unsplash.com/photo-1472396961693-142e6e269027?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={990} alt="" />
          Half Dome Deer
          <Text slot="description">DNG • 8/28/2018
        
      
      <p>Current selection: {selected === 'all' ? 'all' : [...selected].join(', ')}</p>
    </>
  );
}
```

## Layouts

Use the `layout` and `orientation` props to arrange items in horizontal and vertical stacks and grids. This affects keyboard navigation and drag and drop behavior.

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';

let photos = [
  {id: 1, title: 'Desert Sunset', description: 'PNG • 2/3/2024', src: 'https://images.unsplash.com/photo-1705034598432-1694e203cdf3?q=80&w=600&auto=format&fit=crop'},
  {id: 2, title: 'Hiking Trail', description: 'JPEG • 1/10/2022', src: 'https://images.unsplash.com/photo-1722233987129-61dc344db8b6?q=80&w=600&auto=format&fit=crop'},
  {id: 3, title: 'Lion', description: 'JPEG • 8/28/2021', src: 'https://images.unsplash.com/photo-1629812456605-4a044aa38fbc?q=80&w=600&auto=format&fit=crop'},
  {id: 4, title: 'Mountain Sunrise', description: 'PNG • 3/15/2015', src: 'https://images.unsplash.com/photo-1722172118908-1a97c312ce8c?q=80&w=600&auto=format&fit=crop'},
  {id: 5, title: 'Giraffe tongue', description: 'PNG • 11/27/2019', src: 'https://images.unsplash.com/photo-1574870111867-089730e5a72b?q=80&w=600&auto=format&fit=crop'},
  {id: 6, title: 'Golden Hour', description: 'WEBP • 7/24/2024', src: 'https://images.unsplash.com/photo-1718378037953-ab21bf2cf771?q=80&w=600&auto=format&fit=crop'},
];

<GridList
  /*- begin highlight -*/
  
  /*- end highlight -*/
  aria-label="Photos"
  items={photos}
  selectionMode="multiple">
  {item => (
    <GridListItem textValue={item.title}>
      <img src={item.src} alt="" />
      {item.title}
      <Text slot="description">{item.description}
    
  )}

```

## Drag and drop

GridList supports drag and drop interactions when the `dragAndDropHooks` prop is provided using the `useDragAndDrop` hook. Users can drop data on the list as a whole, on individual items, insert new items between existing ones, or reorder items. React Aria supports drag and drop via mouse, touch, keyboard, and screen reader interactions. See the [drag and drop guide](dnd.md?component=GridList) to learn more.

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';
import {useDragAndDrop} from 'react-aria-components/useDragAndDrop';
import {useListData} from 'react-aria-components/useListData';

## Drag and drop (part 2)

let images = [
  {
    id: "8SXaMMWCTGc",
    title: "A Ficus Lyrata Leaf in the sunlight (2/2) (IG: @clay.banks)",
    user: "Clay Banks",
    image: "https://images.unsplash.com/photo-1580133318324-f2f76d987dd8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "pYjCqqDEOFo",
    title: "beach of Italy",
    user: "alan bajura",
    image: "https://images.unsplash.com/photo-1737100522891-e8946ac97fd1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "CF-2tl6MQj0",
    title: "A winding road in the middle of a forest",
    user: "Artem Stoliar",
    image: "https://images.unsplash.com/photo-1738249034651-1896f689be58?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 300
  },
  {
    id: "OW97sLU0cOw",
    title: "A green and purple aurora over a snow covered forest",
    user: "Janosch Diggelmann",
    image: "https://images.unsplash.com/photo-1738189669835-61808a9d5981?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "WfeLZ02IhkM",
    title: "A blue and white firework is seen from above",
    user: "Janosch Diggelmann",
    image: "https://images.unsplash.com/photo-1738168601630-1c1f3ef5a95a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 300
  },
  {
    id: "w1GpST72Bg8",
    title: "A snow covered mountain with a sky background",
    user: "Daniil Silantev",
    image: "https://images.unsplash.com/photo-1738165170747-ecc6e3a4d97c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 267
  },
  {
    id: "0iN0KIt6lYI",
    title: "\"Pastel Sunset\"",
    user: "Marek Piwnicki",
    image: "https://images.unsplash.com/photo-1737917818689-f3b3708de5d7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 640
  },
  {
    id: "-mFKPfXXUG0",
    title: "Leave the weight behind! You must make yourself light to strive upwards — to reach the light. (A serene winter landscape featuring a dense collection of bare, white trees.)",
    user: "Simon Berger",
    image: "https://images.unsplash.com/photo-1737972970322-cc2e255021bd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 400
  },
  {
    id: "MOk6URQ28R4",
    title: "A snow covered tree with a sky background",
    user: "Daniil Silantev",
    image: "https://images.unsplash.com/photo-1738081359113-a7a33c509cf9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "y36Nj_edtRE",
    title: "A lake surrounded by trees covered in snow",
    user: "Daniel Seßler",
    image: "https://images.unsplash.com/photo-1736018545810-3de4c7ec25fa?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "NvBV-YwlgBw",
    title: "The night sky with stars above a rock formation",
    user: "Dennis Haug",
    image: "https://images.unsplash.com/photo-1735528655501-cf671a3323c3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 400
  },
  {
    id: "UthQdrPFxt0",
    title: "A pine tree covered in snow in a forest",
    user: "Anita Austvika",
    image: "https://images.unsplash.com/photo-1737312905026-5dfdff1097bc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "2k74xaf8dfc",
    title: "The sun shines through the trees in the forest",
    user: "Joyce G",

## Drag and drop (part 3)

image: "https://images.unsplash.com/photo-1736185597807-371cae1c7e4e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "Yje5kgfvCm0",
    title: "A blurry photo of a field of flowers",
    user: "Eugene Golovesov",
    image: "https://images.unsplash.com/photo-1736483065204-e55e62092780?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "G2bsj2LVttI",
    title: "A foggy road lined with trees and grass",
    user: "Ingmar H",
    image: "https://images.unsplash.com/photo-1737903071772-4d20348b4d81?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 533
  },
  {
    id: "ppyNBOkfiuY",
    title: "A close up of a green palm tree",
    user: "Junel Mujar",
    image: "https://images.unsplash.com/photo-1736849544918-6ddb5cfc2c42?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 533
  },
  {
    id: "UcWUMqIsld8",
    title: "A green leaf floating on top of a body of water",
    user: "Allec Gomes",
    image: "https://images.unsplash.com/photo-1737559217439-a5703e9b65cb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "xHqOVq9w8OI",
    title: "green-leafed plant",
    user: "Joshua Michaels",
    image: "https://images.unsplash.com/photo-1563364664-399838d1394c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 266
  },
  {
    id: "uWx3_XEc-Jw",
    title: "A view of a mountain covered in fog",
    user: "iuliu illes",
    image: "https://images.unsplash.com/photo-1737403428945-c584529b7b17?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 298
  },
  {
    id: "2_3lhGt8i-Y",
    title: "A field with tall grass and fog in the background",
    user: "Ingmar H",
    image: "https://images.unsplash.com/photo-1737439987404-a3ee9fb95351?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "FV-__IOxb08",
    title: "A close up of a wave on a sandy beach",
    user: "Jonathan Borba",
    image: "https://images.unsplash.com/photo-1726502102472-2108ef2a5cae?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "_BS-vK3boOU",
    title: "Desert textures",
    user: "Braden Jarvis",
    image: "https://images.unsplash.com/photo-1722359546494-8e3a00f88e95?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 561
  },
  {
    id: "LjAcS9lJdBg",
    title: "Tew Falls, waterfall, in Hamilton, Canada.",
    user: "Andre Portolesi",
    image: "https://images.unsplash.com/photo-1705021246536-aecfad654893?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 500
  },
  {
    id: "hlj6xJG30FE",
    title: "Find me on Instagram! @intricateexplorer",
    user: "Intricate Explorer",
    image: "https://images.unsplash.com/photo-1631641551473-fbe46919289d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 267
  },
  {
    id: "vMoZvKeZOhw",
    title: "Salt Marshes, Isle of Harris, Scotland by Nils Leonhardt. Visit my website: https://nilsleonhardt.com/storytelling-harris/ Instagram: @am.basteir",
    user: "Nils Leonhardt",
    image: "https://images.unsplash.com/photo-1585951301678-8fd6f3b32c7e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "wCLCK9LDDjI",

## Drag and drop (part 4)

title: "An aerial view of a snow covered forest",
    user: "Lukas Hädrich",
    image: "https://images.unsplash.com/photo-1737405555489-78b3755eaa81?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 267
  },
  {
    id: "OdDx3_NB-Wk",
    title: "A close up of a tall grass with a sky in the background",
    user: "Ingmar H",
    image: "https://images.unsplash.com/photo-1737301519296-062cd324dbfa?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "Gn-FOw1geFc",
    title: "Larches on Maple Pass, Washington",
    user: "noelle",
    image: "https://images.unsplash.com/photo-1737496538329-a59d10148a08?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    id: "VhKJHOz2tJ8",
    title: "IC 1805 La nébuleuse du coeur",
    user: "arnaud girault",
    image: "https://images.unsplash.com/photo-1737478598284-b9bc11cb1e9b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 266
  },
  {
    id: "w5QmH_uqB0U",
    title: "A pile of shells sitting on top of a sandy beach",
    user: "Toa Heftiba",
    image: "https://images.unsplash.com/photo-1725366351350-a64a1be919ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  }
];

## Drag and drop (part 5)

function Example() {
  let list = useListData({
    initialItems: images
  });

  let {dragAndDropHooks} = useDragAndDrop({
    getItems: (keys, items: typeof list.items) => items.map(item => ({'text/plain': item.title})),
    onReorder(e) {
      if (e.target.dropPosition === 'before') {
        list.moveBefore(e.target.key, e.keys);
      } else if (e.target.dropPosition === 'after') {
        list.moveAfter(e.target.key, e.keys);
      }
    }
  });

  return (
    <GridList
      aria-label="Reorderable list"
      layout="grid"
      selectionMode="multiple"
      items={list.items}
      dragAndDropHooks={dragAndDropHooks}
    >
      {image => (
        <GridListItem textValue={image.title}>
          <img src={image.image} width={image.width} height={image.height} alt="" />
          {image.title}
          <Text slot="description">{image.user}
        
      )}
    
  );
}
```

## Examples

<ExampleList
  tag="gridlist"
  pages={props.pages}
/>

## API

```tsx

  
    <Button slot="drag" />
    <Checkbox slot="selection" /> or 
  
  

```

### GridList

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `autoFocus` | `boolean | FocusStrategy | undefined` | — | Whether to auto focus the gridlist or an option. |
| `children` | `((item: T) => ReactNode) | React.ReactNode` | — | The contents of the collection. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-GridList' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultSelectedKeys` | `"all" | Iterable | undefined` | — | The initial selected keys in the collection (uncontrolled). |
| `dependencies` | `readonly any[] | undefined` | — | Values that should invalidate the item cache when using dynamic collections. |
| `dir` | `string | undefined` | — |  |
| `disabledBehavior` | `DisabledBehavior | undefined` | 'all' | Whether `disabledKeys` applies to all interactions, or only selection. |
| `disabledKeys` | `Iterable | undefined` | — | The item keys that are disabled. These items cannot be selected, focused, or otherwise interacted with. |
| `disallowEmptySelection` | `boolean | undefined` | — | Whether the collection allows empty selection. |
| `disallowTypeAhead` | `boolean | undefined` | false | Whether typeahead navigation is disabled. |
| `dragAndDropHooks` | `DragAndDropHooks | undefined` | — | The drag and drop hooks returned by `useDragAndDrop` used to enable drag and drop behavior for the GridList. |
| `escapeKeyBehavior` | `"clearSelection" | "none" | undefined` | 'clearSelection' | Whether pressing the escape key should clear selection in the grid list or not. Most experiences should not modify this option as it eliminates a keyboard user's ability to easily clear selection. Only use if the escape key is being handled externally or should not trigger selection clearing contextually. |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `items` | `Iterable | undefined` | — | Item objects in the collection. |
| `keyboardNavigationBehavior` | `"arrow" | "tab" | undefined` | 'arrow' | Whether keyboard navigation to focusable elements within grid list items is via the left/right arrow keys or the tab key. |
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

## API (part 3)

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
| `render` | `DOMRenderFunction<"div", GridListRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `renderEmptyState` | `((props: GridListRenderProps) => ReactNode) | undefined` | — | Provides content to display when there are no items in the list. |
| `selectedKeys` | `"all" | Iterable | undefined` | — | The currently selected keys in the collection (controlled). |
| `selectionBehavior` | `SelectionBehavior | undefined` | 'toggle' | How multiple selection should behave in the collection. |
| `selectionMode` | `SelectionMode | undefined` | — | The type of selection that is allowed in the collection. |
| `shouldSelectOnPressUp` | `boolean | undefined` | — | Whether selection should occur on press up instead of press down. |

## API (part 4)

| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: GridListRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 5)

### GridListSection

## API (part 6)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-label` | `string | undefined` | — | An accessibility label for the section. |
| `children` | `((item: T) => React.ReactElement) | React.ReactNode` | — | Static child items or a function to render children. |
| `className` | `string | undefined` | 'react-aria-GridListSection' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
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

## API (part 7)

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
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `value` | `T | undefined` | — | The object value that this section represents. When using dynamic collections, this is set automatically. |

## API (part 8)

### GridListHeader

`` labels the section within a GridList. It accepts all HTML attributes.

### GridListItem

## API (part 9)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-GridListItem' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
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
| `onClick` | `((e: React.MouseEvent) => void) | undefined` | — | **Not recommended – use `onPress` instead.** `onClick` is an alias for `onPress` provided for compatibility with other libraries. `onPress` provides additional event details for non-mouse interactions. |
| `onClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenu` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenuCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClick` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClickCapture` | `React.MouseEventHandler | undefined` | — |  |
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
| `onPointerCancelCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerDown` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerDownCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerEnter` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerLeave` | `React.PointerEventHandler | undefined` | — |  |

## API (part 10)

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
| `render` | `DOMRenderFunction<"div", GridListItemRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `routerOptions` | `undefined` | — | Options for the configured client side router. |
| `style` | `(((values: GridListItemRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `target` | `React.HTMLAttributeAnchorTarget | undefined` | — | The target window for the link. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#target). |
| `textValue` | `string | undefined` | — | A string representation of the item's contents, used for features like typeahead. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 11)

| `value` | `T | undefined` | — | The object value that this item represents. When using dynamic collections, this is set automatically. |

## API (part 12)

### GridListLoadMoreItem

## API (part 13)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `React.ReactNode` | — | The load more spinner to render when loading additional items. |
| `className` | `string | undefined` | 'react-aria-GridListLoadMoreItem' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
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

## API (part 14)

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
| `scrollOffset` | `number | undefined` | 1 | The amount of offset from the bottom of your scrollable region that should trigger load more. Uses a percentage value relative to the scroll body's client height. Load more is then triggered when your current scroll position's distance from the bottom of the currently loaded list of items is less than or equal to the provided value. (e.g. 1 = 100% of the scroll region's height). |
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |

