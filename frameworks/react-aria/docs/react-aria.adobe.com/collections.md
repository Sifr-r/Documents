# collections

## Introduction

Many components display a collection of items, and provide functionality such as keyboard navigation, and selection. Learn how to load and render collections using React Aria's compositional API.

## Static collections

A **static collection** is a collection that does not change over time (e.g. hard coded). This is common for components like menus where the items are built into the application rather than user data.

```tsx
import {MenuTrigger, Menu, MenuItem} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';

  Menu
  
    Open
    Edit
    Delete
  

```

### Sections

Sections or groups of items can be constructed by wrapping the items in a section element. A `` can also be rendered within a section to provide a section title.

## Menu example

```tsx
import {MenuTrigger, Menu, MenuItem, MenuSection, Header} from 'vanilla-starter/Menu';
import {Button} from 'vanilla-starter/Button';

  Menu
  
    {/*- begin highlight -*/}
    
      Styles
      {/*- end highlight -*/}
      Bold
      Underline
    
    
      Align
      Left
      Middle
      Right
    
  

```

## ListBox example

```tsx
import {ListBox, ListBoxItem, ListBoxSection, Header} from 'vanilla-starter/ListBox';

<ListBox aria-label="Text style" selectionMode="multiple">
  {/*- begin highlight -*/}
  
    Styles
    {/*- end highlight -*/}
    Bold
    Underline
  
  
    Align
    Left
    Middle
    Right
  

```

## Dynamic collections

A **dynamic collection** is a collection that is based on external data, for example from an API. In addition, it may change over time as items are added, updated, or removed from the collection by a user.

Use the `items` prop to provide an array of objects, and a function to render each item as the `children`. This is similar to using `array.map` to render the children, but automatically memoizes the rendering of each item to improve performance.

```tsx
import {ListBox, ListBoxItem} from 'vanilla-starter/ListBox';
import {Button} from 'vanilla-starter/Button';
import {useState} from 'react';

function Example() {
  let [animals, setAnimals] = useState([
    {id: 1, name: 'Aardvark'},
    {id: 2, name: 'Kangaroo'},
    {id: 3, name: 'Snake'}
  ]);

  let addItem = () => {
    setAnimals([
      ...animals,
      {id: animals.length + 1, name: 'Lion'}
    ]);
  };

  return (
    <div>
      {/*- begin highlight -*/}
      <ListBox aria-label="Animals" items={animals}>
        {item => {item.name}}
      
      {/*- end highlight -*/}
      <Button onPress={addItem} style={{marginTop: 8}}>Add item
    </div>
  );
}
```

<InlineAlert variant="informative">
  useListData
  For convenience, React Aria provides a built-in [useListData](useListData.md) hook to manage state for an immutable list of items. It includes methods to add, remove, update, and re-order items, and manage corresponding selection state. See the docs for more details.

### Unique ids

All items in a collection must have a unique id, which is used for [selection](selection.md) and to track item updates. By default, React Aria looks for an `id` property on each object in the `items` array. You can also specify an `id` prop when rendering each item. This example uses `item.name` as the `id`.

```tsx
let animals = [
  {name: 'Aardvark'},
  {name: 'Kangaroo'},
  {name: 'Snake'}
];

<ListBox items={animals}>
  {item => (
    /*- begin highlight -*/
    <ListBoxItem id={item.name}>
    {/*- end highlight -*/}
      {item.name}
    
  )}

```

<InlineAlert variant="notice">
  React keys
  React Aria automatically sets the React `key` using `id`. If using `array.map`, you'll need to set both `key` and `id`.

### Dependencies

Dynamic collections are automatically memoized to improve performance. Rendered item elements are cached based on the object identity of the list item. If rendering an item depends on additional external state, the `dependencies` prop must be provided. This invalidates rendered elements similar to dependencies in React's `useMemo` hook.

