# Calendar

## Introduction

A calendar displays one or more date grids and allows users to select a single date.

## Vanilla CSS example

### Calendar.tsx

```tsx
'use client';
import {
  Calendar as AriaCalendar,
  CalendarCell as AriaCalendarCell,
  CalendarGrid as AriaCalendarGrid,
  CalendarHeading,
  type CalendarProps as AriaCalendarProps,
  type DateValue,
  type CalendarCellProps,
  type CalendarGridProps
} from 'react-aria-components/Calendar';
import {Text} from './Content';
import {ChevronLeft, ChevronRight} from 'lucide-react';
import {Button} from './Button';
import './Calendar.css';

export interface CalendarProps<T extends DateValue> extends AriaCalendarProps {
  errorMessage?: string;
}

export function Calendar<T extends DateValue>({errorMessage, ...props}: CalendarProps) {
  let months = props.visibleDuration?.months || 1;
  return (
    <AriaCalendar {...props}>
      <div className="months">
        {Array.from({length: months}, (_, i) => (
          <div key={i} className="month">
            <header>
              {i === 0 && (
                <Button slot="previous" variant="quiet">
                  
                
              )}
              <CalendarHeading offset={{months: i}} />
              {i === months - 1 && (
                <Button slot="next" variant="quiet">
                  
                
              )}
            </header>
            <CalendarGrid offset={{months: i}}>{date => <CalendarCell date={date} />}
          </div>
        ))}
      </div>
      {errorMessage && <Text slot="errorMessage">{errorMessage}}
    
  );
}

export function CalendarCell(props: CalendarCellProps) {
  return (
    <AriaCalendarCell
      {...props}
      className="react-aria-CalendarCell button-base"
      data-variant="quiet"
    />
  );
}

export function CalendarGrid(props: CalendarGridProps) {
  return <AriaCalendarGrid {...props} />;
}

```

### Calendar.css

```css
@import './theme.css';
@import './utilities.css';

.react-aria-Calendar {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-2);
  overflow: auto;
  width: 100%;
  max-width: fit-content;
  color: var(--text-color);
  font: var(--font-size) system-ui;

  .months {
    display: flex;
    gap: var(--spacing-3);
  }

  .month {
    width: calc(var(--spacing-9) * 7);
    min-width: calc(var(--spacing-7) * 7);
    container-type: inline-size;
  }

  header {
    display: flex;
    align-items: center;
    margin: 0 var(--spacing-1) var(--spacing-4) var(--spacing-1);
    min-height: var(--spacing-8);

    .react-aria-CalendarHeading {
      flex: 1;
      margin: 0;
      text-align: center;
      font-size: var(--font-size-lg);
    }
  }

  .react-aria-CalendarGrid {
    border-spacing: 0;
  }

  [slot='errorMessage'] {
    font: var(--font-size-sm) system-ui;
    color: var(--invalid-color);
  }
}

.react-aria-CalendarHeaderCell {
  font-size: var(--font-size-sm);
}

.react-aria-CalendarCell {
  --gap: var(--spacing-1);
  width: calc((100cqw / 7) - var(--gap));
  aspect-ratio: 1;
  margin: calc(var(--gap) / 2);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: var(--font-size);
  text-align: center;
  border-radius: 9999px;
  cursor: default;
  forced-color-adjust: none;
  transition: scale 200ms;
  -webkit-tap-highlight-color: transparent;

## Vanilla CSS example (part 2)

@media (min-resolution: 200dpi) {
    @container (width < 300px) {
      --gap: 0px;
    }
  }

  &[data-disabled] {
    opacity: 0.5;
  }

  &[data-pressed] {
    scale: 0.9;
  }

  &[data-unavailable] {
    text-decoration: line-through;
    color: var(--invalid-color);
  }

  &[data-invalid] {
    --button-color: var(--invalid-color);
  }
}

```

## Tailwind example

### Calendar.tsx

