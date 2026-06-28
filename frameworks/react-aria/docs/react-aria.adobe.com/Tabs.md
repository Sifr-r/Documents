# Tabs

## Introduction

Tabs organize content into multiple sections and allow users to navigate between them.

## Vanilla CSS example

```tsx
import {Tabs, TabList, Tab, TabPanels, TabPanel} from 'vanilla-starter/Tabs';
import {Form} from 'vanilla-starter/Form';
import {TextField} from 'vanilla-starter/TextField';
import {Button} from 'vanilla-starter/Button';
import {RadioGroup, Radio} from 'vanilla-starter/RadioGroup';
import {CheckboxGroup} from 'vanilla-starter/CheckboxGroup';
import {Checkbox} from 'vanilla-starter/Checkbox';

  <TabList aria-label="Settings">
    <Tab id="general">General
    <Tab id="appearance">Appearance
    <Tab id="notifications">Notifications
    <Tab id="profile">Profile
  
  
    <TabPanel id="general">
      
        <TextField label="Homepage" defaultValue="react-aria.adobe.com" />
        <Checkbox defaultSelected>Show sidebar
        Show status bar
      
    
    <TabPanel id="appearance">
      
        <RadioGroup label="Theme" defaultValue="auto">
          <Radio value="auto">Auto
          <Radio value="light">Light
          <Radio value="dark">Dark
        
        <RadioGroup label="Font size" defaultValue="medium">
          <Radio value="small">Small
          <Radio value="medium">Medium
          <Radio value="large">Large
        
      
    
    <TabPanel id="notifications">
      <CheckboxGroup label="Notifications settings" defaultValue={['account', 'dms']}>
        <Checkbox value="account">Account activity
        <Checkbox value="mentions">Mentions
        <Checkbox value="dms">Direct message
        <Checkbox value="marketing">Marketing emails
      
    
    <TabPanel id="profile">
      
        <TextField label="Name" defaultValue="Devon Govett" />
        <TextField label="Username" defaultValue="@devongovett" />
        Update profile
      
    
  

```

### Tabs.tsx

```tsx
'use client';
import {
  Tabs as RACTabs,
  TabList as RACTabList,
  type TabListProps,
  type TabProps,
  Tab as RACTab,
  type TabsProps,
  TabPanels as RACTabPanels,
  type TabPanelProps,
  TabPanel as RACTabPanel,
  SelectionIndicator,
  type TabPanelsProps
} from 'react-aria-components/Tabs';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import './Tabs.css';

export function Tabs(props: TabsProps) {
  return <RACTabs {...props} />;
}

export function TabList(props: TabListProps) {
  return <RACTabList {...props} />;
}

export function Tab(props: TabProps) {
  return (
    <RACTab {...props}>
      {composeRenderProps(props.children, children => (
        <>
          {children}
          
        </>
      ))}
    
  );
}

export function TabPanels(props: TabPanelsProps) {
  return <RACTabPanels {...props} />;
}

export function TabPanel(props: TabPanelProps) {
  return <RACTabPanel {...props} />;
}

```

### Tabs.css

