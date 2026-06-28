# RangeCalendar

## Introduction

RangeCalendars display a grid of days in one or more months and allow users to select a
contiguous range of dates.

## Vanilla CSS example

### RangeCalendar.tsx

```tsx
'use client';
import {
  CalendarCell as AriaCalendarCell,
  RangeCalendar as AriaRangeCalendar,
  CalendarHeading,
  Text,
  type DateValue,
  type RangeCalendarProps as AriaRangeCalendarProps,
  type CalendarCellProps
} from 'react-aria-components/RangeCalendar';
import {composeRenderProps} from 'react-aria-components/composeRenderProps';
import {Button} from './Button';
import {ChevronLeft, ChevronRight} from 'lucide-react';
import {CalendarGrid} from './Calendar';
import './RangeCalendar.css';

export interface RangeCalendarProps<T extends DateValue> extends AriaRangeCalendarProps {
  errorMessage?: string;
}

export function RangeCalendar<T extends DateValue>({
  errorMessage,
  ...props
}: RangeCalendarProps) {
  let months = props.visibleDuration?.months || 1;
  return (
    <AriaRangeCalendar {...props}>
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

export {CalendarGrid};
export function CalendarCell(props: CalendarCellProps) {
  return (
    <AriaCalendarCell {...props}>
      {composeRenderProps(
        props.children,
        (
          children,
          {defaultChildren, isHovered, isPressed, isSelectionStart, isSelectionEnd, isDisabled}
        ) => (
          <span
            className="button-base"
            data-variant="quiet"
            data-hovered={isHovered || undefined}
            data-pressed={isPressed || undefined}
            data-selected={isSelectionStart || isSelectionEnd || undefined}
            data-disabled={isDisabled || undefined}>
            {children || defaultChildren}
          </span>
        )
      )}
    
  );
}

```

### RangeCalendar.css

```css
@import './theme.css';

.react-aria-RangeCalendar {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-2);
  overflow: auto;
  width: 100%;
  max-width: fit-content;
  font: var(--font-size) system-ui;
  color: var(--text-color);

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
    border-collapse: collapse;
    border-spacing: 0;
  }

## Vanilla CSS example (part 2)

[slot='errorMessage'] {
    font-size: var(--font-size-sm);
    color: var(--invalid-color);
  }

  .react-aria-CalendarCell {
    margin: 2px 0;
    padding: 0 calc(var(--gap) / 2);
    position: relative;
    z-index: 1;
    outline: none;

    span {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 100%;
      height: 100%;
      border-radius: 9999px;
      transition: scale 200ms;
    }

    &[data-selected] {
      border-radius: 0;
      background: var(--button-background);
      border-color: var(--tint-700);
      border-style: solid;
      border-width: 0;
      border-top-width: 0.5px;
      border-bottom-width: 0.5px;
      margin: 1.5px 0;

      @media (forced-colors: active) {
        border-color: Highlight;
      }

      &[data-selection-start],
      &:is(td:first-child > *, [aria-disabled] + td > *) {
        border-start-start-radius: 9999px;
        border-end-start-radius: 9999px;
        border-inline-start-width: 0.5px;
        margin-inline-start: calc(var(--gap) / 2 - 0.5px);
        padding-inline-start: 0;
      }

      &[data-selection-end],
      &:is(td:last-child > *, td:has(+ [aria-disabled]) > *) {
        border-end-end-radius: 9999px;
        border-start-end-radius: 9999px;
        border-inline-end-width: 0.5px;
        margin-inline-end: calc(var(--gap) / 2 - 0.5px);
        padding-inline-end: 0;
      }

      &[data-selection-start],
      &[data-selection-end] {
        z-index: 2;
      }

      &:not([data-selection-start], [data-selection-end]) span {
        color: var(--tint-1200);
        @media (forced-colors: active) {
          color: ButtonText;
        }
      }
    }

    &[data-pressed] {
      scale: 1;
      span {
        scale: 0.9;
      }
    }

    &[data-focus-visible] {
      outline: none;
      z-index: 2;
      span {
        outline: 2px solid var(--focus-ring-color);
        outline-offset: 2px;
      }
    }
  }
}

```

## Tailwind example

### RangeCalendar.tsx