```tsx
'use client';
import {ChevronLeft, ChevronRight} from 'lucide-react';
import React from 'react';
import {
  Calendar as AriaCalendar,
  CalendarGridHeader as AriaCalendarGridHeader,
  type CalendarProps as AriaCalendarProps,
  CalendarCell,
  CalendarGrid,
  CalendarGridBody,
  CalendarHeaderCell,
  CalendarHeading,
  Text,
  type DateValue
} from 'react-aria-components/Calendar';
import {useLocale} from 'react-aria-components/I18nProvider';
import {tv} from 'tailwind-variants';
import {Button} from './Button';
import {composeTailwindRenderProps, focusRing} from './utils';

const cellStyles = tv({
  extend: focusRing,
  base: 'w-[calc(100cqw/7)] aspect-square text-sm cursor-default rounded-full flex items-center justify-center forced-color-adjust-none [-webkit-tap-highlight-color:transparent]',
  variants: {
    isSelected: {
      false:
        'text-neutral-900 dark:text-neutral-200 hover:bg-neutral-200 dark:hover:bg-neutral-700 pressed:bg-neutral-300 dark:pressed:bg-neutral-600',
      true: 'bg-blue-600 invalid:bg-red-600 text-white forced-colors:bg-[Highlight] forced-colors:invalid:bg-[Mark] forced-colors:text-[HighlightText]'
    },
    isDisabled: {
      true: 'text-neutral-300 dark:text-neutral-600 forced-colors:text-[GrayText]'
    }
  }
});

export interface CalendarProps<T extends DateValue> extends AriaCalendarProps {
  errorMessage?: string;
}

## Tailwind example (part 2)

export function Calendar<T extends DateValue>({errorMessage, ...props}: CalendarProps) {
  let {direction} = useLocale();
  let months = props.visibleDuration?.months || 1;
  return (
    <AriaCalendar
      {...props}
      className={composeTailwindRenderProps(
        props.className,
        'flex font-sans w-full max-w-fit overflow-auto gap-3'
      )}>
      {Array.from({length: months}, (_, i) => (
        <div key={i} className="@container flex flex-col w-[calc(9*var(--spacing)*7)]">
          <header className="flex items-center mb-4">
            {i === 0 && (
              <Button variant="quiet" slot="previous">
                {direction === 'rtl' ? (
                  <ChevronRight aria-hidden size={18} />
                ) : (
                  <ChevronLeft aria-hidden size={18} />
                )}
              
            )}
            <CalendarHeading
              offset={{months: i}}
              className="flex-1 font-sans font-semibold [font-variation-settings:normal] text-base text-center mx-2 my-0 text-neutral-900 dark:text-neutral-200"
            />
            {i === months - 1 && (
              <Button variant="quiet" slot="next">
                {direction === 'rtl' ? (
                  <ChevronLeft aria-hidden size={18} />
                ) : (
                  <ChevronRight aria-hidden size={18} />
                )}
              
            )}
          </header>
          <CalendarGrid offset={{months: i}} className="border-spacing-0">
            
            
              {date => <CalendarCell date={date} className={cellStyles} />}
            
          
        </div>
      ))}
      {errorMessage && (
        <Text slot="errorMessage" className="text-sm text-red-600">
          {errorMessage}
        
      )}
    
  );
}

export function CalendarGridHeader() {
  return (
    
      {day => (
        <CalendarHeaderCell className="text-xs text-neutral-500 font-semibold">
          {day}
        
      )}
    
  );
}

```

## Value

Use the `value` or `defaultValue` prop to set the date value, using objects in the [@internationalized/date](internationalized/date/.md) package. This library supports parsing date strings in multiple formats, manipulation across international calendar systems, time zones, etc.

```tsx
import {parseDate, getLocalTimeZone} from '@internationalized/date';
import {useDateFormatter} from 'react-aria/useDateFormatter';
import {Calendar} from 'vanilla-starter/Calendar';
import {useState} from 'react';

function Example() {
  let [date, setDate] = useState(parseDate('2020-02-03'));
  let formatter = useDateFormatter({ dateStyle: 'full' });

  return (
    <>
      <Calendar
        value={date}
        onChange={setDate}
      />
      <p>Selected date: {formatter.format(date.toDate(getLocalTimeZone()))}</p>
    </>
  );
}
```

### International calendars

By default, `Calendar` displays the value using the calendar system for the user's locale. Use `<I18nProvider>` to override the calendar system by setting the [Unicode calendar locale extension](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/calendar#adding_a_calendar_in_the_locale_string). The `onChange` event always receives a date in the same calendar as the `value` or `defaultValue` (Gregorian if no value is provided), regardless of the displayed locale.

```tsx
import {I18nProvider} from 'react-aria-components/I18nProvider';
import {parseDate} from '@internationalized/date';
import {Calendar} from 'vanilla-starter/Calendar';

<I18nProvider>
  <Calendar defaultValue={parseDate('2025-02-03')} />
</I18nProvider>
```