```css
@import './theme.css';

.react-aria-Tabs {
  display: flex;
  gap: var(--spacing-2);
  color: var(--text-color);
  max-width: 100%;

  &[data-orientation='horizontal'] {
    flex-direction: column;
  }

  &[data-orientation='vertical'] {
    flex-direction: row;
    width: 100%;
    .react-aria-TabPanels {
      flex: 1;
    }
  }
}

.react-aria-TabList {
  display: flex;

  .react-aria-SelectionIndicator {
    background: var(--border-color);
  }

## Vanilla CSS example (part 2)

&[data-orientation='horizontal'] {
    border-bottom: 0.5px solid var(--border-color);
    max-width: 100%;
    overflow-x: auto;
    overflow-y: clip;
    scrollbar-width: none;

    .react-aria-SelectionIndicator {
      left: 0;
      bottom: 0px;
      width: 100%;
      height: 3px;
      transition-property: translate, width;
    }
  }

  &[data-orientation='vertical'] {
    flex-direction: column;
    border-inline-end: 1px solid var(--border-color);

    .react-aria-SelectionIndicator {
      top: 0;
      right: 0px;
      height: 100%;
      width: 3px;
      transition-property: translate, height;
    }
  }
}

.react-aria-Tab {
  padding: 10px;
  cursor: default;
  outline: none;
  position: relative;
  font: var(--font-size) system-ui;
  color: var(--text-color);
  transition: color 200ms;
  --border-color: transparent;
  forced-color-adjust: none;
  -webkit-tap-highlight-color: transparent;

  &[data-hovered],
  &[data-focus-visible] {
    color: var(--text-color-hover);
  }

  .react-aria-SelectionIndicator {
    position: absolute;
    transition-duration: 200ms;
    border-radius: 3px;

    @media (prefers-reduced-motion: reduce) {
      transition: none;
    }
  }

  &[data-selected] {
    --border-color: var(--highlight-background);
    color: var(--text-color-hover);
  }

  &[data-disabled] {
    color: var(--text-color-disabled);
    &[data-selected] {
      --border-color: var(--text-color-disabled);
    }
  }

  &[data-focus-visible] {
    border-radius: calc(var(--radius-sm) + 8px);
    outline: 2px solid var(--focus-ring-color);
    outline-offset: -8px;
  }

  &[href] {
    text-decoration: none;
    cursor: pointer;
  }
}

.react-aria-TabPanels {
  position: relative;
  height: var(--tab-panel-height);
  width: var(--tab-panel-width);
  transition: height 400ms;
  overflow: clip;

  @media (prefers-reduced-motion: reduce) {
    transition: none;
  }
}

.react-aria-TabPanel {
  padding: var(--spacing-3);
  border-radius: var(--radius);
  outline: none;
  box-sizing: border-box;
  transition: opacity 400ms;

  &[data-focus-visible] {
    outline: 2px solid var(--focus-ring-color);
  }

  &[data-entering],
  &[data-exiting] {
    opacity: 0;
  }

  &[data-exiting] {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
  }
}

```

## Tailwind example

```tsx
import {Tabs, TabList, Tab, TabPanels, TabPanel} from 'tailwind-starter/Tabs';
import Home from '@react-spectrum/s2/illustrations/gradient/generic2/Home';
import Folder from '@react-spectrum/s2/illustrations/gradient/generic2/FolderOpen';
import Search from '@react-spectrum/s2/illustrations/gradient/generic2/Search';
import Settings from '@react-spectrum/s2/illustrations/gradient/generic1/GearSetting';

  <TabList aria-label="Tabs">
    <Tab id="home">Home
    <Tab id="files">Files
    <Tab id="search">Search
    <Tab id="settings">Settings
  
  
    <TabPanel id="home" className="flex items-center justify-center">
      
    
    <TabPanel id="files" className="flex items-center justify-center">
      
    
    <TabPanel id="search" className="flex items-center justify-center">
      
    
    <TabPanel id="settings" className="flex items-center justify-center">
      
    
  

```

### Tabs.tsx

```tsx
'use client';
import React from 'react';
import {
  Tab as RACTab,
  TabList as RACTabList,
  TabPanels as RACTabPanels,
  TabPanel as RACTabPanel,
  Tabs as RACTabs,
  SelectionIndicator,
  type TabListProps,
  type TabPanelProps,
  type TabPanelsProps,
  type TabProps,
  type TabsProps
} from 'react-aria-components/Tabs';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {tv} from 'tailwind-variants';
import {focusRing} from './utils';
import {twMerge} from 'tailwind-merge';

const tabsStyles = tv({
  base: 'flex gap-4 font-sans max-w-full',
  variants: {
    orientation: {
      horizontal: 'flex-col',
      vertical: 'flex-row'
    }
  }
});

export function Tabs(props: TabsProps) {
  return (
    <RACTabs
      {...props}
      className={composeRenderProps(props.className, (className, renderProps) =>
        tabsStyles({...renderProps, className})
      )}
    />
  );
}

const tabListStyles = tv({
  base: 'flex max-w-full p-1 -m-1 overflow-x-auto overflow-y-clip [scrollbar-width:none]',
  variants: {
    orientation: {
      horizontal: 'flex-row',
      vertical: 'flex-col items-start'
    }
  }
});

export function TabList(props: TabListProps) {
  return (
    <RACTabList
      {...props}
      className={composeRenderProps(props.className, (className, renderProps) =>
        tabListStyles({...renderProps, className})
      )}
    />
  );
}

const tabProps = tv({
  extend: focusRing,
  base: 'group relative flex items-center cursor-default rounded-full px-3 py-1.5 text-sm font-medium transition forced-color-adjust-none [-webkit-tap-highlight-color:transparent]',
  variants: {
    isDisabled: {
      true: 'text-neutral-200 dark:text-neutral-600 forced-colors:text-[GrayText] selected:text-white dark:selected:text-neutral-500 forced-colors:selected:text-[HighlightText] selected:bg-neutral-200 dark:selected:bg-neutral-600 forced-colors:selected:bg-[GrayText]'
    }
  }
});

## Tailwind example (part 2)

export function Tab(props: TabProps) {
  return (
    <RACTab
      {...props}
      className={composeRenderProps(props.className, (className, renderProps) =>
        tabProps({...renderProps, className})
      )}>
      {composeRenderProps(props.children, children => (
        <>
          {children}
          <SelectionIndicator className="absolute top-0 left-0 w-full h-full z-10 bg-white rounded-full mix-blend-difference group-disabled:bg-neutral-400 group-disabled:mix-blend-normal group-disabled:dark:bg-neutral-600 group-disabled:-z-1 motion-safe:transition-[translate,width,height] " />
        </>
      ))}
    
  );
}

export function TabPanels(props: TabPanelsProps) {
  return (
    <RACTabPanels
      {...props}
      className={twMerge(
        'relative h-(--tab-panel-height) motion-safe:transition-[height] overflow-clip',
        props.className
      )}
    />
  );
}

const tabPanelStyles = tv({
  extend: focusRing,
  base: 'flex-1 box-border p-4 text-sm text-neutral-900 dark:text-neutral-100 transition entering:opacity-0 exiting:opacity-0 exiting:absolute exiting:top-0 exiting:left-0 exiting:w-full'
});

export function TabPanel(props: TabPanelProps) {
  return (
    <RACTabPanel
      {...props}
      className={composeRenderProps(props.className, (className, renderProps) =>
        tabPanelStyles({...renderProps, className})
      )}
    />
  );
}

```

