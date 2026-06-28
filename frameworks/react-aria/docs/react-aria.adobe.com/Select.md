# Select

## Introduction

A select displays a collapsible list of options and allows a user to select one of them.

## Vanilla CSS example

```tsx
import {Select, SelectItem} from 'vanilla-starter/Select';

  Aardvark
  Cat
  Dog
  Kangaroo
  Panda
  Snake

```

### Select.tsx

```tsx
'use client';
import {
  type ListBoxItemProps,
  Select as AriaSelect,
  type SelectProps as AriaSelectProps,
  SelectValue,
  type ValidationResult,
  type ListBoxProps
} from 'react-aria-components/Select';
import {Button} from './Button';
import {DropdownItem, DropdownListBox} from './ListBox';
import {ChevronDown} from 'lucide-react';
import {Popover} from './Popover';
import {Label, FieldError, Description} from './Form';
import './Select.css';

export interface SelectProps<T, M extends 'single' | 'multiple'> extends Omit<
  AriaSelectProps<T, M>,
  'children'
> {
  label?: string;
  description?: string;
  errorMessage?: string | ((validation: ValidationResult) => string);
  items?: Iterable;
  children: React.ReactNode | ((item: T) => React.ReactNode);
}

export function Select<T, M extends 'single' | 'multiple' = 'single'>({
  label,
  description,
  errorMessage,
  children,
  items,
  ...props
}: SelectProps<T, M>) {
  return (
    <AriaSelect {...props}>
      {label && {label}}
      
        
        
      
      {description && {description}}
      {errorMessage}
      <Popover hideArrow className="select-popover">
        <SelectListBox items={items}>{children}
      
    
  );
}

export function SelectListBox(props: ListBoxProps) {
  return <DropdownListBox {...props} />;
}

export function SelectItem(props: ListBoxItemProps) {
  return <DropdownItem {...props} />;
}

```

### Select.css

```css
@import './theme.css';

.react-aria-Select {
  color: var(--text-color);
  position: relative;
  width: 200px;

  .react-aria-Button {
    --button-color: var(--gray);
    padding: 0 var(--spacing-2) 0 var(--spacing-3);
    width: 100%;
    min-width: 0;

    &[data-pressed] {
      scale: 1;
    }
  }

  .react-aria-SelectValue {
    flex: 1;
    text-align: start;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;

    &[data-placeholder] {
      color: var(--text-color-placeholder);
      font-weight: normal;
    }
  }

  .lucide-chevron-down {
    margin-inline-start: var(--spacing-2);
  }

  .react-aria-SelectValue {
    [slot='description'] {
      display: none;
    }
  }
}

.select-popover[data-trigger='Select'] {
  width: var(--trigger-width);
  padding: 0;
}

```

## Tailwind example

```tsx
import {Select, SelectItem} from 'tailwind-starter/Select';

  Aardvark
  Cat
  Dog
  Kangaroo
  Panda
  Snake

```

### Select.tsx

