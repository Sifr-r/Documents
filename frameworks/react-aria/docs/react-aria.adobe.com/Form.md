# Form

## Introduction

A form is a group of inputs that allows users to submit data to a server,
with support for providing field validation errors.

## Vanilla CSS example

```tsx
import {Form} from 'vanilla-starter/Form';
import {TextField} from 'vanilla-starter/TextField';
import {Button} from 'vanilla-starter/Button';

  <TextField label="Name" name="name" isRequired placeholder="Enter your full name" />
  <TextField label="Email" name="email" type="email" isRequired placeholder="Enter your email" />
  <div style={{display: 'flex', gap: 8}}>
    <Button type="submit">Submit
    <Button type="reset" variant="secondary">Reset
  </div>

```

### Form.tsx

```tsx
'use client';
import {Form as RACForm, type FormProps} from 'react-aria-components/Form';
import {type LabelProps, Label as RACLabel} from 'react-aria-components/Label';
import {type FieldErrorProps, FieldError as RACFieldError} from 'react-aria-components/FieldError';
import {type ButtonProps, Button} from 'react-aria-components/Button';
import {type TextProps} from 'react-aria-components/Text';
import './Form.css';
import {Text} from './Content';

export function Form(props: FormProps) {
  return <RACForm {...props} />;
}

export function Label(props: LabelProps) {
  return <RACLabel {...props} />;
}

export function FieldError(props: FieldErrorProps) {
  return <RACFieldError {...props} />;
}

export function Description(props: TextProps) {
  return <Text slot="description" className="field-description" {...props} />;
}

export function FieldButton(props: ButtonProps) {
  return <Button {...props} className="field-Button" />;
}

```

### Form.css

```css
@import './theme.css';

.react-aria-Form {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-6);

  > .react-aria-Button {
    align-self: start;
  }
}

.react-aria-Form [role='alert'] {
  border: 2px solid var(--invalid-color);
  background: var(--overlay-background);
  border-radius: 6px;
  padding: 12px;
  max-width: 250px;
  outline: none;

  &:focus {
    outline: 2px solid var(--focus-ring-color);
    outline-offset: 2px;
  }

  h3 {
    margin-top: 0;
  }

  p {
    margin-bottom: 0;
  }
}

.react-aria-Label {
  display: block;
  font: var(--font-size) system-ui;
  color: var(--text-color);
  margin-bottom: var(--spacing-2);
  font-weight: 500;
}

.react-aria-FieldError {
  display: block;
  font: var(--font-size-sm) system-ui;
  color: var(--invalid-color);
  margin-top: var(--spacing-1);
  contain: inline-size;
}

.field-description {
  display: block;
  font: var(--font-size-sm) system-ui;
  margin-top: var(--spacing-1);
  contain: inline-size;

  [data-invalid] > & {
    display: none;
  }
}

.field-Button {
  background: var(--tint-200);
  color: var(--tint-1400);
  forced-color-adjust: none;
  border-radius: var(--radius-sm);
  border: none;
  margin-left: calc(-1 * var(--spacing-8) + 4px);
  height: calc(100% - 8px);
  aspect-ratio: 1/1;
  padding: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  transition-property: scale, background;
  transition-duration: 200ms;
  -webkit-tap-highlight-color: transparent;

  svg {
    width: var(--spacing-4);
    height: var(--spacing-4);
  }

  &:where([data-hovered], [data-pressed]) {
    background: var(--tint-300);
    color: var(--tint-1200);
  }

## Vanilla CSS example (part 2)

@media (forced-colors: active) {
    background: Highlight;
    color: HighlightText;
  }

  &[data-pressed] {
    scale: 0.9;
  }

  &[data-focus-visible] {
    outline: 2px solid var(--focus-ring-color);
    outline-offset: 2px;
  }

  &[data-disabled] {
    background: none;
    color: var(--text-color-disabled);
  }
}

```

## Tailwind example

```tsx
import {Form} from 'tailwind-starter/Form';
import {TextField} from 'tailwind-starter/TextField';
import {Button} from 'tailwind-starter/Button';

  <TextField label="Name" name="name" isRequired placeholder="Enter your full name" />
  <TextField label="Email" name="email" type="email" isRequired placeholder="Enter your email" />
  <div style={{display: 'flex', gap: 8}}>
    <Button type="submit">Submit
    <Button type="reset" variant="secondary">Reset
  </div>

```

### Form.tsx

```tsx
'use client';
import React from 'react';
import {type FormProps, Form as RACForm} from 'react-aria-components/Form';
import {twMerge} from 'tailwind-merge';

export function Form(props: FormProps) {
  return <RACForm {...props} className={twMerge('flex flex-col gap-6', props.className)} />;
}

```

## Submitting data