## Content

`TabList` follows the [Collection Components API](collections.md?component=TabList), accepting both static and dynamic collections. This example shows a dynamic collection, passing a list of objects to the `items` prop, and a function to render the children.

```tsx
import {Tabs, TabList, Tab, TabPanels, TabPanel} from 'vanilla-starter/Tabs';
import {Button} from 'vanilla-starter/Button';
import {useState} from 'react';
import {Plus, Minus} from 'lucide-react';

function Example() {
  let [tabs, setTabs] = useState([
    {id: 1, title: 'Tab 1', content: 'Tab body 1'},
    {id: 2, title: 'Tab 2', content: 'Tab body 2'},
    {id: 3, title: 'Tab 3', content: 'Tab body 3'}
  ]);

  let addTab = () => {
    setTabs(tabs => [
      ...tabs,
      {
        id: tabs.length + 1,
        title: `Tab ${tabs.length + 1}`,
        content: `Tab body ${tabs.length + 1}`
      }
    ]);
  };

  let removeTab = () => {
    if (tabs.length > 1) {
      setTabs(tabs => tabs.slice(0, -1));
    }
  };

  return (
    <Tabs style={{width: '100%'}}>
      <div style={{display: 'flex'}}>
        <TabList
          aria-label="Dynamic tabs"
          items={tabs}
          style={{flex: 1}}>
          {item => {item.title}}
        
        <div className="button-group">
          <Button onPress={addTab} aria-label="Add tab">
            
          
          <Button onPress={removeTab} aria-label="Remove tab">
            
          
        </div>
      </div>
      <TabPanels items={tabs}>
        {item => {item.content}}
      
    
  );
}
```

```css
.button-group {
  border-bottom: 0.5px solid var(--border-color);
  display: flex;
  align-items: center;
  gap: 8px;
}
```

### Links

Use the `href` prop on a `` to create a link. By default, links are rendered as an `<a>` element. Use the `render` prop to integrate your framework's link component.

```tsx
<Tab
  href="/home"
  render={domProps =>
    'href' in domProps
      ? <RouterLink {...domProps} />
      : <div {...domProps} />
  } />
```

## Selection

