# ComboBox

## Introduction

A combo box combines a text input with a listbox, allowing users to filter a list of options to
items matching a query.

## Vanilla CSS example

```tsx
import {ComboBox, ComboBoxItem} from 'vanilla-starter/ComboBox';

  Aardvark
  Cat
  Dog
  Kangaroo
  Panda
  Snake

```

### ComboBox.tsx

```tsx
'use client';
import {
  ComboBox as AriaComboBox,
  type ComboBoxProps as AriaComboBoxProps,
  ComboBoxValue,
  Input,
  type ListBoxItemProps,
  type ListBoxProps,
  type ValidationResult
} from 'react-aria-components/ComboBox';
import {Label, FieldError, FieldButton, Description} from './Form';
import {DropdownItem, DropdownListBox} from './ListBox';
import {Popover} from './Popover';
import {ChevronDown} from 'lucide-react';
import './ComboBox.css';

export interface ComboBoxProps<T, M extends 'single' | 'multiple'> extends Omit<
  AriaComboBoxProps<T, M>,
  'children'
> {
  label?: string;
  description?: string | null;
  errorMessage?: string | ((validation: ValidationResult) => string);
  children: React.ReactNode | ((item: T) => React.ReactNode);
  placeholder?: string;
}

export function ComboBox<T, M extends 'single' | 'multiple' = 'single'>({
  label,
  description,
  errorMessage,
  children,
  placeholder,
  ...props
}: ComboBoxProps<T, M>) {
  return (
    <AriaComboBox {...props}>
      {label}
      <div className="combobox-field">
        <Input className="react-aria-Input inset" placeholder={placeholder} />
        
          
        
      </div>
      {props.selectionMode === 'multiple' && <ComboBoxValue placeholder="No items selected" />}
      {description && {description}}
      {errorMessage}
      <Popover hideArrow className="combobox-popover">
        {children}
      
    
  );
}

export function ComboBoxListBox(props: ListBoxProps) {
  return <DropdownListBox {...props} />;
}

export function ComboBoxItem(props: ListBoxItemProps) {
  return <DropdownItem {...props} />;
}

```

### ComboBox.css

```css
@import './theme.css';
@import './TextField.css';

.react-aria-ComboBox {
  color: var(--text-color);
  width: calc(var(--spacing) * 50);

  .combobox-field {
    display: flex;
    align-items: center;
    height: var(--spacing-8);
    width: 100%;
  }

  .react-aria-Input {
    width: 100%;
    padding: 0 calc(var(--spacing-3) + var(--spacing-6)) 0 var(--spacing-3);
  }

  .react-aria-ComboBoxValue {
    margin-top: var(--spacing-1);
    font: var(--font-size-sm) system-ui;
    color: var(--text-color);
  }
}

.combobox-popover[data-trigger='ComboBox'] {
  width: var(--trigger-width);
  padding: 0;
}

```

## Tailwind example

```tsx
import {ComboBox, ComboBoxItem} from 'tailwind-starter/ComboBox';

  Aardvark
  Cat
  Dog
  Kangaroo
  Panda
  Snake

```

### ComboBox.tsx

