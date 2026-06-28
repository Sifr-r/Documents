# selection

## Introduction

Many collection components support selecting items by clicking or tapping them, or by using the keyboard. Learn how to handle selection events, how to control selection programmatically, and the data structures used to represent a selection.

## Multiple selection

Most collection components support item selection, which is handled by the `onSelectionChange` event. Use the `selectedKeys` prop to control the selected items programmatically, or `defaultSelectedKeys` for uncontrolled behavior.

Selection is represented by a [Set](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) containing the `id` of each selected item. You can also pass any iterable collection (e.g. an array) to the `selectedKeys` and `defaultSelectedKeys` props, but the `onSelectionChange` event will always pass back a Set.

## ListBox example

```tsx
import {type Selection} from 'react-aria-components/ListBox';
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';
import {useState} from 'react';

function Example() {
  let [selectedKeys, setSelectedKeys] = useState(new Set(['cheese']));

  return (
    <div>
      <ListBox
        aria-label="Sandwich contents"
        selectionMode="multiple"
        selectedKeys={selectedKeys}
        onSelectionChange={setSelectedKeys}
      >
        <ListBoxItem id="lettuce">Lettuce
        <ListBoxItem id="tomato">Tomato
        <ListBoxItem id="cheese">Cheese
        <ListBoxItem id="tuna">Tuna Salad
        <ListBoxItem id="egg">Egg Salad
        <ListBoxItem id="ham">Ham
      
      <p>selectedKeys: {selectedKeys === 'all' ? 'all' : [...selectedKeys].join(', ')}</p>
    </div>
  );
}
```

## GridList example

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';
import {type Selection} from 'react-aria-components/GridList';
import {useState} from 'react';

export default function Example() {
  let [selectedKeys, setSelectedKeys] = useState(new Set(['Blastoise']));

  return (
    <>
      <GridList
        aria-label="Sandwich contents"
        selectionMode="multiple"
        selectedKeys={selectedKeys}
        onSelectionChange={setSelectedKeys}
        data-size="small">
        <PokemonItem name="Charizard" />
        <PokemonItem name="Blastoise" />
        <PokemonItem name="Venusaur" />
        <PokemonItem name="Pikachu" />
      
      <p>selectedKeys: {selectedKeys === 'all' ? 'all' : [...selectedKeys].join(', ')}</p>
    </>
  );
}

function PokemonItem(props: {name: string}) {
  return (
    <GridListItem id={props.name} textValue={props.name}>
      <img src={`https://img.pokemondb.net/sprites/home/normal/2x/avif/${props.name.toLowerCase()}.avif`} alt="" />
      {props.name}
    
  );
}
```

## Tree example

```tsx
import {type Selection} from 'react-aria-components/Tree';
import {Tree, TreeItem} from 'vanilla-starter/Tree';
import {useState} from 'react';

function Example() {
  let [selectedKeys, setSelectedKeys] = useState(new Set(['project']));

  return (
    <div>
      <Tree
        aria-label="Files"
        defaultExpandedKeys={['documents', 'photos', 'project']}
        selectionMode="multiple"
        selectedKeys={selectedKeys}
        onSelectionChange={setSelectedKeys}
      >
        <TreeItem id="documents" title="Documents">
          <TreeItem id="project" title="Project">
            <TreeItem title="Weekly Report" />
          
        
        <TreeItem id="photos" title="Photos">
          <TreeItem title="Image 1" />
          <TreeItem title="Image 2" />
        
      
      <p>selectedKeys: {selectedKeys === 'all' ? 'all' : [...selectedKeys].join(', ')}</p>
    </div>
  );
}
```

## TagGroup example

```tsx
import {type Selection} from 'react-aria-components/TagGroup';
import {TagGroup, Tag} from 'vanilla-starter/TagGroup';
import {useState} from 'react';

