# Table

## Introduction

A table displays data in rows and columns and enables a user to navigate its contents via
directional navigation keys, and optionally supports row selection and sorting.

## Vanilla CSS example

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';

  
    <Column id="name" isRowHeader>Name
    <Column id="type">Type
    <Column id="date">Date Modified
  
  
    <Row id="games">
      Games
      Folder
      6/7/2023
      <Row id="mario">
        Mario Kart
        Game
        8/27/1992
      
      <Row id="tetris">
        Tetris
        Game
        1/27/1988
      
      <Row id="pacman">
        Pac-Man
        Game
        5/22/1980
      
    
    <Row id="apps">
      Applications
      Folder
      4/7/2025
      <Row id="ps">
        Photoshop
        Application
        2/19/1990
      
      <Row id="premiere">
        Premiere
        Application
        9/24/2003
      
      <Row id="lightroom">
        Lightroom
        Application
        10/18/2017
      
    
    <Row id="report">
      2024 Financial Report
      PDF Document
      12/30/2024
    
    <Row id="job">
      Job Posting
      Text Document
      1/18/2025
    
  

```

### Table.tsx

```tsx
'use client';
import {
  Button,
  Collection,
  Column as AriaColumn,
  type ColumnProps as AriaColumnProps,
  Row as AriaRow,
  type RowProps,
  Table as AriaTable,
  TableHeader as AriaTableHeader,
  type TableHeaderProps,
  type TableProps,
  useTableOptions,
  type TableBodyProps,
  TableBody as AriaTableBody,
  type CellProps,
  Cell as AriaCell,
  ColumnResizer,
  TableLoadMoreItem as AriaTableLoadMoreItem,
  type TableLoadMoreItemProps,
  TableFooter as AriaTableFooter,
  type TableFooterProps
} from 'react-aria-components/Table';
import {Group} from 'react-aria-components/Group';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {Checkbox} from './Checkbox';
import {ProgressCircle} from './ProgressCircle';
import {ChevronUp, ChevronDown, GripVertical, ChevronRight} from 'lucide-react';
import './Table.css';

export function Table(props: TableProps) {
  return <AriaTable {...props} />;
}

interface ColumnProps extends AriaColumnProps {
  allowsResizing?: boolean;
}

export function Column(props: Omit<ColumnProps, 'children'> & {children?: React.ReactNode}) {
  return (
    <AriaColumn {...props} className="react-aria-Column button-base">
      {({allowsSorting, sortDirection}) => (
        <div className="column-header">
          <Group role="presentation" tabIndex={-1} className="column-name">
            {props.children}
          
          {allowsSorting && (
            <span aria-hidden="true" className="sort-indicator">
              {sortDirection === 'ascending' ? <ChevronUp size={16} /> : <ChevronDown size={16} />}
            </span>
          )}
          {props.allowsResizing && }
        </div>
      )}
    
  );
}

export function TableHeader({columns, children, ...otherProps}: TableHeaderProps) {
  let {selectionBehavior, selectionMode, allowsDragging} = useTableOptions();

## Vanilla CSS example (part 2)

return (
    <AriaTableHeader {...otherProps}>
      {/* Add extra columns for drag and drop and selection. */}
      {allowsDragging && (
        <AriaColumn
          width={20}
          minWidth={20}
          style={{width: 20}}
          className="react-aria-Column button-base"
        />
      )}
      {selectionBehavior === 'toggle' && (
        <AriaColumn
          width={32}
          minWidth={32}
          style={{width: 32}}
          className="react-aria-Column button-base">
          {selectionMode === 'multiple' && <Checkbox slot="selection" />}
        
      )}
      <Collection items={columns}>{children}
    
  );
}

export function Row({id, columns, children, ...otherProps}: RowProps) {
  let {selectionBehavior, allowsDragging} = useTableOptions();

  return (
    <AriaRow id={id} {...otherProps}>
      {allowsDragging && (
        
          <Button slot="drag" className="drag-button">
            
          
        
      )}
      {selectionBehavior === 'toggle' && (
        
          <Checkbox slot="selection" />
        
      )}
      <Collection items={columns}>{children}
    
  );
}

export function TableBody(props: TableBodyProps) {
  return <AriaTableBody {...props} />;
}

export function TableFooter(props: TableFooterProps) {
  return <AriaTableFooter {...props} />;
}

export function Cell(props: CellProps) {
  return (
    <AriaCell {...props}>
      {composeRenderProps(props.children, (children, {hasChildItems, isTreeColumn}) => (
        <>
          {isTreeColumn && hasChildItems && (
            <Button slot="chevron">
              
            
          )}
          {children}
        </>
      ))}
    
  );
}