### Custom calendar systems

`Calendar` also supports custom calendar systems that implement custom business rules, for example a fiscal year calendar that follows a [4-5-4 format](https://nrf.com/resources/4-5-4-calendar), where month ranges don't follow the usual Gregorian calendar. See the [@internationalized/date docs](internationalized/date/Calendar.md#custom-calendars) for an example implementation.

```tsx
import type {AnyCalendarDate, Calendar as ICalendar} from '@internationalized/date';
import {CalendarDate, startOfWeek, GregorianCalendar} from '@internationalized/date';
import {Calendar} from 'vanilla-starter/Calendar';

export default function Example() {
  return (
    <Calendar
      firstDayOfWeek="sun"
      createCalendar={() => new Custom454()} />
  );
}

// See @internationalized/date docs linked above.
class Custom454 extends GregorianCalendar {
  // The anchor date, in Gregorian calendar.
  // The anchor date is a date that occurs in the first week of the first month of every fiscal year.
  anchorDate = new CalendarDate(2001, 2, 4);

  private getYear(year: number): [CalendarDate, number[]] {
    let anchor = this.anchorDate.set({year});
    let startOfYear = startOfWeek(anchor, 'en', 'sun');
    let isBigYear = !startOfYear.add({weeks: 53}).compare(anchor.add({years: 1}));
    let weekPattern = [4, 5, 4, 4, 5, 4, 4, 5, 4, 4, 5, isBigYear ? 5 : 4];
    return [startOfYear, weekPattern];
  }

## Value (part 2)

getDaysInMonth(date: AnyCalendarDate): number {
    let [, weekPattern] = this.getYear(date.year);
    return weekPattern[date.month - 1] * 7;
  }

  fromJulianDay(jd: number): CalendarDate {
    let gregorian = super.fromJulianDay(jd);
    let year = gregorian.year;

    let [monthStart, weekPattern] = this.getYear(year);
    if (gregorian.compare(monthStart) < 0) {
      year--;
      [monthStart, weekPattern] = this.getYear(year);
    }

    for (let month = 1; month <= 12; month++) {
      let weeks = weekPattern[month - 1];
      let nextMonth = monthStart.add({weeks});
      if (nextMonth.compare(gregorian) > 0) {
        let days = gregorian.compare(monthStart);
        return new CalendarDate(this, year, month, days + 1);
      }
      monthStart = nextMonth;
    }

    throw new Error('date not found');
  }

  toJulianDay(date: AnyCalendarDate): number {
    let [monthStart, weekPattern] = this.getYear(date.year);
    for (let month = 1; month < date.month; month++) {
      monthStart = monthStart.add({weeks: weekPattern[month - 1]});
    }

    let gregorian = monthStart.add({days: date.day - 1});
    return super.toJulianDay(gregorian);
  }

  getFormattableMonth(date: AnyCalendarDate): CalendarDate {
    let anchorMonth = this.anchorDate.month - 1;
    let dateMonth = date.month - 1;
    let month = ((anchorMonth + dateMonth) % 12) + 1;
    let year = anchorMonth + dateMonth >= 12 ? date.year + 1 : date.year;
    return new CalendarDate(year, month, 1);
  }

  isEqual(other: ICalendar): boolean {
    return other instanceof Custom454 && other.anchorDate.compare(this.anchorDate) === 0;
  }
}
```

## Validation

Use the `minValue` and `maxValue` props to set the valid date range. The `isDateUnavailable` callback prevents certain dates from being selected. For custom validation rules, set the `isInvalid` prop and the `errorMessage` slot.

```tsx
import {isWeekend, today, getLocalTimeZone} from '@internationalized/date';
import {useLocale} from 'react-aria-components/I18nProvider';
import {Calendar} from 'vanilla-starter/Calendar';

function Example(props) {
  let {locale} = useLocale();
  let now = today(getLocalTimeZone());
  let disabledRanges = [
    [now, now.add({ days: 5 })],
    [now.add({ days: 14 }), now.add({ days: 16 })],
    [now.add({ days: 23 }), now.add({ days: 24 })]
  ];

  return (
    <Calendar
      {...props}
      aria-label="Appointment date"
      
      minValue={today(getLocalTimeZone())}
      isDateUnavailable={date => (
        isWeekend(date, locale) ||
        disabledRanges.some((interval) =>
          date.compare(interval[0]) >= 0 && date.compare(interval[1]) <= 0
        )
      )} />
  );
}
```

## Display options

Set the `visibleDuration` prop and render multiple `CalendarGrid` elements to display more than one month at a time. The `pageBehavior` prop controls whether pagination advances by a single month or multiple. The `firstDayOfWeek` and `weeksInMonth` props override the locale-specified defaults.

```tsx
import {Calendar} from 'vanilla-starter/Calendar';

function Example(props) {
  return (
    <Calendar
      {...props}
      aria-label="Appointment date"
      
     />
  );
}
```

## Controlling the focused date

Use the `focusedValue` or `defaultFocusedValue` prop to control which date is focused. This controls which month is visible. The `onFocusChange` event is called when a date is focused by the user.

```tsx
import {Calendar} from 'vanilla-starter/Calendar';
import {Button} from 'vanilla-starter/Button';
import {CalendarDate, today, getLocalTimeZone} from '@internationalized/date';
import {useState} from 'react';

function Example() {
  let defaultDate = new CalendarDate(2021, 7, 1);
  let [focusedDate, setFocusedDate] = useState(defaultDate);

  return (
    <div>
      <Button
        style={{marginBottom: 20}}
        onPress={() => setFocusedDate(today(getLocalTimeZone()))}>
        Today
      
      <Calendar
        focusedValue={focusedDate}
        onFocusChange={setFocusedDate}
      />
    </div>
  );
}
```

### Month and year pickers

Use the `` and `` components to allow the user to jump to a different month or year. This example uses the render prop function to render a [Select](Select.md).

```tsx
import {Calendar, CalendarMonthPicker, CalendarYearPicker} from 'react-aria-components/Calendar';
import {CalendarGrid, CalendarCell} from 'vanilla-starter/Calendar';
import {Button} from 'vanilla-starter/Button';
import {Select, SelectItem} from 'vanilla-starter/Select';
import {ChevronLeft, ChevronRight} from 'lucide-react';

  <div className="months">
    <div className="month">
      <header style={{display: 'flex', gap: 4}}>
        <Button slot="previous" variant="quiet">
          
        
        {/*- begin highlight -*/}
        
          {(props) => (
            <Select {...props}>
              {item => {item.formatted}}
            
          )}
        
        
          {(props) => (
            <Select {...props}>
              {item => {item.formatted}}
            
          )}
        
        {/*- end highlight -*/}
        <Button slot="next" variant="quiet">
          
        
      </header>
      
        {(date) => <CalendarCell date={date} />}
      
    </div>
  </div>

```

## API

```tsx

  
  
  
  <Button slot="previous" />
  <Button slot="next" />
  
    
      {day => }
    
    
      {date => <CalendarCell date={date} />}
    
  
  <Text slot="errorMessage" />

```

### Calendar

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `autoFocus` | `boolean | undefined` | false | Whether to automatically focus the calendar when it mounts. |
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-Calendar' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `createCalendar` | `((identifier: CalendarIdentifier) => ICalendar) | undefined` | — | A function to create a new [Calendar](https://react-spectrum.adobe.com/internationalized/date/Calendar.html) object for a given calendar identifier. If not provided, the `createCalendar` function from `@internationalized/date` will be used. |
| `defaultFocusedValue` | `DateValue | null | undefined` | — | The date that is focused when the calendar first mounts (uncontrolled). |
| `defaultValue` | `CalendarValueType<null, M | T> | undefined` | — | The default value (uncontrolled). |
| `dir` | `string | undefined` | — |  |
| `firstDayOfWeek` | `"fri" | "mon" | "sat" | "sun" | "thu" | "tue" | "wed" | undefined` | — | The day that starts the week. |
| `focusedValue` | `DateValue | null | undefined` | — | Controls the currently focused date within the calendar. |
| `hidden` | `boolean | undefined` | — |  |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `inert` | `boolean | undefined` | — |  |
| `isDateUnavailable` | `((date: DateValue) => boolean) | undefined` | — | Callback that is called for each date of the calendar. If it returns true, then the date is unavailable. |
| `isDisabled` | `boolean | undefined` | false | Whether the calendar is disabled. |
| `isInvalid` | `boolean | undefined` | — | Whether the current selection is invalid according to application logic. |
| `isReadOnly` | `boolean | undefined` | false | Whether the calendar value is immutable. |
| `lang` | `string | undefined` | — |  |
| `maxValue` | `DateValue | null | undefined` | — | The maximum allowed date that a user may select. |
| `minValue` | `DateValue | null | undefined` | — | The minimum allowed date that a user may select. |
| `onAnimationEnd` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationEndCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIteration` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationIterationCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStart` | `React.AnimationEventHandler | undefined` | — |  |
| `onAnimationStartCapture` | `React.AnimationEventHandler | undefined` | — |  |
| `onAuxClick` | `React.MouseEventHandler | undefined` | — |  |
| `onAuxClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onChange` | `((value: CalendarValueType<MappedDateValue, M>) => void) | undefined` | — | Handler that is called when the value changes. |
| `onClick` | `React.MouseEventHandler | undefined` | — |  |
| `onClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenu` | `React.MouseEventHandler | undefined` | — |  |
| `onContextMenuCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClick` | `React.MouseEventHandler | undefined` | — |  |
| `onDoubleClickCapture` | `React.MouseEventHandler | undefined` | — |  |
| `onFocusChange` | `((date: CalendarDate) => void) | undefined` | — | Handler that is called when the focused date changes. |
| `onGotPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onGotPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onLostPointerCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onLostPointerCaptureCapture` | `React.PointerEventHandler | undefined` | — |  |
| `onMouseDown` | `React.MouseEventHandler | undefined` | — |  |
| `onMouseDownCapture` | `React.MouseEventHandler | undefined` | — |  |

## API (part 3)

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
| `onTransitionCancelCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEnd` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEndCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRun` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRunCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStart` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStartCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onWheel` | `React.WheelEventHandler | undefined` | — |  |
| `onWheelCapture` | `React.WheelEventHandler | undefined` | — |  |
| `pageBehavior` | `PageBehavior | undefined` | visible | Controls the behavior of paging. Pagination either works by advancing the visible page by visibleDuration (default) or one unit of visibleDuration. |
| `render` | `DOMRenderFunction<"div", CalendarRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `selectionAlignment` | `"center" | "end" | "start" | undefined` | 'center' | Determines the alignment of the visible months on initial render based on the current selection or current date if there is no selection. |
| `selectionMode` | `M | undefined` | 'single' | Whether single or multiple selection is enabled. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |

## API (part 4)

| `style` | `(((values: CalendarRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `value` | `CalendarValueType<null, M | T> | undefined` | — | The current value (controlled). |
| `visibleDuration` | `DateDuration | undefined` | \{ months: 1 } | The amount of days that will be displayed at once. This affects how pagination works. |
| `weeksInMonth` | `number | undefined` | — | The number of weeks in a month. This overrides the default set by the locale. |

## API (part 5)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `((date: CalendarDate) => ReactElement) | React.ReactElement<React.JSXElementConstructor<any> | unknown, string> | React.ReactElement<React.JSXElementConstructor<any> | unknown, string>[] | undefined` | — | Either a function to render calendar cells for each date in the month, or children containing a ``` and ``when additional customization is needed. |
|`className`|`string | undefined`| 'react-aria-CalendarGrid' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
|`dir`|`string | undefined`| — |  |
|`hidden`|`boolean | undefined`| — |  |
|`inert`|`boolean | undefined`| — |  |
|`lang`|`string | undefined`| — |  |
|`offset`|`DateDuration | undefined`| — | An offset from the beginning of the visible date range that this CalendarGrid should display. Useful when displaying more than one month at a time. |
|`onAnimationEnd`|`React.AnimationEventHandler | undefined`| — |  |
|`onAnimationEndCapture`|`React.AnimationEventHandler | undefined`| — |  |
|`onAnimationIteration`|`React.AnimationEventHandler | undefined`| — |  |
|`onAnimationIterationCapture`|`React.AnimationEventHandler | undefined`| — |  |
|`onAnimationStart`|`React.AnimationEventHandler | undefined`| — |  |
|`onAnimationStartCapture`|`React.AnimationEventHandler | undefined`| — |  |
|`onAuxClick`|`React.MouseEventHandler | undefined`| — |  |
|`onAuxClickCapture`|`React.MouseEventHandler | undefined`| — |  |
|`onClick`|`React.MouseEventHandler | undefined`| — |  |
|`onClickCapture`|`React.MouseEventHandler | undefined`| — |  |
|`onContextMenu`|`React.MouseEventHandler | undefined`| — |  |
|`onContextMenuCapture`|`React.MouseEventHandler | undefined`| — |  |
|`onDoubleClick`|`React.MouseEventHandler | undefined`| — |  |
|`onDoubleClickCapture`|`React.MouseEventHandler | undefined`| — |  |
|`onGotPointerCapture`|`React.PointerEventHandler | undefined`| — |  |
|`onGotPointerCaptureCapture`|`React.PointerEventHandler | undefined`| — |  |
|`onLostPointerCapture`|`React.PointerEventHandler | undefined`| — |  |
|`onLostPointerCaptureCapture`|`React.PointerEventHandler | undefined`| — |  |
|`onMouseDown`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseDownCapture`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseEnter`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseLeave`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseMove`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseMoveCapture`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseOut`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseOutCapture`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseOver`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseOverCapture`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseUp`|`React.MouseEventHandler | undefined`| — |  |
|`onMouseUpCapture`|`React.MouseEventHandler | undefined`| — |  |
|`onPointerCancel`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerCancelCapture`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerDown`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerDownCapture`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerEnter`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerLeave`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerMove`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerMoveCapture`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerOut`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerOutCapture`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerOver`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerOverCapture`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerUp`|`React.PointerEventHandler | undefined`| — |  |
|`onPointerUpCapture`|`React.PointerEventHandler | undefined`| — |  |
|`onScroll`|`React.UIEventHandler | undefined`| — |  |
|`onScrollCapture`|`React.UIEventHandler | undefined`| — |  |
|`onTouchCancel`|`React.TouchEventHandler | undefined`| — |  |
|`onTouchCancelCapture`|`React.TouchEventHandler | undefined`| — |  |
|`onTouchEnd`|`React.TouchEventHandler | undefined`| — |  |
|`onTouchEndCapture`|`React.TouchEventHandler | undefined`| — |  |
|`onTouchMove`|`React.TouchEventHandler | undefined`| — |  |
|`onTouchMoveCapture`|`React.TouchEventHandler | undefined`| — |  |
|`onTouchStart`|`React.TouchEventHandler | undefined`| — |  |
|`onTouchStartCapture`|`React.TouchEventHandler | undefined`| — |  |
|`onTransitionCancel`|`React.TransitionEventHandler | undefined`| — |  |

## API (part 6)

|`onTransitionCancelCapture`|`React.TransitionEventHandler | undefined`| — |  |
|`onTransitionEnd`|`React.TransitionEventHandler | undefined`| — |  |
|`onTransitionEndCapture`|`React.TransitionEventHandler | undefined`| — |  |
|`onTransitionRun`|`React.TransitionEventHandler | undefined`| — |  |
|`onTransitionRunCapture`|`React.TransitionEventHandler | undefined`| — |  |
|`onTransitionStart`|`React.TransitionEventHandler | undefined`| — |  |
|`onTransitionStartCapture`|`React.TransitionEventHandler | undefined`| — |  |
|`onWheel`|`React.WheelEventHandler | undefined`| — |  |
|`onWheelCapture`|`React.WheelEventHandler | undefined`| — |  |
|`render`|`DOMRenderFunction\<"table", undefined> | undefined`| — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if`<button>`is expected, you cannot render an  `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style`|`React.CSSProperties | undefined`| — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
|`translate`|`"no" | "yes" | undefined`| — |  |
|`weekdayStyle`|`"long" | "narrow" | "short" | undefined\` | 'narrow' | The style of weekday names to display in the calendar grid header, e.g. single letter, abbreviation, or full day name. |

## API (part 7)

### CalendarGridHeader

## API (part 8)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `(day: string) => ReactElement` | — | A function to render a `` for a weekday name. |
| `className` | `string | undefined` | 'react-aria-CalendarGridHeader' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
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
| `onTransitionCancelCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEnd` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEndCapture` | `React.TransitionEventHandler | undefined` | — |  |

## API (part 9)

| `onTransitionRun` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRunCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStart` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStartCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onWheel` | `React.WheelEventHandler | undefined` | — |  |
| `onWheelCapture` | `React.WheelEventHandler | undefined` | — |  |
| `render` | `DOMRenderFunction<"thead", undefined> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 10)

### CalendarHeaderCell

## API (part 11)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `React.ReactNode` | — | The children of the component. |
| `className` | `string | undefined` | 'react-aria-CalendarHeaderCell' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
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

## API (part 12)

| `onTransitionEnd` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEndCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRun` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRunCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStart` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStartCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onWheel` | `React.WheelEventHandler | undefined` | — |  |
| `onWheelCapture` | `React.WheelEventHandler | undefined` | — |  |
| `render` | `DOMRenderFunction<"th", undefined> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 13)

### CalendarGridBody

## API (part 14)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `(date: CalendarDate) => ReactElement` | — | A function to render a `` for a given date. |
| `className` | `string | undefined` | 'react-aria-CalendarGridBody' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
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
| `onTransitionCancelCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEnd` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionEndCapture` | `React.TransitionEventHandler | undefined` | — |  |

## API (part 15)

| `onTransitionRun` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionRunCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStart` | `React.TransitionEventHandler | undefined` | — |  |
| `onTransitionStartCapture` | `React.TransitionEventHandler | undefined` | — |  |
| `onWheel` | `React.WheelEventHandler | undefined` | — |  |
| `onWheelCapture` | `React.WheelEventHandler | undefined` | — |  |
| `render` | `DOMRenderFunction<"tbody", undefined> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style` | `React.CSSProperties | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 16)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `ChildrenOrFunction` | — | The children of the component. A function may be provided to alter the children based on component state. |
| `className` | `ClassNameOrFunction | undefined` | 'react-aria-CalendarCell' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. A function may be provided to compute the class based on component state. |
| `date` | `CalendarDate` | — | The date to render in the cell. |
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
| `onTouchMove` | `React.TouchEventHandler | undefined` | — |  |

