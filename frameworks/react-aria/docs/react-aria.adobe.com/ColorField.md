# ColorField

## Introduction

A color field allows users to edit a hex color or individual color channel value.

## Vanilla CSS example

### ColorField.tsx

```tsx
'use client';
import {
  ColorField as AriaColorField,
  type ColorFieldProps as AriaColorFieldProps,
  Input,
  type ValidationResult
} from 'react-aria-components/ColorField';
import {Label, FieldError, Description} from './Form';
import './ColorField.css';

export interface ColorFieldProps extends AriaColorFieldProps {
  label?: string;
  description?: string;
  errorMessage?: string | ((validation: ValidationResult) => string);
  placeholder?: string;
}

export function ColorField({
  label,
  description,
  errorMessage,
  placeholder,
  ...props
}: ColorFieldProps) {
  return (
    <AriaColorField {...props}>
      {label && {label}}
      <Input className="react-aria-Input inset" placeholder={placeholder} />
      {description && {description}}
      {errorMessage}
    
  );
}

```

### ColorField.css

```css
@import './theme.css';
@import './TextField.css';

.react-aria-ColorField {
  display: flex;
  flex-direction: column;
}

```

## Tailwind example

### ColorField.tsx

```tsx
'use client';
import React from 'react';
import {
  ColorField as AriaColorField,
  type ColorFieldProps as AriaColorFieldProps,
  type ValidationResult
} from 'react-aria-components/ColorField';
import {tv} from 'tailwind-variants';
import {Description, FieldError, Input, Label, fieldBorderStyles} from './Field';
import {composeTailwindRenderProps, focusRing} from './utils';

const inputStyles = tv({
  extend: focusRing,
  base: 'border-1 rounded-lg min-h-9 font-sans text-sm py-0 px-3 box-border transition [-webkit-tap-highlight-color:transparent]',
  variants: {
    isFocused: fieldBorderStyles.variants.isFocusWithin,
    isInvalid: fieldBorderStyles.variants.isInvalid,
    isDisabled: fieldBorderStyles.variants.isDisabled
  }
});

export interface ColorFieldProps extends AriaColorFieldProps {
  label?: string;
  description?: string;
  errorMessage?: string | ((validation: ValidationResult) => string);
}

export function ColorField({label, description, errorMessage, ...props}: ColorFieldProps) {
  return (
    <AriaColorField
      {...props}
      className={composeTailwindRenderProps(props.className, 'flex flex-col gap-1 font-sans')}>
      {label && {label}}
      <Input className={inputStyles} />
      {description && {description}}
      {errorMessage}
    
  );
}

```

## Value

Use the `value` or `defaultValue` prop to set the color value, and `onChange` to handle user input. The value may be a string or `Color` object, parsed using the `parseColor` function. `onChange` is always called with a `Color` object.

```tsx
import {ColorField} from 'vanilla-starter/ColorField';
import {parseColor, type Color} from 'react-aria-components/ColorField';
import {useState} from 'react';

function Example() {
  let [value, setValue] = useState<Color | null>(parseColor('#e73623'));

  return (
    <div>
      <ColorField
        label="Primary color"
        placeholder="Enter a color"
        value={value}
        onChange={setValue} />
      <pre style={{fontSize: 12}}>Current value: {value?.toString('hex')}</pre>
    </div>
  );
}
```

## Channel

By default, ColorField displays a hex value. Set the `colorSpace` and `channel` props to display a specific color channel.

```tsx
import {ColorField} from 'vanilla-starter/ColorField';
import {parseColor, type Color} from 'react-aria-components/ColorField';
import {useState} from 'react';

function Example() {
  let [color, setColor] = useState<Color | null>(parseColor('#7f007f'));

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
      <ColorField
        label="Hue"

        value={color}
        onChange={setColor}
        /*- begin highlight -*/
        colorSpace="hsl"
        channel="hue" />
        {/*- end highlight -*/}
      <ColorField
        label="Saturation"
        value={color}
        onChange={setColor}
        colorSpace="hsl"
        channel="saturation" />
      <ColorField
        label="Lightness"
        value={color}
        onChange={setColor}
        colorSpace="hsl"
        channel="lightness" />
      <pre style={{fontSize: 12}}>Current value: {color?.toString('hex')}</pre>
    </div>
  );
}
```

## Forms

Use the `name` prop to submit the text value to the server. Set the `isRequired` prop to validate the value, or implement custom client or server-side validation. See the [Forms](forms.md) guide to learn more.

```tsx
import {ColorField} from 'vanilla-starter/ColorField';
import {Button} from 'vanilla-starter/Button';
import {Form} from 'vanilla-starter/Form';

function Example(props) {
  return (
    
      <ColorField
        {...props}
        label="Brand color"
        placeholder="Enter a color"
        name="brandColor"
        isRequired />
        {/*- end highlight -*/}
      <Button type="submit" style={{marginTop: 8}}>Submit
    
  );
}
```

## API

```tsx

  
  
  <Text slot="description" />
  

```