When using React 19, use the `action` prop to handle form submission. This receives a [FormData](https://developer.mozilla.org/en-US/docs/Web/API/FormData) object containing the values for each form field. In React 18 or earlier, use the `onSubmit` event instead. See the [Forms](forms.md) guide details about integrating with frameworks.

## React 18 example

```tsx
import {Form} from 'vanilla-starter/Form';
import {TextField} from 'vanilla-starter/TextField';
import {Button} from 'vanilla-starter/Button';

<Form
  /*- begin highlight -*/
  onSubmit={event => {
    // Prevent default browser page refresh.
    event.preventDefault();

    // Get data from form.
    let form = event.target as HTMLFormElement;
    let formData = new FormData(form);
    let name = formData.get('name');
    alert(`Hello, ${name}!`);

    // Reset form after submission.
    form.reset();
  }}>
  {/*- end highlight -*/}
  <TextField name="name" label="Name" placeholder="Enter your full name" />
  <Button type="submit">Submit

```

## Validation

Use validation props on each form field to prevent submission of invalid values. When `validationBehavior="aria"`, form submission will not be prevented and validation will occur as the value is edited instead of on form submission. See the [Forms](forms.md) guide for more details.

```tsx
import {Form} from 'vanilla-starter/Form';
import {TextField} from 'vanilla-starter/TextField';
import {Button} from 'vanilla-starter/Button';

  <TextField
    label="Username"
    placeholder="Choose a username"
    isRequired
    validate={value => value === 'admin' ? 'Nice try.' : null}
    name="username"
    defaultValue="admin" />
  <Button type="submit">Submit

```

### Server validation

Use the `validationErrors` prop to provide server validation errors to the fields within a ``.

```tsx
import {Form} from 'vanilla-starter/Form';
import {TextField} from 'vanilla-starter/TextField';

<Form
  /*- begin highlight -*/
  validationErrors={{
    username: 'This username is not available.'
  }}>
  {/*- end highlight -*/}
  <TextField
    name="username"
    label="Username"
    placeholder="Choose a username"
    defaultValue="admin" />

```

### Focus management

By default, after a user submits a form with validation errors, the first invalid field will be focused. To prevent this, call `preventDefault()` in the `onInvalid` event. This example moves focus to an [alert](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/alert_role) at the top of the form.

```tsx
import {Form} from 'vanilla-starter/Form';
import {TextField} from 'vanilla-starter/TextField';
import {Button} from 'vanilla-starter/Button';
import {useState} from 'react';

function Example() {
  let [isInvalid, setInvalid] = useState(false);

  return (
    <Form
      /*- begin highlight -*/
      onInvalid={e => {
        e.preventDefault();
        setInvalid(true);
      }}
      /*- end highlight -*/
      onSubmit={e => {
        e.preventDefault();
        setInvalid(false);
      }}
      onReset={() => setInvalid(false)}>
      {isInvalid &&
        <div role="alert" tabIndex={-1} ref={e => e?.focus()}>
          <h3>Unable to submit</h3>
          <p>Please fix the validation errors below, and re-submit the form.</p>
        </div>
      }
      <TextField
        name="firstName"
        isRequired
        label="First Name"
        placeholder="Enter your first name" />
      <TextField
        name="lastName"
        isRequired
        label="Last Name"
        placeholder="Enter your last name" />
      <div style={{display: 'flex', gap: 8}}>
        <Button type="submit">Submit
        <Button type="reset" variant="secondary">Reset
      </div>
    
  );
}
```

## Examples

<ExampleList
  tag="form"
  pages={props.pages}
/>

## API

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `action` | `string | ((formData: FormData) => void | Promise<void>) | undefined` | — | Where to send the form-data when the form is submitted. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#action). |
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `autoCapitalize` | `"characters" | "none" | "off" | "on" | "sentences" | "words" | undefined` | — | Controls whether inputted text is automatically capitalized and, if so, in what manner. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/autocapitalize). |
| `autoComplete` | `"off" | "on" | undefined` | — | Indicates whether input elements can by default have their values automatically completed by the browser. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#autocomplete). |
| `children` | `React.ReactNode` | — | The children of the component. |
| `className` | `string | undefined` | 'react-aria-Form' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
| `dir` | `string | undefined` | — |  |
| `encType` | `"application/x-www-form-urlencoded" | "multipart/form-data" | "text/plain" | undefined` | — | The enctype attribute specifies how the form-data should be encoded when submitting it to the server. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#enctype). |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `lang` | `string | undefined` | — |  |
| `method` | `"dialog" | "get" | "post" | undefined` | — | The HTTP method to submit the form with. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#method). |
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
| `onInvalid` | `((event: React.FormEvent) => void) | undefined` | — | Triggered for each invalid field when a user submits the form. |
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

## API (part 2)

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
| `onReset` | `((event: React.FormEvent) => void) | undefined` | — | Triggered when a user resets the form. |
| `onScroll` | `React.UIEventHandler | undefined` | — |  |
| `onScrollCapture` | `React.UIEventHandler | undefined` | — |  |
| `onSubmit` | `((event: React.FormEvent) => void) | undefined` | — | Triggered when a user submits the form. |
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
| `render` | `DOMRenderFunction<"form", undefined> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `role` | `"presentation" | "search" | undefined` | — | An ARIA role override to apply to the form element. |
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `target` | `"_blank" | "_parent" | "_self" | "_top" | undefined` | — | The target attribute specifies a name or a keyword that indicates where to display the response that is received after submitting the form. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#target). |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `validationBehavior` | `"aria" | "native" | undefined` | 'native' | Whether to use native HTML form validation to prevent form submission when a field value is missing or invalid, or mark fields as required or invalid via ARIA. |
| `validationErrors` | `ValidationErrors | undefined` | — | Validation errors for the form, typically returned by a server. This should be set to an object mapping from input names to errors. |