## API (part 17)

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
| `render` | `DOMRenderFunction<"div", CalendarCellRenderProps> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `style` | `(((values: CalendarCellRenderProps & { defaultStyle: React.CSSProperties; }) => React.CSSProperties | React.CSSProperties | undefined)) | undefined` | — | The inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. A function may be provided to compute the style based on component state. |
| `translate` | `"no" | "yes" | undefined` | — |  |

## API (part 18)

### CalendarHeading

## API (part 19)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `about` | `string | undefined` | — |  |
| `accessKey` | `string | undefined` | — |  |
| `aria-activedescendant` | `string | undefined` | — | Identifies the currently active element when DOM focus is on a composite widget, textbox, group, or application. |
| `aria-atomic` | `(boolean | "true" | "false") | undefined` | — | Indicates whether assistive technologies will present all, or only parts of, the changed region based on the change notifications defined by the aria-relevant attribute. |
| `aria-autocomplete` | `"both" | "inline" | "list" | "none" | undefined` | — | Indicates whether inputting text could trigger display of one or more predictions of the user's intended value for an input and specifies how predictions would be presented if they are made. |
| `aria-braillelabel` | `string | undefined` | — | Indicates an element is being modified and that assistive technologies MAY want to wait until the modifications are complete before exposing them to the user. |
| `aria-brailleroledescription` | `string | undefined` | — | Defines a human-readable, author-localized abbreviated description for the role of an element, which is intended to be converted into Braille. |
| `aria-busy` | `(boolean | "true" | "false") | undefined` | — |  |
| `aria-checked` | `boolean | "true" | "false" | "mixed" | undefined` | — | Indicates the current "checked" state of checkboxes, radio buttons, and other widgets. |
| `aria-colcount` | `number | undefined` | — | Defines the total number of columns in a table, grid, or treegrid. |
| `aria-colindex` | `number | undefined` | — | Defines an element's column index or position with respect to the total number of columns within a table, grid, or treegrid. |
| `aria-colindextext` | `string | undefined` | — | Defines a human readable text alternative of aria-colindex. |
| `aria-colspan` | `number | undefined` | — | Defines the number of columns spanned by a cell or gridcell within a table, grid, or treegrid. |
| `aria-controls` | `string | undefined` | — | Identifies the element (or elements) whose contents or presence are controlled by the current element. |
| `aria-current` | `boolean | "true" | "false" | "date" | "location" | "page" | "step" | "time" | undefined` | — | Indicates the element that represents the current item within a container or set of related elements. |
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-description` | `string | undefined` | — | Defines a string value that describes or annotates the current element. |
| `aria-details` | `string | undefined` | — | Identifies the element that provides a detailed, extended description for the object. |
| `aria-disabled` | `(boolean | "true" | "false") | undefined` | — | Indicates that the element is perceivable but disabled, so it is not editable or otherwise operable. |
| `aria-errormessage` | `string | undefined` | — | Identifies the element that provides an error message for the object. |
| `aria-expanded` | `(boolean | "true" | "false") | undefined` | — | Indicates whether the element, or another grouping element it controls, is currently expanded or collapsed. |
| `aria-flowto` | `string | undefined` | — | Identifies the next element (or elements) in an alternate reading order of content which, at the user's discretion, allows assistive technology to override the general default of reading in document source order. |
| `aria-haspopup` | `boolean | "true" | "false" | "dialog" | "grid" | "listbox" | "menu" | "tree" | undefined` | — | Indicates the availability and type of interactive popup element, such as menu or dialog, that can be triggered by an element. |
| `aria-hidden` | `(boolean | "true" | "false") | undefined` | — | Indicates whether the element is exposed to an accessibility API. |
| `aria-invalid` | `boolean | "true" | "false" | "grammar" | "spelling" | undefined` | — | Indicates the entered value does not conform to the format expected by the application. |
| `aria-keyshortcuts` | `string | undefined` | — | Indicates keyboard shortcuts that an author has implemented to activate or give focus to an element. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `aria-level` | `number | undefined` | — | Defines the hierarchical level of an element within a structure. |