### ColorField

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-errormessage` | `string | undefined` | — | Identifies the element that provides an error message for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `autoFocus` | `boolean | undefined` | — | Whether the element should receive focus on render. |
| `channel` | `ColorChannel | undefined` | — | The color channel that this field edits. If not provided, the color is edited as a hex value. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-ColorField' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `colorSpace` | `ColorSpace | undefined` | — | The color space that the color field operates in if a `channel` prop is provided. If no `channel` is provided, the color field always displays the color as an RGB hex value. |
| `defaultValue` | `string | Color | null | undefined` | — | The default value (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `excludeFromTabOrder` | `boolean | undefined` | — | Whether to exclude the element from the sequential tab order. If true, the element will not be focusable via the keyboard by tabbing. This should be avoided except in rare scenarios where an alternative means of accessing the element or its functionality via the keyboard is available. |
| `form` | `string | undefined` | — | The `<form>` element to associate the input with. The value of this attribute must be the id of a `<form>` in the same document. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input#form). |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `isDisabled` | `boolean | undefined` | — | Whether the input is disabled. |
| `isInvalid` | `boolean | undefined` | — | Whether the input value is invalid. |
| `isReadOnly` | `boolean | undefined` | — | Whether the input can be selected but not changed by the user. |
| `isRequired` | `boolean | undefined` | — | Whether user input is required on the input before form submission. |
| `isWheelDisabled` | `boolean | undefined` | — | Enables or disables changing the value with scroll. |
| `lang` | `string | undefined` | — |  |
| `name` | `string | undefined` | — | The name of the input element, used when submitting an HTML form. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefname). |
| `onAnimationEnd` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationEndCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIteration` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIterationCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStart` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStartCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAuxClick` | `React.MouseEventHandler | undefined` | — |  |
| `onAuxClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onBeforeInput` | `React.FormEventHandler | undefined` | — | Handler that is called when the input value is about to be modified. See [MDN](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/beforeinput_event). |
| `onBlur` | `((e: React.FocusEvent) => void) | undefined` | — | Handler that is called when the element loses focus. |
| `onChange` | `((color: Color | null) => void) | undefined` | — | Handler that is called when the value changes. |
| `onClick` | `React.MouseEventHandler | undefined` | — |  |
| `onClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onCompositionEnd` | `React.CompositionEventHandler | undefined` | — | Handler that is called when a text composition system completes or cancels the current text composition session. See [MDN](https://developer.mozilla.org/en-US/docs/Web/API/Element/compositionend_event). |

## API (part 3)

| `onCompositionStart` | `React.CompositionEventHandler | undefined` | — | Handler that is called when a text composition system starts a new text composition session. See [MDN](https://developer.mozilla.org/en-US/docs/Web/API/Element/compositionstart_event). |
| `onCompositionUpdate` | `React.CompositionEventHandler | undefined` | — | Handler that is called when a new character is received in the current text composition session. See [MDN](https://developer.mozilla.org/en-US/docs/Web/API/Element/compositionupdate_event). |
| `onContextMenu` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenuCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onCopy` | `React.ClipboardEventHandler | undefined` | — | Handler that is called when the user copies text. See [MDN](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/oncopy). |
| `onCut` | `React.ClipboardEventHandler | undefined` | — | Handler that is called when the user cuts text. See [MDN](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/oncut). |
| `onDoubleClick` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onFocus` | `((e: React.FocusEvent) => void) | undefined` | — | Handler that is called when the element receives focus. |
| `onFocusChange` | `((isFocused: boolean) => void) | undefined` | — | Handler that is called when the element's focus status changes. |
| `onGotPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onGotPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onInput` | `React.FormEventHandler | undefined` | — | Handler that is called when the input value is modified. See [MDN](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/input_event). |
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
| `onPaste` | `React.ClipboardEventHandler | undefined` | — | Handler that is called when the user pastes text. See [MDN](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/onpaste). |
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
| `onSelect` | `React.ReactEventHandler | undefined` | — | Handler that is called when text in the input is selected. See [MDN](https://developer.mozilla.org/en-US/docs/Web/API/Element/select_event). |
| `onTouchCancel` | `React.TouchEventHandler | undefined` | — |  |
| `onTouchCancelCapture` | `React.TouchEventHandler | undefined` | — |  |

## API (part 4)

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
| `render` | `DOMRenderFunction<"div", ColorFieldRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `style` | `(((values: ColorFieldRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `validate` | `((value: Color | null) => true | undefined) | ValidationError | null | undefined` | — | A function that returns an error message if a given value is invalid. Validation errors are displayed to the user when the form is submitted if `validationBehavior="native"`. For realtime validation, use the `isInvalid` prop instead. |
| `validationBehavior` | `"aria" | "native" | undefined` | 'native' | Whether to use native HTML form validation to prevent form submission when the value is missing or invalid, or mark the field as required or invalid via ARIA. |
| `value` | `string | Color | null | undefined` | — | The current value (controlled). |