```tsx
'use client';
import {ChevronDown} from 'lucide-react';
import React from 'react';
import {
  ComboBox as AriaComboBox,
  type ComboBoxProps as AriaComboBoxProps,
  ComboBoxValue,
  ListBox,
  type ListBoxItemProps,
  type ValidationResult
} from 'react-aria-components/ComboBox';
import {Description, FieldError, FieldGroup, Input, Label} from './Field';
import {DropdownItem, DropdownSection, type DropdownSectionProps} from './ListBox';
import {Popover} from './Popover';
import {composeTailwindRenderProps} from './utils';
import {FieldButton} from './FieldButton';

export interface ComboBoxProps<T, M extends 'single' | 'multiple'> extends Omit<
  AriaComboBoxProps<T, M>,
  'children'
> {
  label?: string;
  description?: string | null;
  errorMessage?: string | ((validation: ValidationResult) => string);
  placeholder?: string;
  children: React.ReactNode | ((item: T) => React.ReactNode);
}

export function ComboBox<T, M extends 'single' | 'multiple' = 'single'>({
  label,
  description,
  errorMessage,
  children,
  items,
  ...props
}: ComboBoxProps<T, M>) {
  return (
    <AriaComboBox
      {...props}
      className={composeTailwindRenderProps(
        props.className,
        'group flex flex-col gap-1 font-sans'
      )}>
      {label}
      
        <Input className="ps-3 pe-1" />
        <FieldButton className="w-6 mr-1 outline-offset-0">
          <ChevronDown aria-hidden className="w-4 h-4" />
        
      
      {props.selectionMode === 'multiple' && (
        <ComboBoxValue
          placeholder="No items selected"
          className="text-xs text-neutral-600 dark:text-neutral-300"
        />
      )}
      {description && {description}}
      {errorMessage}
      <Popover className="w-(--trigger-width)">
        <ListBox
          items={items}
          className="outline-0 p-1 box-border max-h-[inherit] overflow-auto [clip-path:inset(0_0_0_0_round_.75rem)]">
          {children}
        
      
    
  );
}

export function ComboBoxItem(props: ListBoxItemProps) {
  return <DropdownItem {...props} />;
}

export function ComboBoxSection(props: DropdownSectionProps) {
  return <DropdownSection {...props} />;
}

```

## Content

`ComboBox` reuses the `ListBox` component, following the [Collection Components API](collections.md?component=ComboBox). It supports ListBox features such as static and dynamic collections, sections, disabled items, links, text slots, asynchronous loading, etc. See the [ListBox docs](ListBox.md) for more details.

The following example shows a dynamic collection of items, grouped into sections.

```tsx
import {ComboBox, ComboBoxItem} from 'vanilla-starter/ComboBox';
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
    /*- begin highlight -*/
    <ComboBox
      label="Preferred fruit or vegetable"
      placeholder="Select an option"
      defaultItems={options}>
      {section => (
        <ListBoxSection id={section.name}>
          {section.name}
          <Collection items={section.children}>
            {item => <ComboBoxItem id={item.name}>{item.name}}
          
        
      )}
    
    /*- end highlight -*/
  );
}
```

### TagGroup

Use the `ComboBoxValue` render prop function to display the selected items as a [TagGroup](TagGroup.md).

```tsx
import {ComboBox, ComboBoxValue, Input} from 'react-aria-components/ComboBox';
import {ComboBoxListBox, ComboBoxItem} from 'vanilla-starter/ComboBox';
import {Label, FieldButton} from 'vanilla-starter/Form';
import {Popover} from 'vanilla-starter/Popover';
import {Tag, TagGroup} from 'vanilla-starter/TagGroup';
import {ChevronDown} from 'lucide-react';

## Content (part 2)

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

<ComboBox selectionMode="multiple">
  States
  <div className="combobox-field">
    <Input className="react-aria-Input inset" placeholder="Select a state" />
    
  </div>
  {/*- begin highlight -*/}
  <ComboBoxValue<typeof states[0]>>
    {({selectedItems, state}) => (
      <TagGroup
        aria-label="Selected states"
        style={{marginTop: 8}}
        items={selectedItems.filter(item => item != null)}
        renderEmptyState={() => 'No selected items'}
        onRemove={(keys) => {
          // Remove keys from ComboBox state.
          if (Array.isArray(state.value)) {
            state.setValue(state.value.filter(k => !keys.has(k)));
          }
        }}>
        {item => {item.name}}
      
    )}
  
  {/*- end highlight -*/}
  <Popover hideArrow className="combobox-popover">
    <ComboBoxListBox items={states}>
      {state => {state.name}}
    
  

```

## Value

Use the `defaultValue` or `value` prop to set the selected item. The value corresponds to the `id` prop of an item. Items can be disabled with the `isDisabled` prop.

```tsx
import {ComboBox, ComboBoxItem} from 'vanilla-starter/ComboBox';
import {useState} from 'react';
import type {Key} from 'react-aria-components/ComboBox';

function Example() {
  let [animal, setAnimal] = useState<Key | null>("bison");

  return (
    <div>
      <ComboBox
        label="Favorite Animal"
        placeholder="Select an animal"
        /*- begin highlight -*/
        value={animal}
        onChange={setAnimal}>
        {/*- end highlight -*/}
        <ComboBoxItem id="koala">Koala
        <ComboBoxItem id="kangaroo">Kangaroo
        <ComboBoxItem id="platypus" isDisabled>Platypus
        <ComboBoxItem id="eagle">Bald Eagle
        <ComboBoxItem id="bison">Bison
        <ComboBoxItem id="skunk">Skunk
      
      <p>Current selection: {animal}</p>
    </div>
  );
}
```