```tsx
'use client';
import React from 'react';
import {ChevronLeft, ChevronRight} from 'lucide-react';
import {
  RangeCalendar as AriaRangeCalendar,
  CalendarCell,
  CalendarGrid,
  CalendarGridBody,
  CalendarHeading,
  Text,
  type DateValue,
  type RangeCalendarProps as AriaRangeCalendarProps
} from 'react-aria-components/RangeCalendar';
import {useLocale} from 'react-aria-components/I18nProvider';
import {tv} from 'tailwind-variants';
import {Button} from './Button';
import {CalendarGridHeader} from './Calendar';
import {composeTailwindRenderProps, focusRing} from './utils';

export interface RangeCalendarProps<T extends DateValue> extends AriaRangeCalendarProps {
  errorMessage?: string;
}

const cell = tv({
  extend: focusRing,
  base: 'w-full h-full flex items-center justify-center rounded-full forced-color-adjust-none text-neutral-900 dark:text-neutral-200',
  variants: {
    selectionState: {
      none: 'group-hover:bg-neutral-200 dark:group-hover:bg-neutral-700 group-pressed:bg-neutral-300 dark:group-pressed:bg-neutral-600',
      middle: [
        'group-hover:bg-blue-200 dark:group-hover:bg-blue-900 forced-colors:group-hover:bg-[Highlight]',
        'group-invalid:group-hover:bg-red-200 dark:group-invalid:group-hover:bg-red-900 forced-colors:group-invalid:group-hover:bg-[Mark]',
        'group-pressed:bg-blue-300 dark:group-pressed:bg-blue-800 forced-colors:group-pressed:bg-[Highlight] forced-colors:text-[HighlightText]',
        'group-invalid:group-pressed:bg-red-300 dark:group-invalid:group-pressed:bg-red-800 forced-colors:group-invalid:group-pressed:bg-[Mark]'
      ],
      cap: 'bg-blue-600 group-invalid:bg-red-600 forced-colors:bg-[Highlight] forced-colors:group-invalid:bg-[Mark] text-white forced-colors:text-[HighlightText]'
    },
    isDisabled: {
      true: 'text-neutral-300 dark:text-neutral-600 forced-colors:text-[GrayText]'
    }
  }
});

## Tailwind example (part 2)

export function RangeCalendar<T extends DateValue>({
  errorMessage,
  ...props
}: RangeCalendarProps) {
  let {direction} = useLocale();
  let months = props.visibleDuration?.months || 1;
  return (
    <AriaRangeCalendar
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
          <CalendarGrid offset={{months: i}} className="[&_td]:px-0 [&_td]:py-px border-spacing-0">
            
            
              {date => (
                <CalendarCell
                  date={date}
                  className="group w-[calc(100cqw/7)] aspect-square text-sm outline outline-0 cursor-default outside-month:text-neutral-300 selected:bg-blue-100 dark:selected:bg-blue-700/30 forced-colors:selected:bg-[Highlight] invalid:selected:bg-red-100 dark:invalid:selected:bg-red-700/30 forced-colors:invalid:selected:bg-[Mark] [td:first-child_&]:rounded-s-full selection-start:rounded-s-full [td:last-child_&]:rounded-e-full selection-end:rounded-e-full [-webkit-tap-highlight-color:transparent]">
                  {({
                    formattedDate,
                    isSelected,
                    isSelectionStart,
                    isSelectionEnd,
                    isFocusVisible,
                    isDisabled
                  }) => (
                    <span
                      className={cell({
                        selectionState:
                          isSelected && (isSelectionStart || isSelectionEnd)
                            ? 'cap'
                            : isSelected
                              ? 'middle'
                              : 'none',
                        isDisabled,
                        isFocusVisible
                      })}>
                      {formattedDate}
                    </span>
                  )}
                
              )}
            
          
        </div>
      ))}
      {errorMessage && (
        <Text slot="errorMessage" className="text-sm text-red-600">
          {errorMessage}
        
      )}
    
  );
}

```

## Value

Use the `value` or `defaultValue` prop to set the selected date range, using objects in the [@internationalized/date](internationalized/date/.md) package. This library supports parsing date strings in multiple formats, manipulation across international calendar systems, time zones, etc.

```tsx
import {parseDate, getLocalTimeZone} from '@internationalized/date';
import {useDateFormatter} from 'react-aria/useDateFormatter';
import {RangeCalendar} from 'vanilla-starter/RangeCalendar';
import {useState} from 'react';

function Example() {
  let [range, setRange] = useState({
    start: parseDate('2025-02-03'),
    end: parseDate('2025-02-12')
  });
  let formatter = useDateFormatter({ dateStyle: 'long' });

  return (
    <>
      <RangeCalendar
        value={range}
        onChange={setRange}
      />
      <p>Selected range: {formatter.formatRange(
        range.start.toDate(getLocalTimeZone()),
        range.end.toDate(getLocalTimeZone())
      )}</p>
    </>
  );
}
```

### International calendars