```tsx
'use client';
import {ChevronDown} from 'lucide-react';
import React from 'react';
import {
  Select as AriaSelect,
  type SelectProps as AriaSelectProps,
  Button,
  ListBox,
  type ListBoxItemProps,
  SelectValue,
  type ValidationResult
} from 'react-aria-components/Select';
import {tv} from 'tailwind-variants';
import {Description, FieldError, Label} from './Field';
import {DropdownItem, DropdownSection, type DropdownSectionProps} from './ListBox';
import {Popover} from './Popover';
import {composeTailwindRenderProps, focusRing} from './utils';

const styles = tv({
  extend: focusRing,
  base: 'flex items-center text-start gap-4 w-full font-sans border border-black/10 dark:border-white/10 cursor-default rounded-lg pl-3 pr-2 h-9 min-w-[180px] transition bg-neutral-50 dark:bg-neutral-700 [-webkit-tap-highlight-color:transparent]',
  variants: {
    isDisabled: {
      false:
        'text-neutral-800 dark:text-neutral-300 hover:bg-neutral-100 pressed:bg-neutral-200 dark:hover:bg-neutral-600 dark:pressed:bg-neutral-500 group-invalid:outline group-invalid:outline-red-600 forced-colors:group-invalid:outline-[Mark]',
      true: 'border-transparent dark:border-transparent text-neutral-200 dark:text-neutral-600 forced-colors:text-[GrayText] bg-neutral-100 dark:bg-neutral-800'
    }
  }
});

export interface SelectProps<T, M extends 'single' | 'multiple'> extends Omit<
  AriaSelectProps<T, M>,
  'children'
> {
  label?: string;
  description?: string;
  errorMessage?: string | ((validation: ValidationResult) => string);
  items?: Iterable;
  children: React.ReactNode | ((item: T) => React.ReactNode);
}

export function Select<T, M extends 'single' | 'multiple' = 'single'>({
  label,
  description,
  errorMessage,
  children,
  items,
  ...props
}: SelectProps<T, M>) {
  return (
    <AriaSelect
      {...props}
      className={composeTailwindRenderProps(
        props.className,
        'group flex flex-col gap-1 relative font-sans'
      )}>
      {label && {label}}
      <Button className={styles}>
        <SelectValue className="flex-1 text-sm">
          {({selectedText, defaultChildren}) => selectedText || defaultChildren}
        
        <ChevronDown
          aria-hidden
          className="w-4 h-4 text-neutral-600 dark:text-neutral-400 forced-colors:text-[ButtonText] group-disabled:text-neutral-200 dark:group-disabled:text-neutral-600 forced-colors:group-disabled:text-[GrayText]"
        />
      
      {description && {description}}
      {errorMessage}
      <Popover className="min-w-(--trigger-width)">
        <ListBox
          items={items}
          className="outline-hidden box-border p-1 max-h-[inherit] overflow-auto [clip-path:inset(0_0_0_0_round_.75rem)]">
          {children}
        
      
    
  );
}

export function SelectItem(props: ListBoxItemProps) {
  return <DropdownItem {...props} />;
}

export function SelectSection(props: DropdownSectionProps) {
  return <DropdownSection {...props} />;
}

```

## Content

`Select` reuses the `ListBox` component, following the [Collection Components API](collections.md?component=Select). It supports ListBox features such as static and dynamic collections, sections, disabled items, links, text slots, asynchronous loading, etc. See the [ListBox docs](ListBox.md) for more details.

The following example shows a dynamic collection of items, grouped into sections.

```tsx
import {Select, SelectItem} from 'vanilla-starter/Select';
import {ListBoxSection, Header} from 'vanilla-starter/ListBox';
import {Collection} from 'react-aria-components/Collection';

function Example() {
  /*- begin collapse -*/
  let options = [
    {name: 'Fruit', children: [
      {name: 'Apple'},
      {name: 'Banana'},
      {name: 'Orange'},
      {name: 'Honeydew'},
      {name: 'Grapes'},
      {name: 'Watermelon'},
      {name: 'Cantaloupe'},
      {name: 'Pear'}
    ]},
    {name: 'Vegetable', children: [
      {name: 'Cabbage'},
      {name: 'Broccoli'},
      {name: 'Carrots'},
      {name: 'Lettuce'},
      {name: 'Spinach'},
      {name: 'Bok Choy'},
      {name: 'Cauliflower'},
      {name: 'Potatoes'}
    ]}
  ];
  /*- end collapse -*/

  return (
    <Select label="Preferred fruit or vegetable" items={options}>
      {section => (
        <ListBoxSection id={section.name}>
          {section.name}
          <Collection items={section.children}>
            {item => <SelectItem id={item.name}>{item.name}}
          
        
      )}
    
  );
}
```

### Autocomplete

`Select` can include additional components as siblings of the `ListBox`. This example uses an [Autocomplete](Autocomplete.md) with a [SearchField](SearchField.md) to let the user filter the items.