## API (part 20)

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
| `children` | `React.ReactNode` | — |  |
| `className` | `string | undefined` | 'react-aria-CalendarHeading' | The CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. |
| `color` | `string | undefined` | — |  |
| `content` | `string | undefined` | — |  |
| `contentEditable` | `"inherit" | "plaintext-only" | (boolean | "true" | "false") | undefined` | — |  |
| `contextMenu` | `string | undefined` | — |  |
| `dangerouslySetInnerHTML` | `{ __html: string | TrustedHTML; } | undefined` | — |  |
| `datatype` | `string | undefined` | — |  |

## API (part 21)

| `defaultChecked` | `boolean | undefined` | — |  |
| `defaultValue` | `number | string | readonly string[] | undefined` | — |  |
| `dir` | `string | undefined` | — |  |
| `draggable` | `(boolean | "true" | "false") | undefined` | — |  |
| `enterKeyHint` | `"done" | "enter" | "go" | "next" | "previous" | "search" | "send" | undefined` | — |  |
| `exportparts` | `string | undefined` | — |  |
| `format` | `CalendarHeadingFormatOptions | undefined` | — | The format of the month heading. |
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
| `level` | `number | undefined` | 3 | The heading level. |
| `nonce` | `string | undefined` | — |  |
| `offset` | `DateDuration | undefined` | 0 | The number of months from the start of the visible range to display. |
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
| `onDragLeave` | `React.DragEventHandler | undefined` | — |  |