### Input value

Use the `inputValue` or `defaultInputValue` prop to set the value of the input field. By default, the value will be reverted to the selected item on blur. Set the `allowsCustomValue` prop to enable entering values that are not in the list.

```tsx
import {ComboBox, ComboBoxItem} from 'vanilla-starter/ComboBox';
import {useState} from 'react';

function Example(props) {
  let [value, setValue] = useState('Kangaroo');

  return (
    <div>
      <ComboBox
        {...props}
        label="Favorite Animal"
        placeholder="Select an animal"
        /*- begin highlight -*/
        
        inputValue={value}
        onInputChange={setValue}>
        {/*- end highlight -*/}
        <ComboBoxItem id="koala">Koala
        <ComboBoxItem id="kangaroo">Kangaroo
        <ComboBoxItem id="platypus">Platypus
        <ComboBoxItem id="eagle">Bald Eagle
        <ComboBoxItem id="bison">Bison
        <ComboBoxItem id="skunk">Skunk
      
      <p>Current input value: {value}</p>
    </div>
  );
}
```

### Fully controlled

Both `inputValue` and `value` can be controlled simultaneously. However, each interaction will only trigger either `onInputChange` or `onChange`, not both. When controlling both props, you must update both values accordingly.

```tsx
import type {Key} from 'react-aria-components/ComboBox';
import {ComboBox, ComboBoxItem} from 'vanilla-starter/ComboBox';
import {useState} from 'react';

function ControlledComboBox() {
  /*- begin collapse -*/
  let options = [
    {id: 1, name: 'Aerospace'},
    {id: 2, name: 'Mechanical'},
    {id: 3, name: 'Civil'},
    {id: 4, name: 'Biomedical'},
    {id: 5, name: 'Nuclear'},
    {id: 6, name: 'Industrial'},
    {id: 7, name: 'Chemical'},
    {id: 8, name: 'Agricultural'},
    {id: 9, name: 'Electrical'}
  ];
  /*- end collapse -*/

  let [fieldState, setFieldState] = useState<{value: Key | null, inputValue: string}>({
    value: null,
    inputValue: ''
  });

  let onChange = (id: Key | null) => {
    // Update inputValue when value changes.
    setFieldState({
      inputValue: id == null ? '' : options.find(o => o.id === id)?.name ?? '',
      value: id
    });
  };

## Value (part 2)

let onInputChange = (value: string) => {
    // Reset value to null if the input is cleared.
    setFieldState(prevState => ({
      inputValue: value,
      value: value === '' ? null : prevState.value
    }));
  };

  return (
    <div>
      <ComboBox
        label="Engineering major"
        placeholder="Select a major"
        /*- begin highlight -*/
        defaultItems={options}
        value={fieldState.value}
        inputValue={fieldState.inputValue}
        onChange={onChange}
        onInputChange={onInputChange}>
        {/*- end highlight -*/}
        {item => {item.name}}
      
      <pre style={{fontSize: 12}}>
        Current selected major id: {fieldState.value}{'\n'}
        Current input text: {fieldState.inputValue}
      </pre>
    </div>
  );
}
```

## Item actions

Use the `onAction` prop on a `` to perform a custom action when the item is pressed. This example adds a "Create" action for the current input value.

```tsx
import {ComboBox, ComboBoxItem} from 'vanilla-starter/ComboBox';
import {useState} from 'react';

function Example() {
  let [inputValue, setInputValue] = useState('');

  return (
    <ComboBox
      label="Favorite Animal"
      placeholder="Select an animal"
      allowsEmptyCollection
      inputValue={inputValue}
      onInputChange={setInputValue}>
      {/*- begin highlight -*/}
      {inputValue.length > 0 && (
        <ComboBoxItem onAction={() => alert('Creating ' + inputValue)}>
          {`Create "${inputValue}"`}
        
      )}
      {/*- end highlight -*/}
      Aardvark
      Cat
      Dog
      Kangaroo
      Panda
      Snake
    
  );
}
```