```tsx
import {Autocomplete, useFilter} from 'react-aria-components/Autocomplete';
import {Select, Label, SelectValue} from 'react-aria-components/Select';
import {Button} from 'vanilla-starter/Button';
import {SelectListBox, SelectItem} from 'vanilla-starter/Select';
import {Popover} from 'vanilla-starter/Popover';
import {SearchField} from 'vanilla-starter/SearchField';
import {ChevronDown} from 'lucide-react';

function Example() {
  let {contains} = useFilter({sensitivity: 'base'});

  return (
    
      Category
      
        
        <ChevronDown size={18} />
      
      <Popover hideArrow className="select-popover" style={{display: 'flex', flexDirection: 'column'}}>
        {/*- begin highlight -*/}
        <Autocomplete filter={contains}>
          <SearchField aria-label="Search tags" placeholder="Search tags" autoFocus style={{margin: 4}} />
          
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
          
        
      
    
  );
}
```

### TagGroup

Use the `SelectValue` render prop function to display the selected items as a [TagGroup](TagGroup.md).

## Content (part 2)

```tsx
import {Autocomplete, useFilter} from 'react-aria-components/Autocomplete';
import {Select, SelectValue} from 'react-aria-components/Select';
import {Group} from 'react-aria-components/Group';
import {Button} from 'vanilla-starter/Button';
import {SelectListBox, SelectItem} from 'vanilla-starter/Select';
import {Label} from 'vanilla-starter/Form';
import {Popover} from 'vanilla-starter/Popover';
import {Plus} from 'lucide-react';
import {SearchField} from 'vanilla-starter/SearchField';
import {Tag, TagGroup} from 'vanilla-starter/TagGroup';
import {useRef} from 'react';
import './MultiSelect.css';

/*- begin collapse -*/
const states = [
  {id: 'AL', name: 'Alabama'},
  {id: 'AK', name: 'Alaska'},
  {id: 'AZ', name: 'Arizona'},
  {id: 'AR', name: 'Arkansas'},
  {id: 'CA', name: 'California'},
  {id: 'CO', name: 'Colorado'},
  {id: 'CT', name: 'Connecticut'},
  {id: 'DE', name: 'Delaware'},
  {id: 'DC', name: 'District of Columbia'},
  {id: 'FL', name: 'Florida'},
  {id: 'GA', name: 'Georgia'},
  {id: 'HI', name: 'Hawaii'},
  {id: 'ID', name: 'Idaho'},
  {id: 'IL', name: 'Illinois'},
  {id: 'IN', name: 'Indiana'},
  {id: 'IA', name: 'Iowa'},
  {id: 'KS', name: 'Kansas'},
  {id: 'KY', name: 'Kentucky'},
  {id: 'LA', name: 'Louisiana'},
  {id: 'ME', name: 'Maine'},
  {id: 'MD', name: 'Maryland'},
  {id: 'MA', name: 'Massachusetts'},
  {id: 'MI', name: 'Michigan'},
  {id: 'MN', name: 'Minnesota'},
  {id: 'MS', name: 'Mississippi'},
  {id: 'MO', name: 'Missouri'},
  {id: 'MT', name: 'Montana'},
  {id: 'NE', name: 'Nebraska'},
  {id: 'NV', name: 'Nevada'},
  {id: 'NH', name: 'New Hampshire'},
  {id: 'NJ', name: 'New Jersey'},
  {id: 'NM', name: 'New Mexico'},
  {id: 'NY', name: 'New York'},
  {id: 'NC', name: 'North Carolina'},
  {id: 'ND', name: 'North Dakota'},
  {id: 'OH', name: 'Ohio'},
  {id: 'OK', name: 'Oklahoma'},
  {id: 'OR', name: 'Oregon'},
  {id: 'PA', name: 'Pennsylvania'},
  {id: 'RI', name: 'Rhode Island'},
  {id: 'SC', name: 'South Carolina'},
  {id: 'SD', name: 'South Dakota'},
  {id: 'TN', name: 'Tennessee'},
  {id: 'TX', name: 'Texas'},
  {id: 'UT', name: 'Utah'},
  {id: 'VT', name: 'Vermont'},
  {id: 'VA', name: 'Virginia'},
  {id: 'WA', name: 'Washington'},
  {id: 'WV', name: 'West Virginia'},
  {id: 'WI', name: 'Wisconsin'},
  {id: 'WY', name: 'Wyoming'}
];
/*- end collapse -*/

function SelectWithTagGroup() {
  let triggerRef = useRef<HTMLDivElement | null>(null);
  let {contains} = useFilter({sensitivity: 'base'});

## Content (part 3)

return (
    <Select selectionMode="multiple" className="multi-select">
      States
      <Group aria-label="States" ref={triggerRef}>
        {/*- begin highlight -*/}
        <SelectValue<typeof states[0]> style={{flex: 1}}>
          {({selectedItems, state}) => (
            <TagGroup
              aria-label="Selected states"
              items={selectedItems.filter(item => item != null)}
              renderEmptyState={() => 'No selected items'}
              onRemove={(keys) => {
                // Remove keys from Select state.
                if (Array.isArray(state.value)) {
                  state.setValue(state.value.filter(k => !keys.has(k)));
                }
              }}>
              {item => {item.name}}
            
          )}
        
        {/*- end highlight -*/}
        <Button variant="primary">
      
      <Popover
        // Position popover relative to the wrapping div instead of the Button
        triggerRef={triggerRef}
        hideArrow
        className="select-popover"
        style={{display: 'flex', flexDirection: 'column', width: 250, padding: 4}}>
        <Autocomplete filter={contains}>
          <SearchField aria-label="Search states" placeholder="Search states" autoFocus style={{marginBottom: 4}} />
          <SelectListBox items={states}>
            {state => {state.name}}
          
        
      
    
  );
}
```