function Example() {
  let [selectedKeys, setSelectedKeys] = useState(new Set(['cheese']));

  return (
    <div>
      <TagGroup
        label="Sandwich contents"
        selectionMode="multiple"
        selectedKeys={selectedKeys}
        onSelectionChange={setSelectedKeys}
      >
        <Tag id="lettuce">Lettuce
        <Tag id="tomato">Tomato
        <Tag id="cheese">Cheese
        <Tag id="tuna">Tuna Salad
        <Tag id="egg">Egg Salad
        <Tag id="ham">Ham
      
      <p>selectedKeys: {selectedKeys === 'all' ? 'all' : [...selectedKeys].join(', ')}</p>
    </div>
  );
}
```

## Table example

```tsx
import {type Selection} from 'react-aria-components/Table';
import {Table, TableHeader, TableBody, Column, Row, Cell} from 'vanilla-starter/Table';
import {useState} from 'react';

const rows = [
  {id: 'lettuce', name: 'Lettuce', type: 'Vegetable', calories: 4},
  {id: 'tomato', name: 'Tomato', type: 'Vegetable', calories: 5},
  {id: 'cheese', name: 'Cheddar', type: 'Cheese', calories: 113},
  {id: 'tuna', name: 'Tuna salad', type: 'Salad', calories: 187},
  {id: 'egg', name: 'Egg salad', type: 'Salad', calories: 200},
  {id: 'ham', name: 'Ham', type: 'Meat', calories: 205}
];

function Example() {
  let [selectedKeys, setSelectedKeys] = useState(new Set(['cheese']));

  return (
    <div>
      <Table
        aria-label="Sandwich contents"
        selectionMode="multiple"
        selectedKeys={selectedKeys}
        onSelectionChange={setSelectedKeys}
      >
        
          <Column isRowHeader>Name
          Type
          Calories
        
        <TableBody items={rows}>
          {item => (
            
              {item.name}
              {item.type}
              {item.calories}
            
          )}
        
      
      <p>selectedKeys: {selectedKeys === 'all' ? 'all' : [...selectedKeys].join(', ')}</p>
    </div>
  );
}
```

### Select all

Some components support a checkbox to select all items in the collection, or a keyboard shortcut like ⌘ Cmd + A. This represents a selection of all items in the collection, regardless of whether or not all items have been loaded from the network. For example, when using a component with infinite scrolling support, the user will be unaware that all items are not yet loaded. For this reason, it makes sense for select all to represent all items, not just the loaded ones.

When a select all event occurs, `onSelectionChange` is called with the string `"all"` rather than a set of selected keys. `selectedKeys`
and `defaultSelectedKeys` can also be set to `"all"` to programmatically select all items. The application must adjust its handling of bulk actions in this case to apply to the entire collection rather than only the keys available to it locally.

```tsx
import {Table, TableHeader, Column, TableBody, Row, Cell, type Selection} from 'react-aria-components/Table';
import {Checkbox} from 'vanilla-starter/Checkbox';
import {Button} from 'vanilla-starter/Button';
import {useState} from 'react';

const rows = [
  {name: 'Games', date: '6/7/2020', type: 'File folder'},
  {name: 'Program Files', date: '4/7/2021', type: 'File folder'},
  {name: 'bootmgr', date: '11/20/2010', type: 'System file'},
  {name: 'log.txt', date: '1/18/2016', type: 'Text Document'}
];

