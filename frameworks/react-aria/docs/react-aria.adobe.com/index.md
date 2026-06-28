# index

## Introduction

<RouterWrapperServer currentPage={props.currentPage}>
  <Provider
    elementType="html"
    locale="en"
    UNSAFE_className="home font-spectrum"
  >
    <head>
      <meta charSet="utf-8"/>

      <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
      />

      <link
        rel="icon"
        href={reactAriaFavicon}
      />

      <title>React Aria</title>

      <meta
        rel="preload"
        as="font"
        href="https://use.typekit.net/af/ca4cba/0000000000000000775c55a1/31/l?primer=f592e0a4b9356877842506ce344308576437e4f677d7c9b78ca2162e6cad991a&fvd=n1&v=3"
        crossOrigin=""
      />

      <meta
        name="description"
        content="Craft world-class accessible components with custom styles."
      />

      <meta
        name="keywords"
        content="accessibility,components,react,headless,style-free"
      />

      <meta
        name="twitter:card"
        content="summary_large_image"
      />

      <meta
        name="twitter:image"
        content={ogImage}
      />

      <meta
        property="og:title"
        content="React Aria"
      />

      <meta
        property="og:type"
        content="website"
      />

      <meta
        property="og:url"
        content={getCurrentPage(props.currentPage).url}
      />

      <meta
        property="og:image"
        content={ogImage}
      />

      <meta
        property="og:description"
        content="Craft world-class accessible components with custom styles."
      />

      <meta
        property="og:locale"
        content="en_US"
      />

      <link
        rel="canonical"
        href={getCurrentPage(props.currentPage).url}
      />

      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{__html: JSON.stringify(
                {
                  '@context': 'http://schema.org',
                  '@type': 'WebPage',
                  author: 'Adobe Inc',
                  name: 'React Aria',
                  description: 'Craft world-class accessible components with custom styles.',
                  image: ogImage,
                  publisher: {
                    '@type': 'Organization',
                    url: 'https://www.adobe.com',
                    name: 'Adobe',
                    logo: 'https://www.adobe.com/favicon.ico'
                  }
                }
              )}}
      />
    </head>

    <body
      className="m-0"
      style={{'--s2-container-bg': 'light-dark(white, black)'}}
    >
      
        <header className="relative header-background isolate pt-20 md:pt-32">

## Introduction (part 2)