## Value

Use the `defaultValue` or `value` prop to set the selected item. The value corresponds to the `id` prop of an item. When `selectionMode="multiple"`, `value` and `onChange` accept an array. Items can be disabled with the `isDisabled` prop.

```tsx
import {Select, SelectItem} from 'vanilla-starter/Select';
import {useState} from 'react';

function Example(props) {
  let [animal, setAnimal] = useState("bison");

  return (
    <>
      <Select
        {...props}
        label="Pick an animal"
        
        value={animal}
        onChange={setAnimal}
      >
        <SelectItem id="koala">Koala
        <SelectItem id="kangaroo">Kangaroo
        <SelectItem id="platypus" isDisabled>Platypus
        <SelectItem id="eagle">Bald Eagle
        <SelectItem id="bison">Bison
        <SelectItem id="skunk">Skunk
      
      <pre style={{fontSize: 12}}>Current selection: {JSON.stringify(animal)}</pre>
    </>
  );
}
```

## Forms

Use the `name` prop to submit the `id` of the selected item to the server. Set the `isRequired` prop to validate that the user selects an option, or implement custom client or server-side validation. See the [Forms](forms.md) guide to learn more.

```tsx
import {Select, SelectItem} from 'vanilla-starter/Select';
import {Button} from 'vanilla-starter/Button';
import {Form} from 'vanilla-starter/Form';

  <Select
    label="Animal"
    /*- begin highlight -*/
    name="animal"
    isRequired
    /*- end highlight -*/
    description="Please select an animal.">
    <SelectItem id="aardvark">Aardvark
    <SelectItem id="cat">Cat
    <SelectItem id="dog">Dog
    <SelectItem id="kangaroo">Kangaroo
    <SelectItem id="panda">Panda
    <SelectItem id="snake">Snake
  
  <Button type="submit">Submit

```

## API

```tsx

  
  
    
  
  <Text slot="description" />
  
  
    
  

```