function Example() {
  let [selectedKeys, setSelectedKeys] = useState(new Set());

  function performBulkAction() {
    if (selectedKeys === 'all') {
      alert('Performing action on all items');
    } else {
      alert(`Performing action on selected items: ${[...selectedKeys].join(', ')}`);
    }
  }

## Table example (part 2)

return (
    <div>
      <Table
        aria-label="Files"
        selectionMode="multiple"
        selectedKeys={selectedKeys}
        onSelectionChange={setSelectedKeys}>
        
          <Checkbox slot="selection" />
          <Column isRowHeader>Name
          Type
          Date Modified
        
        <TableBody items={rows}>
          {item => (
            <Row id={item.name}>
              <Checkbox slot="selection" />
              {item.name}
              {item.type}
              {item.date}
            
          )}
        
      
      {(selectedKeys === 'all' || selectedKeys.size > 0) && (
        <div style={{marginTop: '16px', padding: '8px'}}>
          <Button onPress={performBulkAction}>Delete Selected
        </div>
      )}
      <p>selectedKeys: {selectedKeys === 'all' ? 'all' : [...selectedKeys].join(', ')}</p>
    </div>
  );
}
```

### Selection behavior

By default, React Aria uses the `"toggle"` selection behavior, which behaves like a checkbox group: clicking, tapping, or pressing the Space or Enter keys toggles selection for the focused row. Using the arrow keys moves focus but does not change selection. The `"toggle"` selection mode is often paired with a column of checkboxes in each row as an explicit affordance for selection.

When the `selectionBehavior` prop is set to `"replace"`, clicking a row with the mouse *replaces* the selection with only that row. Using the arrow keys moves both focus and selection. To select multiple rows, modifier keys such as Ctrl, Cmd, and Shift can be used. On touch screen devices, selection always behaves as toggle since modifier keys may not be available. This behavior emulates native platforms such as macOS and Windows, and is often used when checkboxes in each row are not desired.

To move focus without moving selection, the Ctrl key on Windows or the Option key on macOS can be held while pressing the arrow keys. Holding this modifier while pressing the Space key toggles selection for the focused row, which allows multiple selection of non-contiguous items.

These selection styles implement the behaviors defined in [Aria Practices](https://www.w3.org/WAI/ARIA/apg/patterns/listbox/#keyboardinteraction).

## ListBox example

```tsx
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';
import {useState} from 'react';

function Example(props) {
  let [selectedKeys, setSelectedKeys] = useState(new Set());

  return (
    <ListBox
      {...props}
      aria-label="ListBox"
      selectionMode="multiple"
      /*- begin highlight -*/
      
      /*- end highlight -*/
      selectedKeys={selectedKeys}
      onSelectionChange={setSelectedKeys}>
      <ListBoxItem id="one">One
      <ListBoxItem id="two">Two
      <ListBoxItem id="three">Three
    
  );
}
```

## GridList example

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';
import {useState} from 'react';

function Example(props) {
  let [selectedKeys, setSelectedKeys] = useState(new Set());

  return (
    <GridList
      {...props}
      aria-label="GridList"
      selectionMode="multiple"
      /*- begin highlight -*/
      
      /*- end highlight -*/
      selectedKeys={selectedKeys}
      onSelectionChange={setSelectedKeys}
      data-size="small">
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
      
    
  );
}
```

## Tree example

```tsx
import {type Selection} from 'react-aria-components/Tree';
import {Tree, TreeItem} from 'vanilla-starter/Tree';
import {useState} from 'react';

function Example(props) {
  let [selectedKeys, setSelectedKeys] = useState(new Set());

  return (
    <div>
      <Tree
        {...props}
        aria-label="Files"
        defaultExpandedKeys={['documents', 'photos', 'project']}
        selectionMode="multiple"
        /*- begin highlight -*/
        
        /*- end highlight -*/
        selectedKeys={selectedKeys}
        onSelectionChange={setSelectedKeys}>
        <TreeItem id="documents" title="Documents">
          <TreeItem id="project" title="Project">
            <TreeItem title="Weekly Report" />
          
        
        <TreeItem id="photos" title="Photos">
          <TreeItem title="Image 1" />
          <TreeItem title="Image 2" />
        
      
      <p>selectedKeys: {selectedKeys === 'all' ? 'all' : [...selectedKeys].join(', ')}</p>
    </div>
  );
}
```

## TagGroup example

```tsx
import {TagGroup, Tag} from 'vanilla-starter/TagGroup';
import {useState} from 'react';

function Example(props) {
  let [selectedKeys, setSelectedKeys] = useState(new Set());

  return (
    <TagGroup
      {...props}
      label="TagGroup"
      selectionMode="multiple"
      /*- begin highlight -*/
      
      /*- end highlight -*/
      selectedKeys={selectedKeys}
      onSelectionChange={setSelectedKeys}>
      <Tag id="one">One
      <Tag id="two">Two
      <Tag id="three">Three
    
  );
}
```

## Table example

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';
import {useState} from 'react';

