# GraphQL

GraphQL is a query language and runtime for APIs that gives clients the power to ask for exactly the data they need. It serves as an alternative to REST with a strongly-typed schema.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Schema, queries, mutations, subscriptions, resolvers, pagination, federation |

## Quick Reference

### Schema Definition

```graphql
type User {
  id: ID!
  name: String!
  email: String!
  posts: [Post!]!
}

type Post {
  id: ID!
  title: String!
  body: String!
  author: User!
}

type Query {
  user(id: ID!): User
  posts(first: Int, after: String): PostConnection!
}

type Mutation {
  createPost(input: CreatePostInput!): Post!
}

input CreatePostInput {
  title: String!
  body: String!
}
```

### Query

```graphql
query GetUser($id: ID!) {
  user(id: $id) {
    name
    email
    posts {
      title
    }
  }
}
```

### Mutation

```graphql
mutation CreatePost($input: CreatePostInput!) {
  createPost(input: $input) {
    id
    title
  }
}
```

### Fragment

```graphql
fragment UserFields on User {
  id
  name
  email
}

query {
  user(id: "1") {
    ...UserFields
  }
}
```

### Aliases

```graphql
query {
  firstUser: user(id: "1") { name }
  secondUser: user(id: "2") { name }
}
```