### Select

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `allowsEmptyCollection` | `boolean | undefined` | — | Whether the select should be allowed to be open when the collection is empty. |
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `autoComplete` | `string | undefined` | — | Describes the type of autocomplete functionality the input should provide if any. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefautocomplete). |
| `autoFocus` | `boolean | undefined` | — | Whether the element should receive focus on render. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Select' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultOpen` | `boolean | undefined` | — | Sets the default open state of the menu. |
| `defaultValue` | `ValueType | undefined` | — | The default value (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `disabledKeys` | `Iterable | undefined` | — | The item keys that are disabled. These items cannot be selected, focused, or otherwise interacted with. |
| `excludeFromTabOrder` | `boolean | undefined` | — | Whether to exclude the element from the sequential tab order. If true, the element will not be focusable via the keyboard by tabbing. This should be avoided except in rare scenarios where an alternative means of accessing the element or its functionality via the keyboard is available. |
| `form` | `string | undefined` | — | The `<form>` element to associate the input with. The value of this attribute must be the id of a `<form>` in the same document. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input#form). |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `isDisabled` | `boolean | undefined` | — | Whether the input is disabled. |
| `isInvalid` | `boolean | undefined` | — | Whether the input value is invalid. |
| `isOpen` | `boolean | undefined` | — | Sets the open state of the menu. |
| `isRequired` | `boolean | undefined` | — | Whether user input is required on the input before form submission. |
| `lang` | `string | undefined` | — |  |
| `name` | `string | undefined` | — | The name of the input, used when submitting an HTML form. |
| `onAnimationEnd` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationEndCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIteration` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIterationCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStart` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStartCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAuxClick` | `React.MouseEventHandler | undefined` | — |  |
| `onAuxClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onBlur` | `((e: React.FocusEvent) => void) | undefined` | — | Handler that is called when the element loses focus. |
| `onChange` | `((value: ChangeValueType) => void) | undefined` | — | Handler that is called when the value changes. |
| `onClick` | `React.MouseEventHandler | undefined` | — |  |
| `onClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenu` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenuCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClick` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onFocus` | `((e: React.FocusEvent) => void) | undefined` | — | Handler that is called when the element receives focus. |
| `onFocusChange` | `((isFocused: boolean) => void) | undefined` | — | Handler that is called when the element's focus status changes. |
| `onGotPointerCapture` | `React.PointerEventHandler | undefined` | — |  |

## API (part 3)

| `onGotPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
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
| `onMouseOutCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseOver` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseOverCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseUp` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseUpCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onOpenChange` | `((isOpen: boolean) => void) | undefined` | — | Method that is called when the open state of the menu changes. |
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
| `onTransitionCancelCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEnd` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEndCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRun` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRunCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStart` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStartCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onWheel` | `React.WheelEventHandler | undefined` | — |  |
| `onWheelCapture` | `React.WheelEventHandler | undefined` | — |  |
| `placeholder` | `string | undefined` | 'Select an item' (localized) | Temporary text that occupies the select when it is empty. |
| `render` | `DOMRenderFunction<"div", SelectRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `selectionMode` | `M | undefined` | 'single' | Whether single or multiple selection is enabled. |

## API (part 4)

| `shouldCloseOnSelect` | `boolean | undefined` | — | Whether the Select should close when an item is selected. Defaults to true if selectionMode is single, false otherwise. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: SelectRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `validate` | `((value: M extends "single" ? Key : Key[]) => true | undefined) | ValidationError | null | undefined` | — | A function that returns an error message if a given value is invalid. Validation errors are displayed to the user when the form is submitted if `validationBehavior="native"`. For realtime validation, use the `isInvalid` prop instead. |
| `validationBehavior` | `"aria" | "native" | undefined` | 'native' | Whether to use native HTML form validation to prevent form submission when the value is missing or invalid, or mark the field as required or invalid via ARIA. |
| `value` | `ValueType | undefined` | — | The current value (controlled). |

## API (part 6)

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
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-SelectValue' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `color` | `string | undefined` | — |  |
| `content` | `string | undefined` | — |  |

## API (part 9)

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
| `render` | `DOMRenderFunction<"span", SelectValueRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |

## API (part 10)

| `resource` | `string | undefined` | — |  |
| `results` | `number | undefined` | — |  |
| `rev` | `string | undefined` | — |  |
| `role` | `React.AriaRole | undefined` | — |  |
| `security` | `string | undefined` | — |  |
| `slot` | `string | undefined` | — |  |
| `spellCheck` | `(boolean | "true" | "false") | undefined` | — |  |
| `style` | `(((values: SelectValueRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `suppressContentEditableWarning` | `boolean | undefined` | — |  |
| `suppressHydrationWarning` | `boolean | undefined` | — |  |
| `tabIndex` | `number | undefined` | — |  |
| `title` | `string | undefined` | — |  |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `typeof` | `string | undefined` | — |  |
| `unselectable` | `"off" | "on" | undefined` | — |  |
| `vocab` | `string | undefined` | — |  |