function Example(props) {
  let [selectedKeys, setSelectedKeys] = useState(new Set());

  return (
    <Table
      {...props}
      aria-label="Table"
      selectionMode="multiple"
      /*- begin highlight -*/
      
      /*- end highlight -*/
      selectedKeys={selectedKeys}
      onSelectionChange={setSelectedKeys}>
      
        <Column isRowHeader>Name
        Type
        Date Modified
      
      
        
          Games
          File folder
          6/7/2020
        
        
          Program Files
          File folder
          4/7/2021
        
        
          bootmgr
          System file
          11/20/2010
        
        
          log.txt
          Text Document
          1/18/2016
        
      
    
  );
}
```

## Single selection

In some components like [Tabs](Tabs.md), only single selection is supported. In this case, the singular `selectedKey` and `defaultSelectedKey` props are available instead of their plural variants. These accept a single id instead of a `Set` as their value.

```tsx
import type {Key} from 'react-aria-components/Tabs';
import {Tabs, TabList, Tab, TabPanels, TabPanel} from 'vanilla-starter/Tabs';
import Home from '@react-spectrum/s2/illustrations/gradient/generic2/Home';
import Folder from '@react-spectrum/s2/illustrations/gradient/generic2/FolderOpen';
import Search from '@react-spectrum/s2/illustrations/gradient/generic2/Search';
import {useState} from 'react';