Use the `defaultSelectedKey` or `selectedKey` prop to set the selected tab. The selected key corresponds to the `id` prop of a ``. Tabs can be disabled with the `isDisabled` prop. See the [selection guide](selection.md?component=Tabs#single-selection) for more details.

```tsx
import type {Key} from 'react-aria-components/Tabs';
import {Tabs, TabList, Tab, TabPanels, TabPanel} from 'vanilla-starter/Tabs';
import Home from '@react-spectrum/s2/illustrations/gradient/generic2/Home';
import Folder from '@react-spectrum/s2/illustrations/gradient/generic2/FolderOpen';
import Search from '@react-spectrum/s2/illustrations/gradient/generic2/Search';
import Settings from '@react-spectrum/s2/illustrations/gradient/generic1/GearSetting';
import {useState} from 'react';

function Example() {
  let [tab, setTab] = useState("files");

  return (
    <div>
      <Tabs
        selectedKey={tab}
        onSelectionChange={setTab}
      >
        <TabList aria-label="Tabs">
          <Tab id="home">Home
          <Tab id="files">Files
          <Tab id="search" isDisabled>Search
          <Tab id="settings">Settings
        
        
          <TabPanel id="home" style={{display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
            
          
          <TabPanel id="files" style={{display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
            
          
          <TabPanel id="search" style={{display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
            
          
          <TabPanel id="settings" style={{display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
            
          
        
      
      <p>Selected tab: {tab}</p>
    </div>
  );
}
```

## Examples

<ExampleList
  tag="tabs"
  pages={props.pages}
/>

## API

```tsx

  
    
      
    
  
  
    
  

```

### Tabs

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Tabs' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultSelectedKey` | `Key | undefined` | — | The initial selected keys in the collection (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `disabledKeys` | `Iterable | undefined` | — | The item keys that are disabled. These items cannot be selected, focused, or otherwise interacted with. |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `isDisabled` | `boolean | undefined` | — | Whether the TabList is disabled. Shows that a selection exists, but is not available in that circumstance. |
| `keyboardActivation` | `"automatic" | "manual" | undefined` | 'automatic' | Whether tabs are activated automatically on focus or manually. |
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

## API (part 3)

| `onPointerOver` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerOverCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerUp` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerUpCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onScroll` | `React.UIEventHandler | undefined` | — |  |
| `onScrollCapture` | `React.UIEventHandler | undefined` | — |  |
| `onSelectionChange` | `((key: Key) => void) | undefined` | — | Handler that is called when the selection changes. |
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
| `orientation` | `Orientation | undefined` | 'horizontal' | The orientation of the tabs. |
| `render` | `DOMRenderFunction<"div", TabsRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `selectedKey` | `Key | undefined` | — | The currently selected key in the collection (controlled). |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: TabsRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 4)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `((item: T) => React.ReactNode) | React.ReactNode` | — | The contents of the collection. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-TabList' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
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

## API (part 5)

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
| `render` | `DOMRenderFunction<"div", TabListRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style` | `(((values: TabListRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 6)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Tab' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `dir` | `string | undefined` | — |  |
| `download` | `boolean | string | undefined` | — | Causes the browser to download the linked URL. A string may be provided to suggest a file name. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#download). |
| `hidden` | `boolean | undefined` | — |  |
| `href` | `string | undefined` | — | A URL to link to. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#href). |
| `hrefLang` | `string | undefined` | — | Hints at the human language of the linked URL. See[MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#hreflang). |
| `id` | `Key | undefined` | — | The unique id of the tab. |
| `inert` | `boolean | undefined` | — |  |
| `isDisabled` | `boolean | undefined` | — | Whether the tab is disabled. |
| `lang` | `string | undefined` | — |  |
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

## API (part 7)

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

## API (part 8)

| `render` | `((props: React.DetailedHTMLProps<Required<Pick<React.AnchorHTMLAttributes, "href">> & Omit<React.AnchorHTMLAttributes, "href">, HTMLAnchorElement> | React.DetailedHTMLProps<React.HTMLAttributes, HTMLDivElement>, renderProps: TabRenderProps) => React.ReactElement) | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Note: You can check if `'href' in props` in order to tell whether to render an `<a>` element. Requirements: - You must render the expected element type (e.g. if `<a>` is expected, you cannot render a   `<button>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `routerOptions` | `undefined` | — | Options for the configured client side router. |
| `style` | `(((values: TabRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `target` | `React.HTMLAttributeAnchorTarget | undefined` | — | The target window for the link. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#target). |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 9)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `((item: T) => React.ReactNode) | React.ReactNode` | — | The contents of the collection. |
| `className` | `string | undefined` | 'react-aria-TabPanels' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
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

## API (part 10)

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

## API (part 11)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-TabPanel' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `dir` | `string | undefined` | — |  |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `Key | undefined` | — | The unique id of the tab. |
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

## API (part 12)

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
| `render` | `DOMRenderFunction<"div", TabPanelRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `shouldForceMount` | `boolean | undefined` | false | Whether to mount the tab panel in the DOM even when it is not currently selected. Inactive tab panels are inert and cannot be interacted with. They must be styled appropriately so this is clear to the user visually. |
| `style` | `(((values: TabPanelRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

