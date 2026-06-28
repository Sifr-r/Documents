# GraphQL — Core

## Schema Definition

```graphql
# Object types
type User {
  id: ID!
  name: String!
  email: String!
  age: Int
  isActive: Boolean!
  posts: [Post!]!
  role: Role!
}

# Enum
enum Role {
  ADMIN
  USER
  MODERATOR
}

# Input type (for mutations)
input CreateUserInput {
  name: String!
  email: String!
  role: Role = USER
}

# Union type
type SearchResults {
  results: [SearchResult!]!
}

union SearchResult = User | Post

# Interface
interface Node {
  id: ID!
}

type Comment implements Node {
  id: ID!
  body: String!
}

# Custom scalar
scalar DateTime
scalar JSON
```

## Queries

```graphql
# Basic query
query {
  user(id: "1") {
    name
    email
  }
}

# With variables
query GetUser($id: ID!) {
  user(id: $id) {
    name
    email
    posts {
      title
    }
  }
}

# Aliases (query same field multiple times)
query {
  admin: user(id: "1") { name }
  editor: user(id: "2") { name }
}

# Fragments
fragment UserBasic on User {
  id
  name
  email
}

query {
  user(id: "1") {
    ...UserBasic
    posts { title }
  }
}

# Inline fragment (for unions/interfaces)
query Search($term: String!) {
  search(term: $term) {
    ... on User {
      name
      email
    }
    ... on Post {
      title
      body
    }
  }
}

# Directives
query GetPosts($withAuthor: Boolean!) {
  posts {
    title
    author @include(if: $withAuthor) {
      name
    }
    body @skip(if: true)
  }
}
```

## Mutations

```graphql
# Create
mutation CreatePost($input: CreatePostInput!) {
  createPost(input: $input) {
    id
    title
    author { name }
  }
}

# Update
mutation UpdatePost($id: ID!, $input: UpdatePostInput!) {
  updatePost(id: $id, input: $input) {
    id
    title
  }
}

# Delete
mutation DeletePost($id: ID!) {
  deletePost(id: $id) {
    id
    deleted: __typename
  }
}

# Multiple mutations in one request (executed sequentially)
mutation {
  createPost(input: { title: "First", body: "Hello" }) { id }
  createPost(input: { title: "Second", body: "World" }) { id }
}
```

## Subscriptions

```graphql
# Schema
type Subscription {
  postCreated: Post!
  messageSent(channelId: ID!): Message!
}

# Client subscription
subscription OnPostCreated {
  postCreated {
    id
    title
    author { name }
  }
}
```

Subscriptions typically use WebSocket transport (`graphql-ws` or `graphql-transport-ws` protocol).

## Resolvers

```javascript
// Apollo Server example
const resolvers = {
  Query: {
    user: async (parent, { id }, context, info) => {
      return context.db.users.findById(id);
    },
    posts: async (parent, { first, after }, context) => {
      return context.db.posts.findMany({ take: first, cursor: after });
    },
  },

  // Field resolvers
  User: {
    posts: async (parent, args, context) => {
      return context.db.posts.findMany({
        where: { authorId: parent.id },
      });
    },
  },

  Mutation: {
    createPost: async (parent, { input }, context) => {
      if (!context.user) throw new AuthenticationError('Not authenticated');
      return context.db.posts.create({
        data: { ...input, authorId: context.user.id },
      });
    },
  },

  Subscription: {
    postCreated: {
      subscribe: (parent, args, context) => {
        return context.pubsub.asyncIterable(['POST_CREATED']);
      },
    },
  },
};
```

**Resolver arguments:**
- `parent` — result from parent resolver
- `args` — field arguments
- `context` — shared per-request state (user, db, pubsub)
- `info` — query execution info (field name, path, AST)

## Pagination

```graphql
# Cursor-based pagination (Relay-style)
type PostConnection {
  edges: [PostEdge!]!
  pageInfo: PageInfo!
  totalCount: Int!
}

type PostEdge {
  node: Post!
  cursor: String!
}

type PageInfo {
  hasNextPage: Boolean!
  hasPreviousPage: Boolean!
  startCursor: String
  endCursor: String
}

type Query {
  posts(first: Int, after: String, last: Int, before: String): PostConnection!
}
```

```graphql
# Client query
query {
  posts(first: 10, after: "cursor123") {
    edges {
      node { id title }
      cursor
    }
    pageInfo {
      hasNextPage
      endCursor
    }
  }
}
```

| Approach | Use Case |
|----------|----------|
| Cursor-based | Real-time data, infinite scroll, stable pagination |
| Offset-based (`skip`/`limit`) | Simple UIs, random page access |

## N+1 Problem and DataLoader

```javascript
import DataLoader from 'dataloader';

// Without DataLoader: N+1 queries
// 1 query for posts + N queries for authors

const userLoader = new DataLoader(async (userIds) => {
  const users = await db.users.findMany({
    where: { id: { in: [...userIds] } },
  });
  // Must return in same order as keys
  return userIds.map(id => users.find(u => u.id === id));
});

// In resolver
const resolvers = {
  Post: {
    author: (parent, args, context) => {
      return context.userLoader.load(parent.authorId);
      // Batches all loads in same tick into single query
    },
  },
};
```

## Introspection

```graphql
# Discover schema
query {
  __schema {
    types { name kind }
    queryType { name }
    mutationType { name }
  }
}

# Inspect a type
query {
  __type(name: "User") {
    name
    fields {
      name
      type { name kind ofType { name } }
    }
  }
}
```

## Common Implementations

| Library | Language | Notes |
|---------|----------|-------|
| Apollo Server | JavaScript/TypeScript | Most popular, full-featured |
| graphql-yoga | JavaScript/TypeScript | Lightweight, Envelop plugins |
| Absinthe | Elixir/Phoenix | Great for real-time |
| gqlgen | Go | Code-first, type-safe |
| Strawberry | Python | Decorator-based, modern |
| HotChocolate | C#/.NET | Full-featured, code-first |

## Federation

```graphql
# Service A: Users subgraph
type User @key(fields: "id") {
  id: ID!
  name: String!
  email: String!
}

# Service B: Posts subgraph (references User)
type User @key(fields: "id") {
  id: ID! @external
}

type Post {
  id: ID!
  title: String!
  author: User!
}
```

Federation allows splitting a schema across multiple services, with an Apollo Gateway composing them into a single graph.

## See Also

- [GraphQL Specification](https://spec.graphql.org)
- [Apollo Server Documentation](https://www.apollographql.com/docs/apollo-server/)
- [GraphQL Yoga Documentation](https://the-guild.dev/graphql/yoga-server)
- [Apollo Federation](https://www.apollographql.com/docs/federation/)