function Example() {
  let [selectedKey, setSelectedKey] = useState('home');

  return (
    <div>
      <Tabs
        selectedKey={selectedKey}
        onSelectionChange={setSelectedKey}>
        <TabList aria-label="Tabs">
          <Tab id="home">Home
          <Tab id="files">Files
          <Tab id="search">Search
        
        
          <TabPanel id="home" style={{display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
            
          
          <TabPanel id="files" style={{display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
            
          
          <TabPanel id="search" style={{display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
            
          
        
      
      <p>selectedKey: {String(selectedKey)}</p>
    </div>
  );
}
```

In components which support multiple selection, you can limit the selection to a single item using the
`selectionMode` prop. This continues to accept `selectedKeys` and `defaultSelectedKeys` as a `Set`, but it will
only contain a single id at a time.

### Animated SelectionIndicator

Render a `` within each collection item to animate selection changes. All CSS properties listed by `transition-property` are animated. Include the `translate` property to smoothly animate the position. Use the entering and exiting states to add a transition when no items are selected.

```tsx
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';
import {SelectionIndicator} from 'react-aria-components/ListBox';
import './SelectionIndicator.css';

function SelectableItem({id, children}) {
  return (
    <ListBoxItem id={id} className="animated-ListBoxItem">
      {/*- begin highlight -*/}
      
      {/*- end highlight -*/}
      {children}
    
  );
}

<ListBox
  aria-label="Animated ListBox"
  selectionMode="single">
  <SelectableItem id="home">Home
  <SelectableItem id="getting-started">Getting Started
  <SelectableItem id="components">Components

```

## Single selection (part 3)

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
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-SelectionIndicator' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `color` | `string | undefined` | — |  |
| `content` | `string | undefined` | — |  |

## Single selection (part 4)

| `contentEditable` | `"inherit" | "plaintext-only" | (boolean | "true" | "false") | undefined` | — |  |
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
| `isSelected` | `boolean | undefined` | — | Whether the SelectionIndicator is visible. This is usually set automatically by the parent component. |
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

## Single selection (part 5)

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

## Single selection (part 6)

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

## Single selection (part 7)

| `render` | `DOMRenderFunction<"div", SharedElementRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `resource` | `string | undefined` | — |  |
| `results` | `number | undefined` | — |  |
| `rev` | `string | undefined` | — |  |
| `role` | `React.AriaRole | undefined` | — |  |
| `security` | `string | undefined` | — |  |
| `slot` | `string | undefined` | — |  |
| `spellCheck` | `(boolean | "true" | "false") | undefined` | — |  |
| `style` | `(((values: SharedElementRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `suppressContentEditableWarning` | `boolean | undefined` | — |  |
| `suppressHydrationWarning` | `boolean | undefined` | — |  |
| `tabIndex` | `number | undefined` | — |  |
| `title` | `string | undefined` | — |  |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `typeof` | `string | undefined` | — |  |
| `unselectable` | `"off" | "on" | undefined` | — |  |
| `vocab` | `string | undefined` | — |  |

## Item actions

In addition to selection, some collection components support item actions via the `onAction` prop. In the default `"toggle"` selection behavior, when nothing is selected, clicking, tapping, or pressing the Enter key triggers the item action. Items may be selected using the checkbox, or by pressing the Space key. When at least one item is selected, clicking or tapping a row toggles the selection.

In the `"replace"` selection behavior, selection is the primary interaction. Clicking an item with a mouse selects it, and double clicking performs the action. On touch devices, actions remain the primary tap interaction. Long pressing enters selection mode, which temporarily swaps the selection behavior to `"toggle"`. Deselecting all items exits selection mode and reverts the selection behavior back to `"replace"`. Keyboard behaviors are unaffected.

## GridList example

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';

  <GridListItem
    /*- begin highlight -*/
    onAction={() => alert('Opening "Mountain Sunrise"')}
    /*- end highlight -*/
    textValue="Mountain Sunrise">
    <img src="https://images.unsplash.com/photo-1722172118908-1a97c312ce8c?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={900} alt="" />
    Mountain Sunrise
    <Text slot="description">PNG • 3/15/2015
  
  <GridListItem
    onAction={() => alert('Opening "Architecture"')}
    textValue="Architecture">
    <img src="https://images.unsplash.com/photo-1721661657253-6621d52db753?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDYxfE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D" width={600} height={900} alt="" />
    Architecture
    <Text slot="description">PNG • 12/24/2016
  
  <GridListItem
    onAction={() => alert('Opening "Golden Hour"')}
    textValue="Golden Hour">
    <img src="https://images.unsplash.com/photo-1718378037953-ab21bf2cf771?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={402} alt="" />
    Golden Hour
    <Text slot="description">WEBP • 7/24/2024
  

```

## Tree example

```tsx
import {Tree, TreeItem} from 'vanilla-starter/Tree';

<Tree
  aria-label="Files"
  selectionMode="multiple"
  
  defaultExpandedKeys={['computer']}>
  <TreeItem id="computer" title="My Computer">
    <TreeItem
      title="Games"
      /*- begin highlight -*/
      onAction={() => alert('Opening Games')} />
      {/*- end highlight -*/}
    <TreeItem
      title="Documents"
      onAction={() => alert('Opening Documents')} />
    <TreeItem
      title="Photos"
      onAction={() => alert('Opening Photos')} />
  

```

## Table example

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';

<Table
  aria-label="Table"
  selectionMode="multiple"
  >
  
    <Column isRowHeader>Name
    Type
    Date Modified
  
  
    {/*- begin highlight -*/}
    <Row onAction={() => alert('Opening Games')}>
    {/*- end highlight -*/}
      Games
      File folder
      6/7/2020
    
    <Row onAction={() => alert('Opening Documents')}>
      Documents
      File folder
      4/7/2021
    
    <Row onAction={() => alert('Opening Photos')}>
      Photos
      File folder
      11/20/2010
    
  

```

In dynamic collections, it may be more convenient to use the `onAction` prop at the collection level instead of on individual items. This receives the id of the pressed item.

## GridList example

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';

let images = [
  {
    title: "Rays of sun in the forest",
    user: "Joyce G",
    image: "https://images.unsplash.com/photo-1736185597807-371cae1c7e4e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    title: "Tall grass",
    user: "Ingmar H",
    image: "https://images.unsplash.com/photo-1737301519296-062cd324dbfa?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 600
  },
  {
    title: "Winding Road",
    user: "Artem Stoliar",
    image: "https://images.unsplash.com/photo-1738249034651-1896f689be58?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNDA4NDh8MHwxfHRvcGljfHw2c01WalRMU2tlUXx8fHx8Mnx8MTczODM2NzE4M3w&ixlib=rb-4.0.3&q=80&w=400",
    width: 400,
    height: 300
  }
];

<GridList
  aria-label="Files"
  selectionMode="multiple"
  data-size="small"
  
  items={images}
  /*- begin highlight -*/
  onAction={id => alert(`Opening "${id}"`)}>
  {/*- end highlight -*/}
  {image => (
    <GridListItem id={image.title} textValue={image.title}>
      <img src={image.image} width={image.width} height={image.height} alt="" />
      {image.title}
      <Text slot="description">By {image.user}
    
  )}

```

## Tree example

```tsx
import {Tree, TreeItem} from 'vanilla-starter/Tree';
import {Collection} from 'react-aria-components/Collection';

const files = [
  {id: 'games', name: 'Games'},
  {id: 'documents', name: 'Documents'},
  {id: 'photos', name: 'Photos'}
];

<Tree
  aria-label="Files"
  selectionMode="multiple"
  
  defaultExpandedKeys={['computer']}
  /*- begin highlight -*/
  onAction={id => alert(`Opening ${id}`)}>
  {/*- end highlight -*/}
  <TreeItem id="computer" title="My Computer">
    <Collection items={files}>
      {item => <TreeItem title={item.name} />}
    
  

```

## Table example

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';

const files = [
  {id: 'games', name: 'Games', type: 'Folder', date: '6/7/2020'},
  {id: 'documents', name: 'Documents', type: 'Folder', date: '4/7/2021'},
  {id: 'photos', name: 'Photos', type: 'Folder', date: '11/20/2010'}
];

<Table
  aria-label="Table"
  selectionMode="multiple"
  
  /*- begin highlight -*/
  onRowAction={id => alert(`Opening ${id}`)}>
  {/*- end highlight -*/}
  
    <Column isRowHeader>Name
    Type
    Date Modified
  
  <TableBody items={files}>
    {item => (
      
        {item.name}
        {item.type}
        {item.date}
      
    )}
  

```

## Disabled items

An item can be disabled with the `isDisabled` prop. By default, disabled items are not focusable, selectable, or actionable. When `disabledBehavior="selection"`, only selection is disabled.

## ListBox example

```tsx
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';

<ListBox aria-label="Pokemon" selectionMode="multiple">
  Charizard
  Blastoise
  {/*- begin highlight -*/}
  <ListBoxItem isDisabled>Venusaur
  {/*- end highlight -*/}
  Pikachu

```

## GridList example

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';

  <GridListItem textValue="Desert Sunset">
    <img src="https://images.unsplash.com/photo-1705034598432-1694e203cdf3?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width={600} height={400} alt="" />
    Desert Sunset
    <Text slot="description">PNG • 2/3/2024
  
  {/*- begin highlight -*/}
  <GridListItem isDisabled textValue="Hiking Trail">
  {/*- end highlight -*/}
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
  

```

## Tree example

```tsx
import {Tree, TreeItem} from 'vanilla-starter/Tree';

<Tree
  aria-label="Pokemon evolution"
  style={{height: 250}}
  defaultExpandedKeys={['bulbasaur', 'ivysaur']}
  
  selectionMode="multiple">
  <TreeItem id="bulbasaur" title="Bulbasaur">
    <TreeItem id="ivysaur" title="Ivysaur">
      {/*- begin highlight -*/}
      <TreeItem id="venusaur" title="Venusaur" isDisabled />
      {/*- end highlight -*/}
    
  
  <TreeItem id="charmander" title="Charmander">
    <TreeItem id="charmeleon" title="Charmeleon">
      <TreeItem id="charizard" title="Charizard" />
    
  
  <TreeItem id="squirtle" title="Squirtle">
    <TreeItem id="wartortle" title="Wartortle">
      <TreeItem id="blastoise" title="Blastoise" />
    
  

```

## TagGroup example

```tsx
import {TagGroup, Tag} from 'vanilla-starter/TagGroup';

<TagGroup
  label="Pokemon"
  
  selectionMode="multiple">
  Charizard
  Blastoise
  {/*- begin highlight -*/}
  <Tag isDisabled>Venusaur
  {/*- end highlight -*/}
  Pikachu

```

## Table example

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';

<Table
  aria-label="Pokemon"
  
  selectionMode="multiple">
  
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
    
    {/*- begin highlight -*/}
    <Row id="venusaur" isDisabled>
    {/*- end highlight -*/}
      Venusaur
      Grass, Poison
      83
    
    <Row id="pikachu">
      Pikachu
      Electric
      100
    
  

```

In dynamic collections, it may be more convenient to use the `disabledKeys` prop at the collection level instead of `isDisabled` on individual items. This accepts a list of item ids that are disabled.

## ListBox example

```tsx
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';

const items = [
  {id: 1, name: 'Charizard'},
  {id: 2, name: 'Blastoise'},
  {id: 3, name: 'Venusaur'},
  {id: 4, name: 'Pikachu'}
];

<ListBox
  aria-label="Pokemon"
  
  disabledKeys={[3]}
  selectionMode="multiple"
  items={items}>
  {item => {item.name}}

```

## GridList example

```tsx
import {GridList, GridListItem, Text} from 'vanilla-starter/GridList';

const items = [
  {id: 1, name: 'Charizard'},
  {id: 2, name: 'Blastoise'},
  {id: 3, name: 'Venusaur'},
  {id: 4, name: 'Pikachu'}
];

<GridList
  aria-label="Pokemon"
  data-size="small"
  
  disabledKeys={[3]}
  items={items}>
  {item => (
    <GridListItem textValue={item.name}>
      <img src={`https://img.pokemondb.net/sprites/home/normal/2x/avif/${item.name.toLowerCase()}.avif`} alt="" />
      {item.name}
    
  )}

```

## Tree example

```tsx
import {Tree, TreeItem} from 'vanilla-starter/Tree';
import {Collection} from 'react-aria-components/Collection';

type Pokemon = {
  id: number;
  name: string;
  type: string;
  level: number;
  children?: Pokemon[];
};

let items: Pokemon[] = [
  {id: 1, name: 'Bulbasaur', type: 'Grass', level: 14, children: [
    {id: 2, name: 'Ivysaur', type: 'Grass', level: 30, children: [
      {id: 3, name: 'Venusaur', type: 'Grass', level: 83}
    ]}
  ]},
  {id: 4, name: 'Charmander', type: 'Fire', level: 16, children: [
    {id: 5, name: 'Charmeleon', type: 'Fire', level: 32, children: [
      {id: 6, name: 'Charizard', type: 'Fire, Flying', level: 67}
    ]}
  ]},
  {id: 7, name: 'Squirtle', type: 'Water', level: 8, children: [
    {id: 8, name: 'Wartortle', type: 'Water', level: 34, children: [
      {id: 9, name: 'Blastoise', type: 'Water', level: 56}
    ]}
  ]}
];

<Tree
  aria-label="Pokemon evolution"
  style={{height: 250}}
  defaultExpandedKeys={[1, 2]}
  selectionMode="multiple"
  
  disabledKeys={[3]}
  items={items}>
  {function renderItem(item: Pokemon) {
    return (
      <TreeItem title={item.name}>
        <Collection items={item.children}>
          {renderItem}
        
      
    )
  }}

```

## TagGroup example

```tsx
import {TagGroup, Tag} from 'vanilla-starter/TagGroup';

const items = [
  {id: 1, name: 'Charizard'},
  {id: 2, name: 'Blastoise'},
  {id: 3, name: 'Venusaur'},
  {id: 4, name: 'Pikachu'}
];

<TagGroup
  aria-label="Pokemon"
  selectionMode="multiple"
  
  disabledKeys={[3]}
  items={items}>
  {item => {item.name}}

```

## Table example

```tsx
import {Table, TableHeader, Column, Row, TableBody, Cell} from 'vanilla-starter/Table';

let items = [
  {id: 1, name: 'Charizard', type: 'Fire, Flying', level: 67},
  {id: 2, name: 'Blastoise', type: 'Water', level: 56},
  {id: 3, name: 'Venusaur', type: 'Grass, Poison', level: 83},
  {id: 4, name: 'Pikachu', type: 'Electric', level: 100}
];

<Table
  aria-label="Pokemon"
  
  disabledKeys={[3]}
  selectionMode="multiple">
  
    <Column isRowHeader>Name
    Type
    Level
  
  <TableBody items={items}>
    {item => (
      
        {item.name}
        {item.type}
        {item.level}
      
    )}
  

```