## API (part 22)

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
| `onPointerOut` | `React.PointerEventHandler | undefined` | — |  |

## API (part 23)

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
| `render` | `DOMRenderFunction<"h1", undefined> | undefined` | — | Overrides the default DOM element with a custom render function. This allows rendering existing components with built-in styles and behaviors such as router links, animation libraries, and pre-styled components. Requirements: - You must render the expected element type (e.g. if `<button>` is expected, you cannot render an   `<a>`). - Only a single root DOM element can be rendered (no fragments). - You must pass through props and ref to the underlying DOM element, merging with your own prop   as appropriate. |
| `resource` | `string | undefined` | — |  |
| `results` | `number | undefined` | — |  |

## API (part 24)

| `rev` | `string | undefined` | — |  |
| `role` | `React.AriaRole | undefined` | — |  |
| `security` | `string | undefined` | — |  |
| `slot` | `string | undefined` | — |  |
| `spellCheck` | `(boolean | "true" | "false") | undefined` | — |  |
| `style` | `React.CSSProperties | undefined` | — |  |
| `suppressContentEditableWarning` | `boolean | undefined` | — |  |
| `suppressHydrationWarning` | `boolean | undefined` | — |  |
| `tabIndex` | `number | undefined` | — |  |
| `title` | `string | undefined` | — |  |
| `translate` | `"no" | "yes" | undefined` | — |  |
| `typeof` | `string | undefined` | — |  |
| `unselectable` | `"off" | "on" | undefined` | — |  |
| `vocab` | `string | undefined` | — |  |

## API (part 25)

### CalendarMonthPicker

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `(renderProps: CalendarMonthPickerAria) => JSX.Element` | — | A function to render the month picker. |
| `format` | `"2-digit" | "long" | "narrow" | "numeric" | "short" | undefined` | — | The format of the month. |

### CalendarYearPicker

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `(renderProps: CalendarYearPickerAria) => JSX.Element` | — | A function to render the year picker. |
| `format` | `CalendarYearPickerFormatOptions | undefined` | — | The format to display. |
| `visibleYears` | `number | undefined` | 20 | The number of years to display. |

