
## Introduction

[//]: # 'Example'

```ts
// Get the user
userQuery = injectQuery(() => ({
  queryKey: ['user', email],
  queryFn: getUserByEmail,
}))

// Then get the user's projects
projectsQuery = injectQuery(() => ({
  queryKey: ['projects', this.userQuery.data()?.id],
  queryFn: getProjectsByUser,
  // The query will not execute until the user id exists
  enabled: !!this.userQuery.data()?.id,
}))
```

[//]: # 'Example'
[//]: # 'Example2'

```ts
// injectQueries is under development for Angular Query
```

[//]: # 'Example2'