## Forms

Use the `name` prop to submit the `id` of the selected item to the server. Set the `isRequired` prop to validate that the user selects a value, or implement custom client or server-side validation. See the [Forms](forms.md) guide to learn more.

```tsx
import {ComboBox, ComboBoxItem} from 'vanilla-starter/ComboBox';
import {Button} from 'vanilla-starter/Button';
import {Form} from 'vanilla-starter/Form';;

  <ComboBox
    label="Animal"
    placeholder="e.g. Cat"
    /*- begin highlight -*/
    name="animal"
    isRequired
    /*- end highlight -*/
    description="Please select an animal.">
    <ComboBoxItem id="aardvark">Aardvark
    <ComboBoxItem id="cat">Cat
    <ComboBoxItem id="dog">Dog
    <ComboBoxItem id="kangaroo">Kangaroo
    <ComboBoxItem id="panda">Panda
    <ComboBoxItem id="snake">Snake
  
  <Button type="submit">Submit

```

## Popover

Use the `menuTrigger` prop to control when the popover opens:

- `input` (default): popover opens when the user edits the input text.
- `focus`: popover opens when the user focuses the input.
- `manual`: popover only opens when the user presses the trigger button or uses the arrow keys.

Use `allowsEmptyCollection` to keep the popover open when there are no items available in the list.

```tsx
import {ComboBox, ComboBoxItem} from 'vanilla-starter/ComboBox';

  <ComboBoxItem id="red panda">Red Panda
  <ComboBoxItem id="cat">Cat
  <ComboBoxItem id="dog">Dog
  <ComboBoxItem id="aardvark">Aardvark
  <ComboBoxItem id="kangaroo">Kangaroo
  <ComboBoxItem id="snake">Snake

```

## API

```tsx

  
  
    
    
  
  
  <Text slot="description" />
  
  
    
  

```

### ComboBox

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `allowsCustomValue` | `boolean | undefined` | — | Whether the ComboBox allows a non-item matching input value to be set. |
| `allowsEmptyCollection` | `boolean | undefined` | — | Whether the combo box allows the menu to be open when the collection is empty. |
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `autoFocus` | `boolean | undefined` | — | Whether the element should receive focus on render. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-ComboBox' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `defaultFilter` | `((textValue: string, inputValue: string) => boolean) | undefined` | — | The filter function used to determine if a option should be included in the combo box list. |
| `defaultInputValue` | `string | undefined` | — | The default value of the ComboBox input (uncontrolled). |
| `defaultItems` | `Iterable | undefined` | — | The list of ComboBox items (uncontrolled). |
| `defaultValue` | `ValueType | undefined` | — | The default value (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `disabledKeys` | `Iterable | undefined` | — | The item keys that are disabled. These items cannot be selected, focused, or otherwise interacted with. |
| `form` | `string | undefined` | — | The `<form>` element to associate the input with. The value of this attribute must be the id of a `<form>` in the same document. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input#form). |
| `formValue` | `"key" | "text" | undefined` | 'key' | Whether the text or key of the selected item is submitted as part of an HTML form. When `allowsCustomValue` is `true`, this option does not apply and the text is always submitted. |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `inputValue` | `string | undefined` | — | The value of the ComboBox input (controlled). |
| `isDisabled` | `boolean | undefined` | — | Whether the input is disabled. |
| `isInvalid` | `boolean | undefined` | — | Whether the input value is invalid. |
| `isReadOnly` | `boolean | undefined` | — | Whether the input can be selected but not changed by the user. |
| `isRequired` | `boolean | undefined` | — | Whether user input is required on the input before form submission. |
| `items` | `Iterable | undefined` | — | The list of ComboBox items (controlled). |
| `lang` | `string | undefined` | — |  |
| `menuTrigger` | `MenuTriggerAction | undefined` | 'input' | The interaction required to display the ComboBox menu. |
| `name` | `string | undefined` | — | The name of the input element, used when submitting an HTML form. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefname). |
| `onAnimationEnd` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationEndCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIteration` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIterationCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStart` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStartCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAuxClick` | `React.MouseEventHandler | undefined` | — |  |
| `onAuxClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onBlur` | `((e: React.FocusEvent<HTMLInputElement, Element>) => void) | undefined` | — | Handler that is called when the element loses focus. |
| `onChange` | `((value: ChangeValueType) => void) | undefined` | — | Handler that is called when the value changes. |
| `onClick` | `React.MouseEventHandler | undefined` | — |  |
| `onClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenu` | `React.MouseEventHandler | undefined` | — |  |

## API (part 3)

| `onContextMenuCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClick` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onFocus` | `((e: React.FocusEvent<HTMLInputElement, Element>) => void) | undefined` | — | Handler that is called when the element receives focus. |
| `onFocusChange` | `((isFocused: boolean) => void) | undefined` | — | Handler that is called when the element's focus status changes. |
| `onGotPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onGotPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onInputChange` | `((value: string) => void) | undefined` | — | Handler that is called when the ComboBox input value changes. |
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
| `onOpenChange` | `((isOpen: boolean, menuTrigger?: MenuTriggerAction) => void) | undefined` | — | Method that is called when the open state of the menu changes. Returns the new open state and the action that caused the opening of the menu. |
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