By default, `RangeCalendar` displays the value using the calendar system for the user's locale. Use `<I18nProvider>` to override the calendar system by setting the [Unicode calendar locale extension](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/calendar#adding_a_calendar_in_the_locale_string). The `onChange` event always receives a date in the same calendar as the `value` or `defaultValue` (Gregorian if no value is provided), regardless of the displayed locale.

```tsx
import {I18nProvider} from 'react-aria-components/I18nProvider';
import {parseDate} from '@internationalized/date';
import {RangeCalendar} from 'vanilla-starter/RangeCalendar';

<I18nProvider>
  <RangeCalendar
    defaultValue={{
      start: parseDate('2025-02-03'),
      end: parseDate('2025-02-12')
    }} />
</I18nProvider>
```

### Custom calendar systems

`RangeCalendar` also supports custom calendar systems that implement custom business rules, for example a fiscal year calendar that follows a [4-5-4 format](https://nrf.com/resources/4-5-4-calendar), where month ranges don't follow the usual Gregorian calendar. See the [@internationalized/date docs](internationalized/date/Calendar.md#custom-calendars) for an example implementation.

```tsx
import type {AnyCalendarDate, Calendar} from '@internationalized/date';
import {CalendarDate, startOfWeek, GregorianCalendar} from '@internationalized/date';
import {RangeCalendar} from 'vanilla-starter/RangeCalendar';

export default function Example() {
  return (
    <RangeCalendar
      firstDayOfWeek="sun"
      createCalendar={() => new Custom454()} />
  );
}

// See @internationalized/date docs linked above.
class Custom454 extends GregorianCalendar {
  // The anchor date, in Gregorian calendar.
  // The anchor date is a date that occurs in the first week of the first month of every fiscal year.
  anchorDate = new CalendarDate(2001, 2, 4);

## Value (part 2)

private getYear(year: number): [CalendarDate, number[]] {
    let anchor = this.anchorDate.set({year});
    let startOfYear = startOfWeek(anchor, 'en', 'sun');
    let isBigYear = !startOfYear.add({weeks: 53}).compare(anchor.add({years: 1}));
    let weekPattern = [4, 5, 4, 4, 5, 4, 4, 5, 4, 4, 5, isBigYear ? 5 : 4];
    return [startOfYear, weekPattern];
  }

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

  isEqual(other: Calendar): boolean {
    return other instanceof Custom454 && other.anchorDate.compare(this.anchorDate) === 0;
  }
}
```

## Validation

Use the `minValue` and `maxValue` props to set the valid date range. The `isDateUnavailable` callback prevents certain dates from being selected. Use `allowsNonContiguousRanges` to allow selecting ranges containing unavailable dates. For custom validation rules, set the `isInvalid` prop and the `errorMessage` slot.

```tsx
import {today, getLocalTimeZone} from '@internationalized/date';
import {RangeCalendar} from 'vanilla-starter/RangeCalendar';
import {useState} from 'react';

function Example(props) {
  let now = today(getLocalTimeZone());
  let [range, setRange] = useState({
    start: now.add({days: 6}),
    end: now.add({ days: 14 })
  });
  let disabledRanges = [
    [now, now.add({ days: 5 })],
    [now.add({ days: 15 }), now.add({ days: 17 })],
    [now.add({ days: 23 }), now.add({ days: 24 })]
  ];
  let isInvalid = range.end.compare(range.start) > 7;

  return (
    <RangeCalendar
      {...props}
      aria-label="Trip dates"
      value={range}
      onChange={setRange}
      
      minValue={today(getLocalTimeZone())}
      isDateUnavailable={(date, anchorDate) => (
        (anchorDate && Math.abs(date.compare(anchorDate)) > 7) ||
        disabledRanges.some((interval) =>
          date.compare(interval[0]) >= 0 && date.compare(interval[1]) <= 0
        )
      )}
      isInvalid={isInvalid}
      errorMessage={isInvalid ? 'Maximum stay duration is 1 week' : undefined} />
  );
}
```

## Display options

Set the `visibleDuration` prop and render multiple `CalendarGrid` elements to display more than one month at a time. The `pageBehavior` prop controls whether pagination advances by a single month or multiple. The `firstDayOfWeek` and `weeksInMonth` props override the locale-specified defaults.

```tsx
import {RangeCalendar} from 'vanilla-starter/RangeCalendar';

// TODO: move this into the starter example.
function Example(props) {
  return (
    <RangeCalendar
      {...props}
      aria-label="Trip dates"
      
    />
  );
}
```

## Controlling the focused date

Use the `focusedValue` or `defaultFocusedValue` prop to control which date is focused. This controls which month is visible. The `onFocusChange` event is called when a date is focused by the user.

```tsx
import {RangeCalendar} from 'vanilla-starter/RangeCalendar';
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
      
      <RangeCalendar
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
import {RangeCalendar, CalendarMonthPicker, CalendarYearPicker} from 'react-aria-components/RangeCalendar';
import {CalendarGrid, CalendarCell} from 'vanilla-starter/RangeCalendar';
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

### RangeCalendar

## API (part 2)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `allowsNonContiguousRanges` | `boolean | undefined` | — | When combined with `isDateUnavailable`, determines whether non-contiguous ranges, i.e. ranges containing unavailable dates, may be selected. |
| `aria-describedby` | `string | undefined` | — | Identifies the element (or elements) that describes the object. |
| `aria-details` | `string | undefined` | — | Identifies the element (or elements) that provide a detailed, extended description for the object. |
| `aria-label` | `string | undefined` | — | Defines a string value that labels the current element. |
| `aria-labelledby` | `string | undefined` | — | Identifies the element (or elements) that labels the current element. |
| `autoFocus` | `boolean | undefined` | false | Whether to automatically focus the calendar when it mounts. |
| `commitBehavior` | `"clear" | "reset" | "select" | undefined` | 'select' | Controls the behavior when a pointer is released outside the calendar or a blur occurs mid selection: - `clear`: clear the currently selected range of dates. - `reset`: reset the selection to the previously selected range of dates. - `select`: select the currently hovered range of dates. |
| `createCalendar` | `((identifier: CalendarIdentifier) => Calendar) | undefined` | — | A function to create a new [Calendar](https://react-spectrum.adobe.com/internationalized/date/Calendar.html) object for a given calendar identifier. If not provided, the `createCalendar` function from `@internationalized/date` will be used. |
| `defaultFocusedValue` | `DateValue | null | undefined` | — | The date that is focused when the calendar first mounts (uncontrolled). |
| `defaultValue` | `RangeValue | null | undefined` | — | The default value (uncontrolled). |
| `errorMessage` | `ReactNode` | — | The error message to display when the calendar is invalid. |
| `firstDayOfWeek` | `"fri" | "mon" | "sat" | "sun" | "thu" | "tue" | "wed" | undefined` | — | The day that starts the week. |
| `focusedValue` | `DateValue | null | undefined` | — | Controls the currently focused date within the calendar. |
| `id` | `string | undefined` | — | The element's unique identifier. See [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id). |
| `isDateUnavailable` | `((date: DateValue, anchorDate: CalendarDate | null) => boolean) | undefined` | — | Callback that is called for each date of the calendar. If it returns true, then the date is unavailable. The second argument provides the current selection anchor date, if any. This can be used to adjust the available dates based on the user's first selected date. |
| `isDisabled` | `boolean | undefined` | false | Whether the calendar is disabled. |
| `isInvalid` | `boolean | undefined` | — | Whether the current selection is invalid according to application logic. |
| `isReadOnly` | `boolean | undefined` | false | Whether the calendar value is immutable. |
| `maxValue` | `DateValue | null | undefined` | — | The maximum allowed date that a user may select. |
| `minValue` | `DateValue | null | undefined` | — | The minimum allowed date that a user may select. |
| `onChange` | `((value: RangeValue) => void) | undefined` | — | Handler that is called when the value changes. |
| `onFocusChange` | `((date: CalendarDate) => void) | undefined` | — | Handler that is called when the focused date changes. |
| `pageBehavior` | `PageBehavior | undefined` | visible | Controls the behavior of paging. Pagination either works by advancing the visible page by visibleDuration (default) or one unit of visibleDuration. |
| `selectionAlignment` | `"center" | "end" | "start" | undefined` | 'center' | Determines the alignment of the visible months on initial render based on the current selection or current date if there is no selection. |
| `slot` | `string | null | undefined` | — | A slot name for the component. Slots allow the component to receive props from a parent component. An explicit `null` value indicates that the local props completely override all props received from a parent. |
| `styles` | `StylesProp | undefined` | — | Spectrum-defined styles, returned by the `style()` macro. |
| `UNSAFE_className` | `UnsafeClassName | undefined` | — | Sets the CSS [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className) for the element. Only use as a **last resort**. Use the `style` macro via the `styles` prop instead. |
| `UNSAFE_style` | `CSSProperties | undefined` | — | Sets inline [style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style) for the element. Only use as a **last resort**. Use the `style` macro via the `styles` prop instead. |

## API (part 3)

| `value` | `RangeValue | null | undefined` | — | The current value (controlled). |
| `visibleMonths` | `number | undefined` | 1 | The number of months to display at once. |

