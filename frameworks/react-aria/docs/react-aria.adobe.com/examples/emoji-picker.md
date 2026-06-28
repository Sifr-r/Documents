# emoji-picker

## Introduction

An emoji picker with autocomplete, virtualized scrolling, and arrow key navigation.

```tsx
import {Select, SelectValue, ListBox, ListBoxItem} from 'react-aria-components/Select';
import {Autocomplete, useFilter} from 'react-aria-components/Autocomplete';
import {Virtualizer, GridLayout, Size} from 'react-aria-components/Virtualizer';
import {Button} from 'vanilla-starter/Button';
import {Popover} from 'vanilla-starter/Popover';
import {SearchField} from 'vanilla-starter/SearchField';
import _emojis from 'emojibase-data/en/compact.json';
import './EmojiPicker.css';

type Emoji = (typeof _emojis)[0];
const emojis: Emoji[] = _emojis.filter((e) => typeof e.label === 'string' && !e.label.startsWith('regional indicator'));

export default function EmojiPicker() {
  let {contains} = useFilter({ sensitivity: 'base' });

  return (
    <Select aria-label="Emoji" className="emoji-picker" defaultValue="🥳">
      <Button variant="secondary">
        
      
      <Popover placement="bottom" className="emoji-picker-popover">
        <Autocomplete filter={contains}>
          <SearchField aria-label="Search" placeholder="Search emoji" autoFocus />
          <Virtualizer
            layout={GridLayout}
            layoutOptions={{
              minItemSize: new Size(32, 32),
              maxItemSize: new Size(32, 32),
              minSpace: new Size(4, 4),
              preserveAspectRatio: true,
            }}>
            <ListBox className="emoji-list" items={emojis} aria-label="Emoji list" layout="grid">
              {(item) => <EmojiItem id={String(item.unicode)} item={item} />}
            
          
        
      
    
  );
}

function EmojiItem({ id, item }: { id: string; item: Emoji }) {
  return (
    <ListBoxItem
      id={id}
      value={item}
      textValue={(item.label || '') + (Array.isArray(item.tags) ? item.tags.join(' ') : '')}
      className="emoji-item">
      {item.unicode}
    
  );
}
```

## Components

<ComponentList
  pages={props.pages}
  components={[
    'react-aria/ListBox',
    'react-aria/Popover',
    'react-aria/SearchField',
    'react-aria/Select',
    'react-aria/Virtualizer'
  ]}
/>

