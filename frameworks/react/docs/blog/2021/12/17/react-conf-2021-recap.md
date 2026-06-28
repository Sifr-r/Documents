# React Conf 2021 Recap

## Introduction

December 17, 2021 by [Jesslyn Tannady](https://twitter.com/jtannady) and [Rick Hanlon](https://twitter.com/rickhanlonii)

---

Last week we hosted our 6th React Conf. In previous years, we've used the React Conf stage to deliver industry changing announcements such as [_React Native_](https://engineering.fb.com/2015/03/26/android/react-native-bringing-modern-web-techniques-to-mobile/) and [_React Hooks_](https://reactjs.org/docs/hooks-intro.html). This year, we shared our multi-platform vision for React, starting with the release of React 18 and gradual adoption of concurrent features.

---

This was the first time React Conf was hosted online, and it was streamed for free, translated to 8 different languages. Participants from all over the world joined our conference Discord and the replay event for accessibility in all timezones. Over 50,000 people registered, with over 60,000 views of 19 talks, and 5,000 participants in Discord across both events.

All the talks are [available to stream online](https://www.youtube.com/watch?v=FZ0cG47msEk&list=PLNG_1j3cPCaZZ7etkzWA7JfdmKWT0pMsa).

Here’s a summary of what was shared on stage:

## React 18 and concurrent features {//}

In the keynote, we shared our vision for the future of React starting with React 18.

React 18 adds the long-awaited concurrent renderer and updates to Suspense without any major breaking changes. Apps can upgrade to React 18 and begin gradually adopting concurrent features with the amount of effort on par with any other major release.

**This means there is no concurrent mode, only concurrent features.**

In the keynote, we also shared our vision for Suspense, Server Components, new React working groups, and our long-term many-platform vision for React Native.

Watch the full keynote from [Andrew Clark](https://twitter.com/acdlite), [Juan Tejada](https://twitter.com/_jstejada), [Lauren Tan](https://twitter.com/potetotes), and [Rick Hanlon](https://twitter.com/rickhanlonii) here:

<YouTubeIframe src="https://www.youtube.com/embed/FZ0cG47msEk" />

## React 18 for Application Developers {//}

In the keynote, we also announced that the React 18 RC is available to try now. Pending further feedback, this is the exact version of React that we will publish to stable early next year.

To try the React 18 RC, upgrade your dependencies:

```bash
npm install react@rc react-dom@rc
```

and switch to the new `createRoot` API:

```js
// before
const container = document.getElementById('root');
ReactDOM.render(, container);

// after
const container = document.getElementById('root');
const root = ReactDOM.createRoot(container);
root.render();
```

For a demo of upgrading to React 18, see [Shruti Kapoor](https://twitter.com/shrutikapoor08)’s talk here:

<YouTubeIframe src="https://www.youtube.com/embed/ytudH8je5ko" />

## Streaming Server Rendering with Suspense {//}

React 18 also includes improvements to server-side rendering performance using Suspense.

Streaming server rendering lets you generate HTML from React components on the server, and stream that HTML to your users. In React 18, you can use `Suspense` to break down your app into smaller independent units which can be streamed independently of each other without blocking the rest of the app. This means users will see your content sooner and be able to start interacting with it much faster.

For a deep dive, see [Shaundai Person](https://twitter.com/shaundai)’s talk here:

<YouTubeIframe src="https://www.youtube.com/embed/pj5N-Khihgc" />

## The first React working group {//}

For React 18, we created our first Working Group to collaborate with a panel of experts, developers, library maintainers, and educators. Together we worked to create our gradual adoption strategy and refine new APIs such as `useId`, `useSyncExternalStore`, and `useInsertionEffect`.

For an overview of this work, see [Aakansha' Doshi](https://twitter.com/aakansha1216)'s talk:

<YouTubeIframe src="https://www.youtube.com/embed/qn7gRClrC9U" />

## React Developer Tooling {//}

To support the new features in this release, we also announced the newly formed React DevTools team and a new Timeline Profiler to help developers debug their React apps.

For more information and a demo of new DevTools features, see [Brian Vaughn](https://twitter.com/brian_d_vaughn)’s talk:

<YouTubeIframe src="https://www.youtube.com/embed/oxDfrke8rZg" />

## React without memo {//}

Looking further into the future, [Xuan Huang (黄玄)](https://twitter.com/Huxpro) shared an update from our React Labs research into an auto-memoizing compiler. Check out this talk for more information and a demo of the compiler prototype:

<YouTubeIframe src="https://www.youtube.com/embed/lGEMwh32soc" />

## React docs keynote {//}

[Rachel Nabors](https://twitter.com/rachelnabors) kicked off a section of talks about learning and designing with React with a keynote about our investment in React's new docs ([now shipped as react.dev](/blog/2023/03/16/introducing-react-dev)):

<YouTubeIframe src="https://www.youtube.com/embed/mneDaMYOKP8" />