## API (part 4)

| `render` | `DOMRenderFunction<"div", ComboBoxRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `selectionMode` | `M | undefined` | 'single' | Whether single or multiple selection is enabled. |
| `shouldFocusWrap` | `boolean | undefined` | — | Whether keyboard navigation is circular. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: ComboBoxRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `validate` | `((value: ComboBoxValidationValue) => true | undefined) | ValidationError | null | undefined` | — | A function that returns an error message if a given value is invalid. Validation errors are displayed to the user when the form is submitted if `validationBehavior="native"`. For realtime validation, use the `isInvalid` prop instead. |
| `validationBehavior` | `"aria" | "native" | undefined` | 'native' | Whether to use native HTML form validation to prevent form submission when the value is missing or invalid, or mark the field as required or invalid via ARIA. |
| `value` | `ValueType | undefined` | — | The current value (controlled). |

## API (part 5)

### ComboBoxValue

## API (part 7)

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
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-ComboBoxValue' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `color` | `string | undefined` | — |  |
| `content` | `string | undefined` | — |  |

## API (part 8)

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
| `onDragExit` | `React.DragEventHandler | undefined` | — |  |
| `onDragExitCapture` | `React.DragEventHandler | undefined` | — |  |

## API (part 9)

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
| `onPointerMove` | `React.PointerEventHandler | undefined` | — |  |
| `onPointerMoveCapture` | `React.PointerEventHandler | undefined` | — |  |

## API (part 10)

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
| `placeholder` | `React.ReactNode` | — | A value to display when no items are selected. |
| `popover` | `"" | "auto" | "manual" | undefined` | — |  |
| `popoverTarget` | `string | undefined` | — |  |
| `popoverTargetAction` | `"hide" | "show" | "toggle" | undefined` | — |  |
| `prefix` | `string | undefined` | — |  |
| `property` | `string | undefined` | — |  |
| `radioGroup` | `string | undefined` | — |  |
| `rel` | `string | undefined` | — |  |

## API (part 11)

| `render` | `DOMRenderFunction<"div", ComboBoxValueRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `resource` | `string | undefined` | — |  |
| `results` | `number | undefined` | — |  |
| `rev` | `string | undefined` | — |  |
| `role` | `React.AriaRole | undefined` | — |  |
| `security` | `string | undefined` | — |  |
| `slot` | `string | undefined` | — |  |
| `spellCheck` | `(boolean | "true" | "false") | undefined` | — |  |
| `style` | `(((values: ComboBoxValueRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `suppressContentEditableWarning` | `boolean | undefined` | — |  |
| `suppressHydrationWarning` | `boolean | undefined` | — |  |
| `tabIndex` | `number | undefined` | — |  |
| `title` | `string | undefined` | — |  |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `typeof` | `string | undefined` | — |  |
| `unselectable` | `"off" | "on" | undefined` | — |  |
| `vocab` | `string | undefined` | — |  |

