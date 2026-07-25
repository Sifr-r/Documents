
## Introduction

[//]: # 'AdvancedSSRLink'
[//]: # 'AdvancedSSRLink'
[//]: # 'DependentExample'

```tsx
// Get the user
const userQuery = useQuery(() => ({
  queryKey: ['user', email],
  queryFn: getUserByEmail,
}))

const userId = () => userQuery.data?.id

// Then get the user's projects
const projectsQuery = useQuery(() => ({
  queryKey: ['projects', userId()],
  queryFn: getProjectsByUser,
  // The query will not execute until the userId exists
  enabled: !!userId(),
}))
```

[//]: # 'DependentExample'
[//]: # 'ServerComponentsNote1'
[//]: # 'ServerComponentsNote1'
[//]: # 'SuspenseSerial'
[//]: # 'SuspenseSerial'
[//]: # 'NestedIntro'

Nested Component Waterfalls is when both a parent and a child component contains queries, and the parent does not render the child until its query is done.

[//]: # 'NestedIntro'
[//]: # 'NestedExample'

```tsx
import { Switch, Match } from 'solid-js'

function Article(props) {
  const articleQuery = useQuery(() => ({
    queryKey: ['article', props.id],
    queryFn: getArticleById,
  }))

  return (
    
      <Match when={articleQuery.isPending}>
        Loading article...
      
      <Match when={articleQuery.isSuccess}>
        <ArticleHeader articleData={articleQuery.data} />
        <ArticleBody articleData={articleQuery.data} />
        <Comments id={props.id} />
      
    
  )
}

function Comments(props) {
  const commentsQuery = useQuery(() => ({
    queryKey: ['article-comments', props.id],
    queryFn: getArticleCommentsById,
  }))

  ...
}
```

[//]: # 'NestedExample'
[//]: # 'NestedHoistedExample'

```tsx
import { Switch, Match, Show } from 'solid-js'

function Article(props) {
  const articleQuery = useQuery(() => ({
    queryKey: ['article', props.id],
    queryFn: getArticleById,
  }))

  const commentsQuery = useQuery(() => ({
    queryKey: ['article-comments', props.id],
    queryFn: getArticleCommentsById,
  }))

  return (
    
      <Match when={articleQuery.isPending}>Loading article...
      <Match when={articleQuery.isSuccess}>
        <ArticleHeader articleData={articleQuery.data} />
        <ArticleBody articleData={articleQuery.data} />
        
          <Match when={commentsQuery.isPending}>Loading comments...
          <Match when={commentsQuery.isSuccess}>
            <Comments commentsData={commentsQuery.data} />
          
        
      
    
  )
}
```

[//]: # 'NestedHoistedExample'
[//]: # 'NestedHoistedOutro'

The two queries will now fetch in parallel.

[//]: # 'NestedHoistedOutro'
[//]: # 'DependentNestedExample'

```tsx
import { Switch, Match, For } from 'solid-js'

function Feed() {
  const feedQuery = useQuery(() => ({
    queryKey: ['feed'],
    queryFn: getFeed,
  }))

  return (
    
      <Match when={feedQuery.isPending}>
        Loading feed...
      
      <Match when={feedQuery.isSuccess}>
        <For each={feedQuery.data}>
          {(feedItem) => {
            if (feedItem.type === 'GRAPH') {
              return <GraphFeedItem feedItem={feedItem} />
            }
            return <StandardFeedItem feedItem={feedItem} />
          }}
        
      
    
  )
}



## Introduction (part 2)

function GraphFeedItem(props) {
  const graphQuery = useQuery(() => ({
    queryKey: ['graph', props.feedItem.id],
    queryFn: getGraphDataById,
  }))

  ...
}
```

[//]: # 'DependentNestedExample'
[//]: # 'ServerComponentsNote2'

In this example, we can't trivially flatten the waterfall by just hoisting the query to the parent, or even adding prefetching. Just like the dependent query example at the beginning of this guide, one option is to refactor our API to include the graph data in the `getFeed` query.

[//]: # 'ServerComponentsNote2'
[//]: # 'LazyExample'

```tsx
import { lazy, Switch, Match, For } from 'solid-js'

// This lazy loads the GraphFeedItem component, meaning
// it wont start loading until something renders it
const GraphFeedItem = lazy(() => import('./GraphFeedItem'))

function Feed() {
  const feedQuery = useQuery(() => ({
    queryKey: ['feed'],
    queryFn: getFeed,
  }))

  return (
    
      <Match when={feedQuery.isPending}>
        Loading feed...
      
      <Match when={feedQuery.isSuccess}>
        <For each={feedQuery.data}>
          {(feedItem) => {
            if (feedItem.type === 'GRAPH') {
              return <GraphFeedItem feedItem={feedItem} />
            }
            return <StandardFeedItem feedItem={feedItem} />
          }}
        
      
    
  )
}

// GraphFeedItem.tsx
function GraphFeedItem(props) {
  const graphQuery = useQuery(() => ({
    queryKey: ['graph', props.feedItem.id],
    queryFn: getGraphDataById,
  }))

  ...
}
```

[//]: # 'LazyExample'
[//]: # 'ServerComponentsNote3'
[//]: # 'ServerComponentsNote3'