export function TableLoadMoreItem(props: TableLoadMoreItemProps) {
  return (
    <AriaTableLoadMoreItem {...props}>
      <div style={{display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
        <ProgressCircle isIndeterminate aria-label="Loading more..." />
      </div>
    
  );
}

```

### Table.css

```css
@import './theme.css';
@import './utilities.css';

.react-aria-Table {
  border: 0.5px solid var(--border-color);
  border-radius: var(--radius);
  background: var(--overlay-background);
  overflow: clip;
  outline: none;
  border-spacing: 0;
  align-self: start;
  width: 100%;
  word-break: break-word;
  forced-color-adjust: none;
  font: var(--font-size) system-ui;

  div& {
    padding: 0;
  }

  &[data-focus-visible] {
    outline: 2px solid var(--focus-ring-color);
  }

  &[data-drop-target] {
    outline: 2px solid var(--highlight-background);
    background: var(--highlight-overlay);
  }

  &:has(.react-aria-TableBody[data-empty]) {
    height: 100%;
    min-height: 100px;
  }

  .react-aria-TableHeader {
    color: var(--text-color);
  }

  .react-aria-TableBody {
    padding: var(--spacing-1);

    &[data-empty] {
      text-align: center;
      font-style: italic;
    }
  }
}

.react-aria-Row {
  outline: none;
  cursor: default;
  color: var(--text-color);
  position: relative;
  transform: scale(1);
  transition-property: background, color;
  transition-duration: 200ms;
  -webkit-tap-highlight-color: transparent;

## Vanilla CSS example (part 3)

tr:last-child& {
    border-radius: 0 0 var(--radius) var(--radius);
  }

  &[data-focus-visible] {
    outline: 2px solid var(--focus-ring-color);
    outline-offset: -2px;
  }

  &[data-pressed] {
    background: var(--gray-100);
  }

  &:nth-child(2n) {
    background: var(--gray-100);
    &[data-pressed] {
      background: var(--gray-200);
    }
  }

  &[data-selected] {
    background: var(--highlight-background);
    color: var(--highlight-foreground);
    --focus-ring-color: var(--highlight-foreground);

    &[data-focus-visible],
    .react-aria-Cell[data-focus-visible] {
      outline-offset: -4px;
    }

    &[data-pressed] {
      background: var(--highlight-background-pressed);
    }
  }

  &[data-disabled] {
    color: var(--text-color-disabled);
  }

  &[data-href] {
    cursor: pointer;
  }

  &[data-dragging] {
    opacity: 0.6;
    transform: translateZ(0);
  }

  &[data-drop-target] {
    outline: 2px solid var(--highlight-background);
    background: var(--highlight-overlay);
    z-index: 4;
  }

  .drag-button {
    all: unset;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 15px;
    text-align: center;

    svg {
      width: var(--spacing-4);
      height: var(--spacing-4);
    }

    &[data-focus-visible] {
      border-radius: 4px;
      outline: 2px solid var(--focus-ring-color);
    }
  }

  .react-aria-DropIndicator[data-drop-target] {
    outline: 1px solid var(--highlight-background);
    transform: translateZ(0);
  }
}

.react-aria-Cell,
.react-aria-Column {
  padding: var(--spacing-2);
  text-align: left;
  outline: none;
  box-sizing: border-box;
  -webkit-tap-highlight-color: transparent;

  div& {
    display: flex;
    align-items: center;
    height: 100%;
  }

  &:is(.react-aria-Row:last-child > :first-child) {
    border-end-start-radius: var(--radius);
  }

  &:is(.react-aria-Row:last-child > :last-child) {
    border-end-end-radius: var(--radius);
  }

  &[data-focus-visible] {
    outline: 2px solid var(--focus-ring-color);
    outline-offset: -2px;
  }
}

.react-aria-Column {
  --button-color: var(--gray);
  --button-border: transparent;
  --button-shadow: transparent;
  --button-border-size: 0px;
  cursor: default;
  border-bottom: 0.5px solid var(--border-color);
  border-inline-end: 0.5px solid var(--border-color);
  position: relative;
  z-index: calc(sibling-count() - sibling-index());

  &:last-child {
    border-inline-end: none;
  }

  &[data-pressed] {
    background: var(--gray-200);
  }

  &[data-sort-direction] {
    --button-color: var(--tint);

    &[data-pressed] {
      background: var(--tint-200);
    }
  }

  .column-header {
    display: flex;
    align-items: center;
    font-weight: 600;
  }

  .column-name {
    flex: 1;
    font: inherit;
    text-align: start;
    color: inherit;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    border-color: transparent;
    border-radius: var(--radius-sm);

    &[data-focus-visible] {
      outline: 2px solid var(--focus-ring-color);
      outline-offset: 2px;
    }
  }

## Vanilla CSS example (part 4)

.sort-indicator {
    padding: 0 2px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
  }

  &:not([data-sort-direction]) .sort-indicator {
    visibility: hidden;
  }
}

.react-aria-ColumnResizer {
  width: 1px;
  border-radius: var(--radius-sm);
  background-color: var(--gray-500);
  padding: 0 var(--spacing-2);
  translate: var(--spacing-4) 0;
  height: 32px;
  margin: -16px 0;
  flex: 0 0 auto;
  touch-action: none;
  box-sizing: content-box;
  background-clip: content-box;

  &[data-resizable-direction='both'] {
    cursor: ew-resize;
  }

  &[data-resizable-direction='left'] {
    cursor: e-resize;
  }

  &[data-resizable-direction='right'] {
    cursor: w-resize;
  }

  &[data-focus-visible] {
    background-color: var(--focus-ring-color);
    outline: 2px solid var(--focus-ring-color);
    outline-offset: -2px;
  }

  &[data-resizing] {
    width: 2px;
    background-color: var(--highlight-background);
  }
}

.react-aria-Cell {
  transform: translateZ(0);
  --border-color: var(--gray-300);
  tr:not(:last-child) & {
    border-bottom: 0.5px solid var(--border-color);
  }

  [data-selected]:has(+ [data-selected]) & {
    --border-color: rgb(255 255 255 / 0.3);
  }

  @media (forced-colors: active) {
    --border-color: ButtonBorder;
  }

  &[data-tree-column] {
    --chevron-placeholder: var(--spacing-5);
    padding-inline-start: calc(
      var(--spacing-2) + (var(--table-row-level) - 1) * var(--spacing-4) +
        var(--chevron-placeholder)
    );

    &[data-has-child-items] {
      --chevron-placeholder: 0px;
    }
  }

  .react-aria-Button[slot='chevron'] {
    all: unset;
    vertical-align: middle;
    margin-inline-end: var(--spacing-1);

    svg {
      rotate: 0deg;
      transition: rotate 200ms;
      fill: none;
      stroke: currentColor;
      stroke-width: 3px;
      width: var(--spacing-4);
      height: var(--spacing-4);
    }
  }

  &[data-expanded] .react-aria-Button[slot='chevron'] svg {
    rotate: 90deg;
  }
}

.react-aria-DropIndicator[data-drop-target] {
  outline: 1px solid var(--highlight-background);
  transform: translateZ(0);
  translate: calc(68px + (var(--table-row-level) - 1) * var(--spacing-4)) 0;
}

.react-aria-Row .react-aria-CheckboxButton {
  --checkmark-color: var(--highlight-background);
  &[data-selected] .indicator {
    --indicator-color: var(--highlight-foreground);
    --indicator-shadow: transparent;
  }
}

.react-aria-ResizableTableContainer {
  width: 100%;
  overflow: auto;
  position: relative;
  border: 0.5px solid var(--border-color);
  border-radius: var(--radius);
  background: var(--overlay-background);

  .react-aria-Table {
    border: none;
    border-radius: 0;

    &:has(.react-aria-TableBody[data-empty]) {
      height: 100%;
    }
  }

  .react-aria-TableHeader {
    position: sticky;
    top: 0;
    z-index: 10;
  }

  .react-aria-Cell {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
}

.react-aria-Cell img {
  height: 30px;
  width: 30px;
  object-fit: cover;
  display: block;
}

.react-aria-TableLoadingIndicator {
  height: 32px;
  position: relative;
}

## Vanilla CSS example (part 5)

.react-aria-TableFooter {
  font-weight: bold;
  background: var(--gray-200);
}

```

## Tailwind example

```tsx
import {Table, TableHeader, TableBody, Column, Row, Cell} from 'tailwind-starter/Table';

  
    <Column id="name" isRowHeader>Name
    <Column id="type">Type
    <Column id="date">Date Modified
  
  
    <Row id="games">
      Games
      Folder
      6/7/2023
      <Row id="mario">
        Mario Kart
        Game
        8/27/1992
      
      <Row id="tetris">
        Tetris
        Game
        1/27/1988
      
      <Row id="pacman">
        Pac-Man
        Game
        5/22/1980
      
    
    <Row id="apps">
      Applications
      Folder
      4/7/2025
      <Row id="ps">
        Photoshop
        Application
        2/19/1990
      
      <Row id="premiere">
        Premiere
        Application
        9/24/2003
      
      <Row id="lightroom">
        Lightroom
        Application
        10/18/2017
      
    
    <Row id="report">
      2024 Financial Report
      PDF Document
      12/30/2024
    
    <Row id="job">
      Job Posting
      Text Document
      1/18/2025
    
  

```

### Table.tsx

```tsx
'use client';
import {ArrowUp, ChevronRight} from 'lucide-react';
import React from 'react';
import {
  Cell as AriaCell,
  Column as AriaColumn,
  Row as AriaRow,
  Table as AriaTable,
  TableHeader as AriaTableHeader,
  TableBody as AriaTableBody,
  Button,
  type CellProps,
  Collection,
  type ColumnProps,
  ColumnResizer,
  ResizableTableContainer,
  type RowProps,
  type TableHeaderProps,
  type TableProps as AriaTableProps,
  useTableOptions,
  type TableBodyProps,
  TableFooter as AriaTableFooter,
  type TableFooterProps
} from 'react-aria-components/Table';
import {Group} from 'react-aria-components/Group';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {twMerge} from 'tailwind-merge';
import {tv} from 'tailwind-variants';
import {Checkbox} from './Checkbox';
import {composeTailwindRenderProps, focusRing} from './utils';

interface TableProps extends Omit<AriaTableProps, 'className'> {
  className?: string;
}

export function Table(props: TableProps) {
  return (
    <ResizableTableContainer
      onScroll={props.onScroll}
      className={twMerge(
        'w-full max-h-[320px] overflow-auto scroll-pt-[2.281rem] relative bg-white dark:bg-neutral-900 box-border border border-neutral-300 dark:border-neutral-700 rounded-lg font-sans',
        props.className
      )}>
      <AriaTable
        {...props}
        className="border-separate border-spacing-0 box-border overflow-hidden has-[>[data-empty]]:h-full"
      />
    
  );
}

const columnStyles = tv({
  extend: focusRing,
  base: 'px-2 h-5 box-border flex-1 flex gap-1 items-center overflow-hidden'
});

const resizerStyles = tv({
  extend: focusRing,
  base: 'w-px px-[8px] translate-x-[8px] box-content py-1 h-5 bg-clip-content bg-neutral-400 dark:bg-neutral-500 forced-colors:bg-[ButtonBorder] cursor-col-resize rounded-xs resizing:bg-blue-600 forced-colors:resizing:bg-[Highlight] resizing:w-[2px] resizing:pl-[7px] -outline-offset-2'
});

## Tailwind example (part 2)

export function Column(props: ColumnProps) {
  return (
    <AriaColumn
      {...props}
      className={composeTailwindRenderProps(
        props.className,
        'box-border h-1 [&:hover]:z-20 focus-within:z-20 text-start text-sm font-semibold text-neutral-700 dark:text-neutral-300 cursor-default'
      )}>
      {composeRenderProps(props.children, (children, {allowsSorting, sortDirection}) => (
        <div className="flex items-center">
          <Group role="presentation" tabIndex={-1} className={columnStyles}>
            <span className="truncate">{children}</span>
            {allowsSorting && (
              <span
                className={`w-4 h-4 flex items-center justify-center transition ${
                  sortDirection === 'descending' ? 'rotate-180' : ''
                }`}>
                {sortDirection && (
                  <ArrowUp
                    aria-hidden
                    className="w-4 h-4 text-neutral-500 dark:text-neutral-400 forced-colors:text-[ButtonText]"
                  />
                )}
              </span>
            )}
          
          {!props.width && <ColumnResizer className={resizerStyles} />}
        </div>
      ))}
    
  );
}

export function TableHeader(props: TableHeaderProps) {
  let {selectionBehavior, selectionMode, allowsDragging} = useTableOptions();

  return (
    <AriaTableHeader
      {...props}
      className={composeTailwindRenderProps(
        props.className,
        'sticky top-0 z-10 bg-neutral-100/60 dark:bg-neutral-700/60 backdrop-blur-md supports-[-moz-appearance:none]:bg-neutral-100 dark:supports-[-moz-appearance:none]:bg-neutral-700 forced-colors:bg-[Canvas] rounded-t-lg border-b border-b-neutral-200 dark:border-b-neutral-700'
      )}>
      {/* Add extra columns for drag and drop and selection. */}
      {allowsDragging && }
      {selectionBehavior === 'toggle' && (
        <AriaColumn
          width={36}
          minWidth={36}
          className="box-border p-2 text-sm font-semibold cursor-default text-start">
          {selectionMode === 'multiple' && <Checkbox slot="selection" />}
        
      )}
      <Collection items={props.columns}>{props.children}
    
  );
}

export function TableBody(props: TableBodyProps) {
  return <AriaTableBody {...props} className="empty:italic empty:text-center empty:text-sm" />;
}

export function TableFooter(props: TableFooterProps) {
  return <AriaTableFooter {...props} className="bg-neutral-200 dark:bg-neutral-700 font-bold" />;
}

const rowStyles = tv({
  extend: focusRing,
  base: 'group/row relative cursor-default select-none -outline-offset-2 text-neutral-900 disabled:text-neutral-300 dark:text-neutral-200 dark:disabled:text-neutral-600 text-sm hover:bg-neutral-100 pressed:bg-neutral-100 dark:hover:bg-neutral-800 dark:pressed:bg-neutral-800 selected:bg-blue-100 selected:hover:bg-blue-200 selected:pressed:bg-blue-200 dark:selected:bg-blue-700/30 dark:selected:hover:bg-blue-700/40 dark:selected:pressed:bg-blue-700/40 last:rounded-b-lg'
});

export function Row({id, columns, children, ...otherProps}: RowProps) {
  let {selectionBehavior, allowsDragging} = useTableOptions();

## Tailwind example (part 3)

return (
    <AriaRow id={id} {...otherProps} className={rowStyles}>
      {allowsDragging && (
        
          <Button slot="drag">≡
        
      )}
      {selectionBehavior === 'toggle' && (
        
          <Checkbox slot="selection" />
        
      )}
      <Collection items={columns}>{children}
    
  );
}

const cellStyles = tv({
  extend: focusRing,
  base: 'box-border [-webkit-tap-highlight-color:transparent] border-b border-b-neutral-200 dark:border-b-neutral-700 group-last/row:border-b-0 [--selected-border:var(--color-blue-200)] dark:[--selected-border:var(--color-blue-900)] group-selected/row:border-(--selected-border) [:is(:has(+[data-selected])_*)]:border-(--selected-border) p-2 truncate -outline-offset-2 group-last/row:first:rounded-bl-lg group-last/row:last:rounded-br-lg'
});

const expandButton = tv({
  extend: focusRing,
  base: 'border-0 p-0 pr-1 bg-transparent shrink-0 align-middle cursor-default [-webkit-tap-highlight-color:transparent]',
  variants: {
    isDisabled: {
      true: 'text-neutral-300 dark:text-neutral-600 forced-colors:text-[GrayText]'
    }
  }
});

const chevron = tv({
  base: 'w-4.5 h-4.5 text-neutral-500 dark:text-neutral-400 transition-transform duration-200 ease-in-out',
  variants: {
    isExpanded: {
      true: 'transform rotate-90'
    },
    isDisabled: {
      true: 'text-neutral-300 dark:text-neutral-600 forced-colors:text-[GrayText]'
    }
  }
});

export function Cell(props: CellProps) {
  return (
    <AriaCell
      {...props}
      className={cellStyles}
      style={({hasChildItems, isTreeColumn, level}) => ({
        paddingInlineStart: isTreeColumn
          ? 4 + (hasChildItems ? 0 : 20) + (level - 1) * 16
          : undefined
      })}>
      {composeRenderProps(
        props.children,
        (children, {hasChildItems, isTreeColumn, isExpanded, isDisabled}) => (
          <>
            {hasChildItems && isTreeColumn && (
              <Button slot="chevron" className={expandButton({isDisabled})}>
                <ChevronRight aria-hidden className={chevron({isExpanded, isDisabled})} />
              
            )}
            {children}
          </>
        )
      )}
    
  );
}

```

## Content

`Table` follows the [Collection Components API](collections.md?component=Table), accepting both static and dynamic collections.
In this example, both the columns and the rows are provided to the table via a render function, enabling the user to hide and show columns and add additional rows.

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell, TableFooter} from 'vanilla-starter/Table';
import {CheckboxGroup} from 'vanilla-starter/CheckboxGroup';
import {Checkbox} from 'vanilla-starter/Checkbox';
import {Button} from 'vanilla-starter/Button';
import {useState} from 'react';

const columns = [
  {name: 'Title', id: 'title', isRowHeader: true},
  {name: 'Status', id: 'status'},
  {name: 'Payment Method', id: 'paymentMethod'},
  {name: 'Price', id: 'price'}
];

const initialRows = [
  {id: 1, title: 'Website Design', status: 'Paid', paymentMethod: 'Credit Card', price: 1200},
  {id: 2, title: 'Logo Creation', status: 'Pending', paymentMethod: 'PayPal', price: 350},
  {id: 3, title: 'SEO Optimization', status: 'Overdue', paymentMethod: 'Bank Transfer', price: 800},
  {id: 4, title: 'Social Media Setup', status: 'Paid', paymentMethod: 'Debit Card', price: 450},
  {id: 5, title: 'Content Writing', status: 'Pending', paymentMethod: 'Credit Card', price: 600}
];

function FileTable() {
  let [showColumns, setShowColumns] = useState(['title', 'status', 'paymentMethod', 'price']);
  let visibleColumns = columns.filter(column => showColumns.includes(column.id));

  let [rows, setRows] = useState(initialRows);
  let addRow = () => {
    setRows(rows => [
      ...rows,
      {id: rows.length + 1, title: 'New Invoice', status: 'Pending', paymentMethod: 'Credit Card', price: 250}
    ]);
  };

  return (
    <div style={{display: 'flex', flexDirection: 'column', gap: 8, alignItems: 'start', width: '100%'}}>
      <CheckboxGroup aria-label="Show columns" value={showColumns} onChange={setShowColumns} orientation="horizontal">
        <Checkbox value="status">Status
        <Checkbox value="paymentMethod">Payment Method
      
      <Table aria-label="Files" style={{width: '100%'}}>
        <TableHeader columns={visibleColumns}>
          {column => (
            <Column isRowHeader={column.isRowHeader}>
              {column.name}
            
          )}
        
        {/*- begin highlight -*/}
        <TableBody items={rows} dependencies={[visibleColumns]}>
          {item => (
            /*- end highlight -*/
            <Row columns={visibleColumns}>
              {column => (
                
                  {column.id === 'price' 
                    ? item.price.toLocaleString('en-US', {style: 'currency', currency: 'USD', maximumFractionDigits: 0})
                    : item[column.id]}
                
              )}
            
          )}
        
        
          
            <Cell colSpan={showColumns.length - 1}>Total
            {rows.reduce((p, row) => p + row.price, 0).toLocaleString('en-US', {style: 'currency', currency: 'USD', maximumFractionDigits: 0})}
          
        
      
      <Button onPress={addRow}>Add row
    </div>
  );
}
```

## Content (part 2)

<InlineAlert variant="notice">
  Memoization
  Dynamic collections are automatically memoized to improve performance. Use the `dependencies` prop to invalidate cached elements that depend
  on external state (e.g. `columns` in this example).

### Expandable rows

Rows can be nested to display hierarchical data. Use the `treeColumn` prop to designate a column, and render a `<Button slot="chevron">` within the cells in that column to allow users to expand and collapse the row. Use the `expandedKeys` prop to control the expanded rows.

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';
import {Collection, type Key} from 'react-aria-components/Collection';
import {useState} from 'react';

/*- begin collapse -*/
const rows = [
  {id: '1', title: 'Documents', type: 'Directory', date: '10/20/2025', children: [
    {id: '2', title: 'Project', type: 'Directory', date: '8/2/2025', children: [
      {id: '3', title: 'Weekly Report', type: 'File', date: '7/10/2025', children: []},
      {id: '4', title: 'Budget', type: 'File', date: '8/20/2025', children: []}
    ]}
  ]},
  {id: '5', title: 'Photos', type: 'Directory', date: '2/3/2026', children: [
    {id: '6', title: 'Image 1', type: 'File', date: '1/23/2026', children: []},
    {id: '7', title: 'Image 2', type: 'File', date: '2/3/2026', children: []}
  ]}
];
/*- end collapse -*/

function Example() {
  let [expandedKeys, setExpandedKeys] = useState(new Set(['1']))

  return (
    <Table
      aria-label="Files"
      /*- begin highlight -*/
      treeColumn="name"
      expandedKeys={expandedKeys}
      onExpandedChange={setExpandedKeys}>
      {/*- end highlight -*/}
      
        <Column id="name" isRowHeader>Name
        <Column id="type">Type
        <Column id="date">Date Modified
      
      <TableBody items={rows}>
        {function renderItem(item) {
          return (
            <Row id={item.id}>
              {item.title}
              {item.type}
              {item.date}
              {/*- begin highlight -*/}
              {/* recursively render children */}
              <Collection items={item.children}>
                {renderItem}
              
              {/*- end highlight -*/}
            
          );
        }}
      
    
  );
}
```

### Asynchronous loading

Use [renderEmptyState](#empty-state) to display a spinner during initial load. To enable infinite scrolling, render a `` at the end of the list. Use whatever data fetching library you prefer – this example uses `useAsyncList` from `react-stately`.

```tsx
import {Collection} from 'react-aria-components/Collection';
import {useAsyncList} from 'react-aria-components/useAsyncList';
import {Table, TableHeader, Column, Row, TableBody, Cell, TableLoadMoreItem} from 'vanilla-starter/Table';
import {ProgressCircle} from 'vanilla-starter/ProgressCircle';

interface Character {
  name: string;
  height: number;
  mass: number;
  birth_year: number;
}

function AsyncSortTable() {
  let list = useAsyncList({
    async load({ signal, cursor }) {
      if (cursor) {
        cursor = cursor.replace(/^http:\/\//i, 'https://');
      }

## Content (part 3)

let res = await fetch(
        cursor || 'https://swapi.py4e.com/api/people/?search=',
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
    <div
      style={{
        height: 150,
        overflow: 'auto',
        border: '0.5px solid var(--border-color)',
        borderRadius: 'var(--radius)'
      }}>
      <Table
        aria-label="Star Wars characters"
        style={{tableLayout: 'fixed', width: '100%', border: 0}}>
        <TableHeader
          style={{
            position: 'sticky',
            top: 0,
            background: 'var(--overlay-background)',
            zIndex: 1
          }}>
          <Column id="name" isRowHeader>Name
          <Column id="height">Height
          <Column id="mass">Mass
          <Column id="birth_year">Birth Year
        
        <TableBody
          renderEmptyState={() => (
            <div style={{display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
              <ProgressCircle isIndeterminate aria-label="Loading..." />
            </div>
          )}>
          <Collection items={list.items}>
            {(item) => (
              <Row id={item.name}>
                {item.name}
                {item.height}
                {item.mass}
                {item.birth_year}
              
            )}
          
          {/*- begin highlight -*/}
          <TableLoadMoreItem
            onLoadMore={list.loadMore}
            isLoading={list.loadingState === 'loadingMore'} />
          {/*- end highlight -*/}
        
      
    </div>
  );
}
```

### Links

Use the `href` prop on a `` to create a link. Link interactions vary depending on the selection behavior. See the [selection guide](selection.md) for more details.

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';

  
    <Column isRowHeader>Name
    URL
    Date added
  
  
    {/*- begin highlight -*/}
    <Row id="row-1" href="https://adobe.com/" target="_blank">
      {/*- end highlight -*/}
      Adobe
      https://adobe.com/
      January 28, 2023
    
    <Row id="row-2" href="https://google.com/" target="_blank">
      Google
      https://google.com/
      April 5, 2023
    
    <Row id="row-3" href="https://nytimes.com/" target="_blank">
      New York Times
      https://nytimes.com/
      July 12, 2023
    
  

```

<InlineAlert
  variant="notice"
  UNSAFE_style={{marginTop: '2rem'}}
>
  Client-side routing
  Due to [HTML spec limitations](https://github.com/w3c/html-aria/issues/473), table rows cannot be rendered as `<a>` elements. React Aria handles link clicks with JavaScript and triggers native navigation. When using a client-side router, use the `onAction` event to programmatically trigger navigation instead of the `href` prop.

### Empty state

```tsx
import {Table, TableHeader, Column, TableBody} from 'vanilla-starter/Table';

<Table aria-label="Search results">
  
    <Column isRowHeader>Name
    Type
    Date Modified
  
  {/*- begin highlight -*/}
  <TableBody renderEmptyState={() => 'No results found.'}>
  {/*- end highlight -*/}
    {[]}

## Selection and actions

Use the `selectionMode` prop to enable single or multiple selection. The selected rows can be controlled via the `selectedKeys` prop, matching the `id` prop of the rows. The `onRowAction` event handles item actions. Rows can be disabled with the `isDisabled` prop. See the [selection guide](selection.md) for more details.

```tsx
import type {Selection} from 'react-aria-components/Table';
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';
import {useState} from 'react';

function Example(props) {
  let [selected, setSelected] = useState(new Set());

  return (
    <>
      <Table
        {...props}
        aria-label="Favorite pokemon"
        
        selectedKeys={selected}
        onSelectionChange={setSelected}
        onRowAction={key => alert(`Clicked ${key}`)}
      >
        
          <Column isRowHeader>Name
          Type
          Level
        
        
          <Row id="charizard">
            Charizard
            Fire, Flying
            67
          
          <Row id="blastoise">
            Blastoise
            Water
            56
          
          <Row id="venusaur" isDisabled>
            Venusaur
            Grass, Poison
            83
          
          <Row id="pikachu">
            Pikachu
            Electric
            100
          
        
      
      <p>Current selection: {selected === 'all' ? 'all' : [...selected].join(', ')}</p>
    </>
  );
}
```

## Sorting

Set the `allowsSorting` prop on a `` to make it sortable. When the column header is pressed, `onSortChange` is called with a `SortDescriptor` including the sorted column and direction (ascending or descending). Use this to sort the data accordingly, and pass the `sortDescriptor` prop to the `` to display the sorted column.

```tsx
import {type SortDescriptor} from 'react-aria-components/Table';
import {Table, TableHeader, Column, TableBody, Row, Cell} from 'vanilla-starter/Table';
import {useState} from 'react';

const rows = [
  {id: 1, name: 'Charizard', type: 'Fire, Flying', level: 67},
  {id: 2, name: 'Blastoise', type: 'Water', level: 56},
  {id: 3, name: 'Venusaur', type: 'Grass, Poison', level: 83},
  {id: 4, name: 'Pikachu', type: 'Electric', level: 100}
];

function SortableTable() {
  let [sortDescriptor, setSortDescriptor] = useState({
    column: 'name',
    direction: 'ascending'
  });

  let sortedRows = rows;
  if (sortDescriptor) {
    sortedRows = rows.toSorted((a, b) => {
      let first = a[sortDescriptor.column];
      let second = b[sortDescriptor.column];
      let cmp = first < second ? -1 : 1;
      if (sortDescriptor.direction === 'descending') {
        cmp = -cmp;
      }
      return cmp;
    });
  }

  return (
    <Table
      aria-label="Favorite pokemon"
      sortDescriptor={sortDescriptor}
      onSortChange={setSortDescriptor}
    >
      
        <Column id="name" isRowHeader allowsSorting>Name
        <Column id="type" allowsSorting>Type
        <Column id="level" allowsSorting>Level
      
      <TableBody items={sortedRows}>
        {item => (
          
            {item.name}
            {item.type}
            {item.level}
          
        )}
      
    
  );
}
```

## Column resizing

Wrap the `` with a ``, and add a `` to each column to make it resizable. Use the `defaultWidth`, `width`, `minWidth`, and `maxWidth` props on a `` to control resizing behavior. These accept pixels, percentages, or fractional values (the [fr](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout#the_fr_unit) unit). The default column width is `1fr`.

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';
import {ResizableTableContainer} from 'react-aria-components/Table';

const rows = [
  {id: 1, name: '2022 Roadmap Proposal Revision 012822 Copy (2)', date: 'November 27, 2022 at 4:56PM', size: '214 KB'},
  {id: 2, name: 'Budget', date: 'January 27, 2021 at 1:56AM', size: '14 MB'},
  {id: 3, name: 'Welcome Email Template', date: 'July 24, 2022 at 2:48 PM', size: '20 KB'},
  {id: 4, name: 'Job Posting_8301', date: 'May 30, 2025', size: '139 KB'}
];

  <Table aria-label="Table with resizable columns">
    
      {/*- begin highlight -*/}
      <Column id="file" isRowHeader allowsResizing maxWidth={500}>File Name
      <Column id="size" allowsResizing defaultWidth={80}>Size
      <Column id="date" minWidth={100}>Date Modified
      {/*- end highlight -*/}
    
    <TableBody items={rows}>
      {item => (
        
          {item.name}
          {item.size}
          {item.date}
        
      )}
    
  

```

### Resize events

The ResizableTableContainer's `onResize` event is called when a column resizer is moved by the user. The `onResizeEnd` event is called when the user finishes resizing. These receive a `Map` containing the widths of all columns in the Table. This example persists the column widths in `localStorage`.

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';
import {ResizableTableContainer} from 'react-aria-components/Table';
import {useSyncExternalStore} from 'react';

const rows = [
  {id: 1, name: '2022 Roadmap Proposal Revision 012822 Copy (2)', date: 'November 27, 2022 at 4:56PM', size: '214 KB'},
  {id: 2, name: 'Budget', date: 'January 27, 2021 at 1:56AM', size: '14 MB'},
  {id: 3, name: 'Welcome Email Template', date: 'July 24, 2022 at 2:48 PM', size: '20 KB'},
  {id: 4, name: 'Job Posting_8301', date: 'May 30, 2025', size: '139 KB'}
];

const columns = [
  {id: 'file', name: 'File Name'},
  {id: 'size', name: 'Size'},
  {id: 'date', name: 'Date'}
];

const initialWidths = new Map<string, number | string>([
  ['file', '1fr'],
  ['size', 80],
  ['date', 100]
]);

export default function ResizableTable() {
  let columnWidths = useSyncExternalStore(subscribe, getColumnWidths, getInitialWidths);

## Column resizing (part 2)

return (
    <ResizableTableContainer
      onResize={setColumnWidths}
    >
      <Table aria-label="Table with resizable columns">
        <TableHeader columns={columns} dependencies={[columnWidths]}>
          {column => (
            <Column
              isRowHeader={column.id === 'file'}
              allowsResizing
              width={columnWidths.get(column.id)}
            >
              {column.name}
            
          )}
        
        <TableBody items={rows}>
          {item => (
            
              {item.name}
              {item.size}
              {item.date}
            
          )}
        
      
    
  );
}

let parsedWidths;
function getColumnWidths() {
  // Parse column widths from localStorage.
  if (!parsedWidths) {
    let data = localStorage.getItem('table-widths');
    if (data) {
      parsedWidths = new Map(JSON.parse(data));
    }
  }
  return parsedWidths || initialWidths;
}

function setColumnWidths(widths) {
  // Store new widths in localStorage, and trigger subscriptions.
  localStorage.setItem('table-widths', JSON.stringify(Array.from(widths)));
  window.dispatchEvent(new Event('storage'));
}

function getInitialWidths() {
  return initialWidths;
}

function subscribe(fn) {
  let onStorage = () => {
    // Invalidate cache.
    parsedWidths = null;
    fn();
  };

  window.addEventListener('storage', onStorage);
  return () => window.removeEventListener('storage', onStorage);
}
```

## Drag and drop

Table supports drag and drop interactions when the `dragAndDropHooks` prop is provided using the `useDragAndDrop` hook. Users can drop data on the table as a whole, on individual rows, insert new rows between existing ones, or reorder rows. React Aria supports drag and drop via mouse, touch, keyboard, and screen reader interactions. See the [drag and drop guide](dnd.md?component=Table) to learn more.

```tsx
import {Table, TableHeader, TableBody, Column, Row, Cell} from 'vanilla-starter/Table';
import {useDragAndDrop} from 'react-aria-components/useDragAndDrop';
import {useTreeData} from 'react-aria-components/useTreeData';
import {Collection} from 'react-aria-components/Collection';

function ReorderableTable() {
  let tree = useTreeData({
    initialItems: [
      {id: '1', title: 'Documents', type: 'Directory', date: '10/20/2025', children: [
        {id: '2', title: 'Project', type: 'Directory', date: '8/2/2025', children: [
          {id: '3', title: 'Weekly Report', type: 'File', date: '7/10/2025', children: []},
          {id: '4', title: 'Budget', type: 'File', date: '8/20/2025', children: []}
        ]}
      ]},
      {id: '5', title: 'Photos', type: 'Directory', date: '2/3/2026', children: [
        {id: '6', title: 'Image 1', type: 'File', date: '1/23/2026', children: []},
        {id: '7', title: 'Image 2', type: 'File', date: '2/3/2026', children: []}
      ]}
    ]
  });

  let {dragAndDropHooks} = useDragAndDrop({
    getItems: (keys, items: typeof tree.items) => items.map(item => ({'text/plain': item.value.title})),
    onMove(e) {
      if (e.target.dropPosition === 'before') {
        tree.moveBefore(e.target.key, e.keys);
      } else if (e.target.dropPosition === 'after') {
        tree.moveAfter(e.target.key, e.keys);
      } else if (e.target.dropPosition === 'on') {
        // Move items to become children of the target
        let targetNode = tree.getItem(e.target.key);
        if (targetNode) {
          let targetIndex = targetNode.children ? targetNode.children.length : 0;
          let keyArray = Array.from(e.keys);
          for (let i = 0; i < keyArray.length; i++) {
            tree.move(keyArray[i], e.target.key, targetIndex + i);
          }
        }
      }
    }
  });

  return (
    <Table
      aria-label="Files"
      selectionMode="multiple"
      treeColumn="name"
      defaultExpandedKeys={['5']}
      dragAndDropHooks={dragAndDropHooks}
    >
      
        <Column id="name" isRowHeader>Name
        <Column id="type">Type
        <Column id="date">Date Modified
      
      <TableBody items={tree.items}>
        {function renderItem(item) {
          return (
            <Row id={item.key}>
              {item.value.title}
              {item.value.type}
              {item.value.date}
              {item.children && <Collection items={item.children}>
                {renderItem}
              }
            
          );
        }}
      
    
  );
}
```

## Examples

<ExampleList
  tag="table"
  pages={props.pages}
/>

## API

```tsx

  
    
      
      <Checkbox slot="selection" />
      
      
    
    
      
        <Button slot="drag" />
        
          <Checkbox slot="selection" /> or 
        
        
          <Button slot="chevron" />
        
        
        
          {/* ... */}
        
      
      
    
    
      
        
      
    
  

```

### Table

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `React.ReactNode` | — | The elements that make up the table. Includes the TableHeader, TableBody, Columns, and Rows. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Table' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultExpandedKeys` | `Iterable | undefined` | — | The initial expanded keys in the collection (uncontrolled). |
| `defaultSelectedKeys` | `"all" | Iterable | undefined` | — | The initial selected keys in the collection (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `disabledBehavior` | `DisabledBehavior | undefined` | 'all' | Whether `disabledKeys` applies to all interactions, or only selection. |
| `disabledKeys` | `Iterable | undefined` | — | A list of row keys to disable. |
| `disallowEmptySelection` | `boolean | undefined` | — | Whether the collection allows empty selection. |
| `dragAndDropHooks` | `DragAndDropHooks | undefined` | — | The drag and drop hooks returned by `useDragAndDrop` used to enable drag and drop behavior for the Table. |
| `escapeKeyBehavior` | `"clearSelection" | "none" | undefined` | 'clearSelection' | Whether pressing the escape key should clear selection in the table or not. Most experiences should not modify this option as it eliminates a keyboard user's ability to easily clear selection. Only use if the escape key is being handled externally or should not trigger selection clearing contextually. |
| `expandedKeys` | `Iterable | undefined` | — | The currently expanded keys in the collection (controlled). |
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
| `onExpandedChange` | `((keys: Set) => any) | undefined` | — | Handler that is called when items are expanded or collapsed. |
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

## API (part 3)

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
| `onRowAction` | `((key: Key) => void) | undefined` | — | Handler that is called when a user performs an action on the row. |
| `onScroll` | `React.UIEventHandler | undefined` | — |  |
| `onScrollCapture` | `React.UIEventHandler | undefined` | — |  |
| `onSelectionChange` | `((keys: Selection) => void) | undefined` | — | Handler that is called when the selection changes. |
| `onSortChange` | `((descriptor: SortDescriptor) => any) | undefined` | — | Handler that is called when the sorted column or direction changes. |
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
| `render` | `DOMRenderFunction<"table" | "div", TableRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `selectedKeys` | `"all" | Iterable | undefined` | — | The currently selected keys in the collection (controlled). |
| `selectionBehavior` | `SelectionBehavior | undefined` | 'toggle' | How multiple selection should behave in the collection. |
| `selectionMode` | `SelectionMode | undefined` | — | The type of selection that is allowed in the collection. |
| `shouldSelectOnPressUp` | `boolean | undefined` | — | Whether selection should occur on press up instead of press down. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `sortDescriptor` | `SortDescriptor | undefined` | — | The current sorted column and direction. |
| `style` | `(((values: TableRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `treeColumn` | `Key | undefined` | — | The id of the column that displays hierarchical data. |

## API (part 4)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `((item: T) => ReactElement) | React.ReactNode` | — | A list of `Column(s)` or a function. If the latter, a list of columns must be provided using the `columns` prop. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-TableHeader' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `columns` | `Iterable | undefined` | — | A list of table columns. |
| `dependencies` | `readonly any[] | undefined` | — | Values that should invalidate the column cache when using dynamic collections. |
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

## API (part 5)

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
| `render` | `DOMRenderFunction<"div" | "thead", TableHeaderRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style` | `(((values: TableHeaderRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 6)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `allowsSorting` | `boolean | undefined` | — | Whether the column allows sorting. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Column' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultWidth` | `ColumnSize | null | undefined` | — | The default width of the column. This prop only applies when the `` is wrapped in a ``. |
| `dir` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `Key | undefined` | — | The unique id of the column. |
| `inert` | `boolean | undefined` | — |  |
| `isRowHeader` | `boolean | undefined` | — | Whether a column is a [row header](https://www.w3.org/TR/wai-aria-1.1/#rowheader) and should be announced by assistive technology during row navigation. |
| `lang` | `string | undefined` | — |  |
| `maxWidth` | `ColumnStaticSize | null | undefined` | — | The maximum width of the column. This prop only applies when the `` is wrapped in a ``. |
| `minWidth` | `ColumnStaticSize | null | undefined` | — | The minimum width of the column. This prop only applies when the `` is wrapped in a ``. |
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

## API (part 7)

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
| `render` | `DOMRenderFunction<"div" | "th", ColumnRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style` | `(((values: ColumnRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `textValue` | `string | undefined` | — | A string representation of the column's contents, used for accessibility announcements. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `width` | `ColumnSize | null | undefined` | — | The width of the column. This prop only applies when the `` is wrapped in a ``. |

## API (part 8)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `((item: T) => ReactNode) | React.ReactNode` | — | The contents of the collection. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-TableBody' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
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

## API (part 9)

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
| `render` | `DOMRenderFunction<"div" | "tbody", TableBodyRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `renderEmptyState` | `((props: TableBodyRenderProps) => ReactNode) | undefined` | — | Provides content to display when there are no rows in the table. |
| `style` | `(((values: TableBodyRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 10)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `((item: T) => ReactElement) | React.ReactNode` | — | The cells within the row. Supports static items or a function for dynamic rendering. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Row' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `columns` | `Iterable | undefined` | — | A list of columns used when dynamically rendering cells. |
| `dependencies` | `readonly any[] | undefined` | — | Values that should invalidate the cell cache when using dynamic collections. |
| `dir` | `string | undefined` | — |  |
| `disabledBehavior` | `DisabledBehavior | undefined` | — | Whether `disabledKeys` applies to all interactions, or only selection. |
| `download` | `boolean | string | undefined` | — | Causes the browser to download the linked URL. A string may be provided to suggest a file name. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#download). |
| `hasChildItems` | `boolean | undefined` | — | Whether this row has children, even if not loaded yet. |
| `hidden` | `boolean | undefined` | — |  |
| `href` | `string | undefined` | — | A URL to link to. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#href). |
| `hrefLang` | `string | undefined` | — | Hints at the human language of the linked URL. See[MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#hreflang). |
| `id` | `Key | undefined` | — | The unique id of the row. |
| `inert` | `boolean | undefined` | — |  |
| `isDisabled` | `boolean | undefined` | — | Whether the row is disabled. |
| `lang` | `string | undefined` | — |  |
| `onAction` | `(() => void) | undefined` | — | Handler that is called when a user performs an action on the row. The exact user event depends on the collection's `selectionBehavior` prop and the interaction modality. |
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

## API (part 11)

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
| `render` | `DOMRenderFunction<"div" | "tr", RowRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `routerOptions` | `undefined` | — | Options for the configured client side router. |

## API (part 12)

| `style` | `(((values: RowRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `target` | `React.HTMLAttributeAnchorTarget | undefined` | — | The target window for the link. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#target). |
| `textValue` | `string | undefined` | — | A string representation of the row's contents, used for features like typeahead. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `value` | `T | undefined` | — | The object value that this row represents. When using dynamic collections, this is set automatically. |

## API (part 13)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Cell' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `colSpan` | `number | undefined` | — | Indicates how many columns the data cell spans. |
| `dir` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `Key | undefined` | — | The unique id of the cell. |
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
| `render` | `DOMRenderFunction<"div" | "td", CellRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style` | `(((values: CellRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `textValue` | `string | undefined` | — | A string representation of the cell's contents, used for features like typeahead. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 15)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `((item: T) => ReactNode) | React.ReactNode` | — | The contents of the collection. |
| `className` | `string | undefined` | 'react-aria-TableFooter' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
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
| `onTransitionCancel` | `React.TransitionEventHandler | undefined` | — |  |

## API (part 16)

| `onTransitionCancelCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEnd` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEndCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRun` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRunCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStart` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStartCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onWheel` | `React.WheelEventHandler | undefined` | — |  |
| `onWheelCapture` | `React.WheelEventHandler | undefined` | — |  |
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 17)

### ResizableTableContainer

## API (part 18)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `React.ReactNode` | — | The children of the component. |
| `className` | `string | undefined` | 'react-aria-ResizableTableContainer' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
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
| `onResize` | `((widths: Map<Key, ColumnSize>) => void) | undefined` | — | Handler that is called when a user performs a column resize. Can be used with the width property on columns to put the column widths into a controlled state. |
| `onResizeEnd` | `((widths: Map<Key, ColumnSize>) => void) | undefined` | — | Handler that is called after a user performs a column resize. Can be used to store the widths of columns for another future session. |
| `onResizeStart` | `((widths: Map<Key, ColumnSize>) => void) | undefined` | — | Handler that is called when a user starts a column resize. |
| `onScroll` | `React.UIEventHandler | undefined` | — |  |
| `onScrollCapture` | `React.UIEventHandler | undefined` | — |  |
| `onTouchCancel` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchCancelCapture` | `React.TouchEventHandler | undefined` | — |  |

## API (part 19)

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
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 20)

### ColumnResizer

## API (part 21)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-label` | `string | undefined` | — | A custom accessibility label for the resizer. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-ColumnResizer' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
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

## API (part 22)

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
| `render` | `DOMRenderFunction<"div", ColumnResizerRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style` | `(((values: ColumnResizerRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 23)

### TableLoadMoreItem

## API (part 24)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `React.ReactNode` | — | The load more spinner to render when loading additional items. |
| `className` | `string | undefined` | 'react-aria-TableLoadMoreItem' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
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

## API (part 25)

| `onTransitionCancelCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEnd` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEndCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRun` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRunCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStart` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStartCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onWheel` | `React.WheelEventHandler | undefined` | — |  |
| `onWheelCapture` | `React.WheelEventHandler | undefined` | — |  |
| `render` | `DOMRenderFunction<"div" | "tr", undefined> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `scrollOffset` | `number | undefined` | 1 | The amount of offset from the bottom of your scrollable region that should trigger load more. Uses a percentage value relative to the scroll body's client height. Load more is then triggered when your current scroll position's distance from the bottom of the currently loaded list of items is less than or equal to the provided value. (e.g. 1 = 100% of the scroll region's height). |
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## Related Types

### SortDescriptor

| Name | Type | Description |
|------|------|-------------|
| `column` \* | `Key` | The key of the column to sort by. |
| `direction` \* | `SortDirection` | The direction to sort by. |

### useDragAndDrop

`useDragAndDrop(options: DragAndDropOptions): DragAndDrop`

Provides the hooks required to enable drag and drop behavior for a drag and drop compatible
collection component.