<section className="p-4 md:p-6 box-border overflow-clip bg-white dark:bg-zinc-800/80 dark:backdrop-saturate-200 card-shadow w-fit max-w-[calc(100%-40px)] mx-auto rounded-xl flex items-center flex-col xl:flex-row gap-8">
            <div>
              <h2 className="text-3xl md:text-4xl my-0 text-balance">Meet our new docs!</h2>
              <p className="mt-4 mb-0 md:mb-4 text-balance text-lg md:text-xl max-w-xl text-slate-700 dark:text-slate-400">All-new content and search experience. Interactive CSS and Tailwind examples to get you started quickly – just install with shadcn. New guides and full example apps. MCP server and AI integrations.</p>
              <LearnMoreLink href="getting-started" className="text-indigo-600 dark:text-indigo-400 hover:bg-indigo-400/[15%] mt-3 mb-0">Check it out
            </div>

            <div className="flex-1">
              <div className="w-fit -m-2 md:m-0 rounded-lg overflow-clip justify-self-end outline outline-0 outline-blue-600 dark:outline-blue-500 has-focus-visible:outline-2">
                <Video
                  src={videoUrl}
                  muted
                  autoPlay
                  loop
                  preload="metadata"
                  playsInline
                  aria-label="Video of docs features"
                  className="block w-full max-w-xl xl:w-auto xl:h-[250px] bg-neutral-200 dark:bg-neutral-800 flex items-center justify-center outline-none"
                  style={{aspectRatio: '16/9'}}
                />
              </div>
            </div>
          </section>

          <section className="max-w-6xl mx-auto pt-24 px-4 sm:px-8 md:px-20 pb-48 sm:pb-60">
            <h1 className="text-3xl md:text-5xl lg:text-6xl font-semibold m-0 mb-4 text-center [text-wrap:balance] [filter:drop-shadow(0_0_0.25em_var(--page-bg))] dark:filter-none">Craft world-class accessible components with custom styles.</h1>
            <p className="m-0 text-slate-800 dark:text-slate-300 text-center text-lg md:text-2xl max-w-3xl mx-auto [text-wrap:balance]">Over 50 components with built-in behavior, adaptive interactions, top-tier accessibility, and internationalization out of the box, ready for your styles.</p>

            <div className="flex flex-col md:flex-row items-center gap-4 my-10 justify-center">
              [Get started](getting-started.md)

              <SearchMenuWrapperServer currentPage={props.currentPage}>
                <S2Button size="XL" staticColor="auto" variant="secondary">Explore Components</S2Button>
              
            </div>

            <div className="relative pt-10 md:pt-20 md:mt-20">
              <Window
                toolbar={https://your-app.com}
                className="h-[450px] max-w-[600px] mx-auto"
              >
                <div className="flex-1 overflow-auto bg-white dark:bg-zinc-800/90 backdrop-blur-2xl backdrop-saturate-200">
                  
                </div>

## Introduction (part 3)

<svg
                viewBox="0 0 832 450"
                width={832}
                className="absolute top-0 left-[50%] -translate-x-[50%] z-20 pointer-events-none [filter:drop-shadow(0_0_3px_white)] dark:filter-none hidden md:block"
              >
                <defs>
                  <marker
                    id="arrow"
                    viewBox="0 0 6 6"
                    refX={3}
                    refY={3}
                    markerWidth={6}
                    markerHeight={6}
                    orient="auto-start-reverse"
                    className="fill-slate-500 dark:fill-white"
                  >
                    <circle
                      r={3}
                      cx={3}
                      cy={3}
                    />
                  </marker>
                </defs>

                <Arrow href="Popover" points="310,50 310,132 383,132 383,142" textX={290} y={41}>Popover
                <Arrow href="Tooltip" points="522,50 522,132 427,132 427,142" textX={504} y={41}>Tooltip

                <g transform="translate(0 80)">
                  <Arrow href="SearchField" textX={28} x1={88} x2={132} y={80}>SearchField
                  <Arrow href="Table" textX={58} x1={88} x2={132} y={170}>Table
                  <Arrow href="Modal" textX={748} x1={700} x2={742} y={80} marker="markerStart">Modal
                </g>

                <g
                  transform="translate(0 80)"
                  id="hideOnScroll"
                  className="transition duration-300"
                >
                  <Arrow href="Checkbox" textX={36} x1={88} x2={142} y={294}>Checkbox
                  <Arrow href="ToggleButton" textX={20} x1={88} x2={180} y={362}>ToggleButton
                  <Arrow href="Menu" textX={748} x1={690} x2={744} y={180} marker="markerStart">Menu
                </g>
              </svg>

              <div className="max-w-[600px] mx-auto">
                <a href="examples/crud" target="_blank" className="flex items-center gap-1 w-fit mt-4 ms-auto text-sm text-gray-900 dark:text-white hover:bg-black/10 hover:dark:bg-white/10 group no-underline rounded-full px-3 -me-3 py-1 transition focus-ring active:scale-95">View example source<ArrowRight aria-hidden className="inline w-4 h-4 will-change-transform group-hover:translate-x-0.5 transition"/></a>
              </div>
            </div>
          </section>
        </header>

        <main className="max-w-6xl mx-auto">
          <Section className="pink-gradient-background">
            <h2>Bring your own <span className="bg-clip-text bg-linear-to-t from-fuchsia-600 to-pink-600">styles</span>.</h2>
            <p className="m-0">React Aria is style-free out of the box, allowing you to build custom designs to fit your application or design system using any styling and animation solution. Each component is broken down into individual parts with built-in states, render props, and slots that make styling a breeze.</p>

            <LearnMoreLink
              href="styling"
              className="text-fuchsia-600 dark:text-fuchsia-500 hover:bg-fuchsia-400/[15%]"
            />

## Introduction (part 4)

```tsx
              
                Date Planted
                
                  
                    {segment => <DateSegment segment={segment} />}
                  
                  
                
                
                  
                    
                      <Button slot="previous">
                      
                      <Button slot="next">
                      
                        {date => <CalendarCell date={date} />}
                      
                    
                  
                
              
              ```

              ```css
              /* Consistent default classes for each component */
              .react-aria-DatePicker {
                /* ... */

                .react-aria-Group {
                  border: 2px solid var(--gray-300);
                }
              }

              .react-aria-CalendarCell {
                color: var(--gray-900);

                /* Style interactive states with data attributes */
                &[data-pressed] {
                  background: var(--gray-100);
                }

                &[data-selected] {
                  color: var(--gray-50);
                  background: var(--blue-600);
                }
              }
              ```

              ```tsx
              <ComboBox className="group flex ...">
                Assignee
                {/* Tailwind plugin for all UI states. */}
                <Group className="... focus-visible:outline-blue-600">
                  <Input className="flex-1 ..." />
                  <Button className="... pressed:bg-gray-100">
                    
                  
                
                {/* Built-in entry and exit animation states. */}
                <Popover className="w-(--trigger-width) ... entering:animate-in entering:fade-in exiting:animate-out exiting:fade-out">
                  <ListBox items={people}>
                    {item => (
                      <ListBoxItem textValue={item.name} className="group text-gray-900 ... focus:bg-blue-600 focus:text-white">
                        {/* Use render props to customize children based on state. */}
                        {({ isSelected }) => <>
                          <img alt="" src={item.avatar} />
                          <span className="... font-normal group-selected:font-semibold">{item.name}</span>
                          {isSelected &&
                            
                          }
                        </>}
                      
                    )}
                  
                
              
              ```

              ```tsx
              const StyledSlider = styled(Slider)`
                display: grid;
                /* ... */
              `;

              const StyledSliderTrack = styled(SliderTrack)`
                background: var(--gray-300);
              `;

              const StyledSliderThumb = styled(SliderThumb)`
                width: 24px;
                height: 24px;
                border-radius: 50%;
                background: var(--gray-50);
                border: 2px solid var(--gray-600);

## Introduction (part 5)

&[data-dragging] {
                  background: var(--gray-600);
                }
              `;

              <StyledSlider defaultValue={30}>
                Opacity
                
                
                  
                
              
              ```

              ```tsx
              import {Button} from 'react-aria-components/Button';
              import {styled} from '../styled-system/jsx';

              const StyledButton = styled(Button, {
                base: {
                  /* ... */
                },
                variants: {
                  variant: {
                    primary: {
                      background: 'blue.600',
                      '&[data-pressed]': {
                        background: 'blue.700',
                      }
                    },
                    secondary: {
                      background: 'gray.300',
                      '&[data-pressed]': {
                        background: 'gray.400',
                      }
                    }
                  }
                }
              });

              <StyledButton variant="primary">
                Initiate launch sequence…
              
              ```
            
          

          <Section className="red-gradient-background">
            <h2><span className="bg-clip-text bg-linear-to-b from-pink-600 to-rose-600">Advanced features</span> for ambitious apps.</h2>
            <p className="m-0">Make your web app feel native with rich interactions that adapt to the device, platform, and user. React Aria supports advanced features like accessible drag and drop, keyboard multi-selection, built-in form validation, table column resizing, and a ton more.</p>

            <LearnMoreLink
              href="dnd"
              className="text-rose-700 dark:text-rose-500 hover:bg-rose-400/[15%]"
            />

            

            <a href="examples/kanban" target="_blank" className="flex items-center gap-1 w-fit ms-auto text-sm text-gray-900 dark:text-white hover:bg-black/10 hover:dark:bg-white/10 group no-underline rounded-full px-3 -me-3 py-1 transition focus-ring active:scale-95">View example source<ArrowRight aria-hidden className="inline w-4 h-4 will-change-transform group-hover:translate-x-0.5 transition"/></a>
          

          <Section className="cyan-gradient-background">
            <h2>High quality <span className="bg-clip-text bg-linear-to-t from-cyan-600 to-green-600">interactions</span> on all devices.</h2>
            <p className="m-0">React Aria ensures a great experience for users, no matter their device. All components are optimized for mouse, touch, keyboard, and screen reader interactions, with a meticulous attention to detail that makes your app feel responsive and natural on every platform.</p>

            <LearnMoreLink
              href="quality#interactions"
              className="text-cyan-700 dark:text-cyan-600 hover:bg-cyan-400/[15%]"
            />

## Introduction (part 6)

<PaginatedCarousel
              className="grid gap-4 md:gap-6 grid-cols-[repeat(4,100%)] md:grid-cols-2 md:grid-rows-2 -mx-8 md:mx-0 px-8 md:px-0 py-4 md:py-0 overflow-auto md:overflow-visible snap-x snap-mandatory no-scrollbar"
              paginationClassName="md:hidden"
            >
              
                Touch optimized.
                Micro-interactions like dragging off to cancel a press, long pressing to select, preventing text selection on interactive elements, scroll locking, and multi-touch handling make your app feel native.

                <div className="flex-1 flex items-center justify-center -mb-6 will-change-transform">
                  
                </div>
              

              
                Mouse enhanced.
                Hover interactions only apply when using a mouse – no sticky touch hover states. Mouse features like double click, scroll wheel, tooltips, and cursor feedback enhance your app on desktop.

                <div className="flex-1 flex items-center justify-center will-change-transform">
                  
                </div>
              

              
                Keyboard friendly.
                Keyboard interactions are first-class, including arrow key navigation, typeahead, multiple selection modifiers,  landmark navigation, and much more.

                <div className="mt-8 flex gap-2 sm:gap-4 items-center">
                  

                  
                </div>
              

              <Card className="[&>:last-child]:flex-1">
                Focus managed.
                Focus is automatically contained within overlays, restored on close, and moved when list items are deleted. Focus rings appear only when using the keyboard to help users navigate.

                
              
            
          

          <Section className="blue-gradient-background">
            <h2><span className="bg-clip-text bg-linear-to-b from-sky-500 to-indigo-600">Accessibility</span> that's truly first-class.</h2>
            <p className="m-0">React Aria is designed with accessibility as a top priority, and battle tested in production applications. All components are built to work across a wide variety of devices and assistive technologies to ensure the best experience possible for all users.</p>

            <LearnMoreLink
              href="quality#accessibility"
              className="text-blue-600 dark:text-blue-500 hover:bg-blue-400/[15%]"
            />

            <div className="grid gap-y-6 gap-x-20 md:grid-cols-[min-content_auto] md:grid-flow-col place-items-center">
              <div className="w-full max-w-xs md:w-auto md:max-w-none md:row-span-3 md:h-full aspect-1/2 iphone-frame md:order-4">
                <div className="w-full h-full bg-white dark:bg-zinc-900 box-border p-[8%] pb-[11%] iphone-mask *:h-full">
                  <A11y/>
                </div>
              </div>

## Introduction (part 7)

<Card className="md:w-80">
                ARIA Semantics.
                Components implement semantics and keyboard behavior according to the W3C <a href="https://www.w3.org/WAI/ARIA/apg/" target="_blank">ARIA Authoring Practices Guide</a>. React Aria builds on this foundation with real-world testing and device support.
              

              <Card className="md:w-80">
                Mobile ready.
                All behaviors work without a keyboard, ensuring touch screen reader users have full access. Additional features such as hidden dismiss buttons in dialogs enable a great experience for mobile users.
              

              <Card className="md:w-80">
                Tested. Like, really.
                All components are extensively tested using many popular screen readers and devices. React Aria normalizes differing behavior between browsers and assistive technologies to ensure all users have equal access.
              
            </div>
          

          <Section className="orange-gradient-background">
            <h2>Ready for an <span className="bg-clip-text bg-linear-to-b from-yellow-500 to-orange-600">international</span> audience.</h2>
            <p className="m-0">React Aria is engineered for internationalization out of the box, including translations in over 30 languages, localized date and number formatting and parsing, support for 13 calendar systems, 5 numbering systems, right-to-left layout, and more.</p>

            <LearnMoreLink
              href="quality#internationalization"
              className="text-orange-700 dark:text-orange-600 hover:bg-orange-400/[15%]"
            />

            <I18n/>
          

          <Section className="green-gradient-background">
            <h2><span className="bg-clip-text bg-linear-to-b from-lime-600 to-green-600">Customizable</span> to the max.</h2>
            <p className="m-0">React Aria offers a flexible and scalable API that lets you dive as deep into the details as you like. Start with high-level components with a built-in DOM structure and simple styling API, compose custom patterns with contexts, and for the ultimate control, drop down to the low-level Hook-based API. Mix and match as needed.</p>

            <LearnMoreLink
              href="customization"
              className="text-green-700 dark:text-green-600 hover:bg-green-400/[15%]"
            />

            <PaginatedCarousel
              className="grid gap-4 md:gap-6 grid-cols-[repeat(4,100%)] lg:grid-cols-2 lg:auto-rows-[1rem] -mx-8 px-8 lg:px-12 lg:-mx-12 py-4 overflow-auto snap-x snap-mandatory no-scrollbar edge-mask"
              paginationClassName="max-w-3xl lg:hidden"
            >
              <Card className="lg:row-end-[span_13]">
                Reuse styles.
                React Aria's API is designed around composition, enabling you to share common components between patterns, or even use them standalone. No need to duplicate styling code.

## Introduction (part 8)

<Scrollable className="relative flex-1 -mx-6 -mb-6 mt-6 [&_pre]:m-0 [&_.source]:px-6 [&_.source]:text-[15px] [&_.source]:leading-snug lg:[&_.source]:text-sm isolate rounded-b-2xl">
                  <div className="highlight-tags [--delay:2.5s] h-full *:h-full cross-fade [--fade-from:1] [--fade-to:0]">
                    <div className="hidden md:contents">
                      ```tsx
                      
                        Permissions
                        
                          
                          <span>▼</span>
                        
                        
                          
                            Read Only
                            Edit
                            Admin
                          
                        
                      
                      ```
                    </div>

                    <div className="contents md:hidden">
                      ```tsx
                      
                        
                          Permissions
                        
                        
                          
                          <span>▼</span>
                        
                        
                          
                            
                              Read Only
                            
                            
                              Edit
                            
                            
                              Admin
                            
                          
                        
                      
                      ```
                    </div>
                  </div>

                  <div className="absolute top-0 left-0 highlight-tags cross-fade">
                    <div className="hidden md:contents">
                      ```tsx
                      
                        Permissions
                        
                          
                          ▼
                        
                        
                          
                            Read Only
                            Edit
                            Admin
                          
                        
                      
                      ```
                    </div>

                    <div className="contents md:hidden">
                      ```tsx
                      
                        
                          Permissions
                        
                        
                          
                          ▼
                        
                        
                          
                            
                              Read Only
                            
                            
                              Edit
                            
                            
                              Admin
                            
                          
                        
                      
                      ```
                    </div>
                  </div>

## Introduction (part 9)

<Card className="lg:row-end-[span_17]">
                Build custom patterns.
                Use the exported contexts for each component to build your own custom patterns with compositional APIs just like React Aria's built-in components.

                <Scrollable className="flex-1 -mx-6 -mb-6 mt-6 *:h-full [&_pre]:m-0 [&_.source]:pl-6 lg:[&_.source]:text-[13px] rounded-b-2xl">
                  ```tsx
                  // A Stepper component with customizable buttons.
                  function Stepper({children}) {
                    let [value, setValue] = useState(0);

                    return (
                      <ButtonContext.Provider value={{
                        slots: {
                          decrement: {onPress: () => setValue(value - 1)},
                          increment: {onPress: () => setValue(value + 1)}
                        }
                      }}>
                        <TextContext.Provider value={{children: value}}>
                          {children}
                        </TextContext.Provider>
                      </ButtonContext.Provider>
                    );
                  }

                  
                    <Button slot="decrement">-
                    
                    <Button slot="increment">+
                  
                  ```
                
              

              <Card className="lg:row-end-[span_22]">
                Customize component parts.
                React Aria's contexts let you extend components with new features, or even replace individual parts with totally custom implementations.

                <Scrollable className="flex-1 -mx-6 -mb-6 mt-6 max-h-[30rem] lg:max-h-none [--code-padding:--spacing(6)] [&_pre]:m-0 [&_.source]:px-6 lg:[&_.source]:text-[13px] code-mask rounded-b-2xl">
                  ```tsx
                  // Add a clear button to a DatePicker.
                  function DatePickerClearButton() {
                    let state = useContext(DatePickerStateContext);

                    return (
                      <Button
                        slot={null}
                        aria-label="Clear"
                        onPress={() => state.setValue(null)}>
                        ✕
                      
                    );
                  }

                  
                    Date
                    
                      
                        {segment => <DateSegment segment={segment} />}
                      
                      
                      ▼
                    
                    
                      
                        
                          <header>
                            <Button slot="previous">◀
                            
                            <Button slot="next">▶
                          </header>
                          
                            {date => <CalendarCell date={date} />}
                          
                        
                      
                    
                  
                  ```

## Introduction (part 10)

<Card className="lg:row-end-[span_18]">
                Get complete control with hooks.
                Drop down to the low-level Hook-based API to intercept events, override behavior, customize DOM elements, and much more. Mix and match components and hooks as needed.

                <Scrollable className="flex-1 -mx-6 -mb-6 mt-6 *:h-full [--code-padding:--spacing(6)] [&_pre]:m-0 [&_.source]:px-6 lg:[&_.source]:text-[13px] rounded-b-2xl">
                  ```tsx
                  import {useCalendarGrid} from 'react-aria/useCalendar';

                  // Custom calendar that displays one week at a time.
                  function WeekCalendarGrid(props) {
                    let state = useContext(CalendarStateContext);
                    let {gridProps} = useCalendarGrid(props, state);

                    return (
                      <table {...gridProps}>
                        <tbody>
                          <tr>
                            {state.getDatesInWeek(0).map((date, i) =>
                              <CalendarCell key={i} date={date} />
                            )}
                          </tr>
                        </tbody>
                      </table>
                    );
                  }

                  <Calendar visibleDuration={{weeks: 1}}>
                    <Button slot="previous">◀
                    
                    <Button slot="next">▶
                  
                  ```
                
              
            
          

          <section className="max-w-6xl mx-auto px-8 md:px-20 pb-20">
            <h2 className="pb-8">Ready to get started?</h2>

            <div className="grid md:grid-cols-3 gap-6">
              <a
                href="getting-started"
                className="no-underline card-shadow bg-white dark:bg-zinc-800 rounded-xl p-6 transition duration-300 card-shadow-hover hover:scale-[101%]"
              >
                Install and Setup <ArrowRight aria-hidden className="inline w-5 h-5 mb-1 align-middle"/>
                Learn how to install and setup React Aria in your project, and build and style a component.
              </a>

              <SearchMenuWrapperServer currentPage={props.currentPage}>
                <SearchMenuButton className="font-[inherit] block text-start no-underline card-shadow border-0 bg-white dark:bg-zinc-800 rounded-xl p-6 transition duration-300 card-shadow-hover hover:scale-[101%] cursor-pointer">
                  View Components <ArrowRight aria-hidden className="inline w-5 h-5 mb-1 align-middle"/>
                  See an overview of all of the components and hooks offered by React Aria.

## Introduction (part 11)

<a
                href="examples/"
                className="no-underline card-shadow bg-white dark:bg-zinc-800 rounded-xl p-6 transition duration-300 card-shadow-hover hover:scale-[101%]"
              >
                Explore Examples <ArrowRight aria-hidden className="inline w-5 h-5 mb-1 align-middle"/>
                Check out some fully styled examples showing what is possible with React Aria.
              </a>
            </div>
          </section>
        </main>

        <footer className="max-w-6xl mx-auto text-[11px] box-border px-8 md:px-20 py-4">
          <hr className="border-0 border-b border-gray-300 dark:border-zinc-700 m-0 mb-2"/>

          <ul className="flex flex-wrap gap-1 lg:justify-end text-zinc-500 dark:text-zinc-400 list-none">
            <li>Copyright © {new Date().getFullYear()} Adobe. All rights reserved.</li>
            <li><a href="//www.adobe.com/privacy.html" target="_blank" className="underline text-zinc-500 dark:text-zinc-400">Privacy</a><span className="ml-1">/</span></li>
            <li><a href="//www.adobe.com/legal/terms.html" target="_blank" className="underline text-zinc-500 dark:text-zinc-400">Terms of Use</a><span className="ml-1">/</span></li>
            <li><a href="//www.adobe.com/privacy/cookies.html" target="_blank" className="underline text-zinc-500 dark:text-zinc-400">Cookies</a><span className="ml-1">/</span></li>
            <li><a href="//www.adobe.com/privacy/ca-rights.html" target="_blank" className="underline text-zinc-500 dark:text-zinc-400">Do not sell my personal information</a></li>
          </ul>
        </footer>
      
    </body>

