# swipeable-tabs

## Introduction

A swipeable [Tabs](../Tabs.md) component with [CSS scroll snapping](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_scroll_snap), [scroll-driven animations](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_scroll-driven_animations), and [anchor positioning](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_anchor_positioning).

```tsx
import {Tabs} from './Tabs';
import {TabList} from './TabList';
import {Tab} from './Tab';
import {TabPanel} from './TabPanel';
import {TabSelectionIndicator} from './TabSelectionIndicator';
import {TabPanelCarousel} from './TabPanelCarousel';

<Tabs className="w-[400px] max-w-full">
  <TabList aria-label="Tabs">
    <Tab id="home">Home
    <Tab id="files">Files
    <Tab id="search">Search
    <Tab id="settings">Settings
  
  
  
    <TabPanel id="home" shouldForceMount>
      <p className="font-bold">Home</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sit amet nisl blandit, pellentesque eros eu, scelerisque eros. Sed cursus urna at nunc lacinia dapibus.</p>
    
    <TabPanel id="files" shouldForceMount>
      <p className="font-bold">Files</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sit amet nisl blandit, pellentesque eros eu, scelerisque eros. Sed cursus urna at nunc lacinia dapibus.</p>
    
    <TabPanel id="search" shouldForceMount>
      <p className="font-bold">Search</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sit amet nisl blandit, pellentesque eros eu, scelerisque eros. Sed cursus urna at nunc lacinia dapibus.</p>
    
    <TabPanel id="settings" shouldForceMount>
      <p className="font-bold">Settings</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sit amet nisl blandit, pellentesque eros eu, scelerisque eros. Sed cursus urna at nunc lacinia dapibus.</p>
    
  

```

## Components

<ComponentList
  pages={props.pages}
  components={[
    'react-aria/Tabs'
  ]}
/>