```tsx
import {ListBox, ListBoxItem, Text} from 'vanilla-starter/ListBox';
import {ToggleButtonGroup} from 'vanilla-starter/ToggleButtonGroup';
import {ToggleButton} from 'vanilla-starter/ToggleButton';
import {useState} from 'react';

const items = [
  {id: 1, name: 'Charizard', type: 'Fire, Flying'},
  {id: 2, name: 'Blastoise', type: 'Water'},
  {id: 3, name: 'Venusaur', type: 'Grass, Poison'},
  {id: 4, name: 'Pikachu', type: 'Electric'}
];

type Orientation = 'vertical' | 'horizontal';

export default function Example() {
  let [layout, setLayout] = useState('vertical');

## Dynamic collections (part 2)

return (
    <div>
      <ToggleButtonGroup
        aria-label="Layout"
        selectedKeys={[layout]}
        onSelectionChange={keys => setLayout([...keys][0] as Orientation)}
        disallowEmptySelection
        style={{marginBottom: 8}}>
        <ToggleButton id="vertical">Vertical
        <ToggleButton id="horizontal">Horizontal
      
      <ListBox
        items={items}
        selectionMode="multiple"
        /*- begin highlight -*/
        dependencies={[layout]}>
        {/*- end highlight -*/}
        {item => (
          <MyItem
            /*- begin highlight -*/
            layout={layout}
            /*- end highlight -*/
            name={item.name}
            type={item.type} />
        )}
      
    </div>
  );
}

interface MyItemProps {
  layout: 'horizontal' | 'vertical',
  name: string,
  type: string
}

function MyItem(props: MyItemProps) {
  return (
    <ListBoxItem
      style={{
        display: 'flex',
        flexDirection: props.layout === 'horizontal' ? 'row' : 'column',
        justifyContent: 'space-between',
        alignItems: props.layout === 'horizontal' ? 'center' : 'start'
      }}>
      <Text slot="label">{props.name}
      <Text slot="description">{props.type}
    
  );
}
```

Note that adding dependencies will result in the *entire* list being invalidated when a dependency changes. To avoid this and invalidate only an individual item, update the item object itself rather than accessing external state.

### Combining collections

To combine multiple sources of data, or mix static and dynamic items, use the `` component.

```tsx
import {ListBox, ListBoxSection, ListBoxItem, Header} from 'vanilla-starter/ListBox';
import {Collection} from 'react-aria-components/Collection';

let animals = [
  {id: 1, species: 'Aardvark'},
  {id: 2, species: 'Kangaroo'},
  {id: 3, species: 'Snake'}
];

let people = [
  {id: 4, name: 'David'},
  {id: 5, name: 'Mike'},
  {id: 6, name: 'Jane'}
];

<ListBox aria-label="Grouped items">
  
    Animals
    {/*- begin highlight -*/}
    <Collection items={animals}>
      {item => <ListBoxItem id={item.species}>{item.species}}
    
    {/*- end highlight -*/}
  
  
    People
    <Collection items={people}>
      {item => <ListBoxItem id={item.name}>{item.name}}
    
  

```

<InlineAlert variant="notice">
  Globally unique ids
  Unlike React keys which must only be unique within each element, the `id` prop must be globally unique across all sections. In the above example, the ids of `animals` and `people` do not conflict.

## Asynchronous loading

Data can be loaded asynchronously using any data fetching library. [useAsyncList](useAsyncList.md) is a built-in option.

Several components also support infinite scrolling by rendering a `LoadMoreItem` at the end of the list. These trigger loading of additional pages of items and display a loading spinner. Multiple load more items can be rendered at once, e.g. when loading multiple levels of a tree or sections in a list.

```tsx
import {Collection} from 'react-aria-components/Collection';
import {useAsyncList} from 'react-aria-components/useAsyncList';
import {ListBox, ListBoxItem, ListBoxLoadMoreItem} from 'vanilla-starter/ListBox';
import {ProgressCircle} from 'vanilla-starter/ProgressCircle';

interface Character {
  name: string
}

function AsyncLoadingExample() {
  /*- begin focus -*/
  let list = useAsyncList({
    async load({signal, cursor}) {
      let res = await fetch(
        cursor || `https://pokeapi.co/api/v2/pokemon`,
        {signal}
      );
      let json = await res.json();

      return {
        items: json.results,
        cursor: json.next
      };
    }
  });
  /*- end focus -*/

  return (
    <ListBox
      aria-label="Pick a Pokemon"
      selectionMode="single"
      renderEmptyState={() => (
        <ProgressCircle isIndeterminate aria-label="Loading..." />
      )}>
      <Collection items={list.items}>
        {(item) => <ListBoxItem id={item.name}>{item.name}}
      
      <ListBoxLoadMoreItem
        onLoadMore={list.loadMore}
        isLoading={list.loadingState === 'loadingMore'}>
        <ProgressCircle isIndeterminate aria-label="Loading more..." />
      
    
  );
}
```

