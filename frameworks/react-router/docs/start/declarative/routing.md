# Routing

## Configuring Routes

Routes are configured by rendering `` and `` that couple URL segments to UI elements.

```tsx
import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router";
import App from "./app";

const root = document.getElementById("root");

ReactDOM.createRoot(root).render(
  
    
      <Route path="/" element={} />
    
  ,
);
```

Here's a larger sample config:

```tsx

  <Route index element={} />
  <Route path="about" element={} />

  <Route element={}>
    <Route path="login" element={} />
    <Route path="register" element={} />
  

  <Route path="concerts">
    <Route index element={} />
    <Route path=":city" element={} />
    <Route path="trending" element={} />
  

```

## Nested Routes

Routes can be nested inside parent routes.

```tsx

  <Route path="dashboard" element={}>
    <Route index element={} />
    <Route path="settings" element={} />
  

```

The path of the parent is automatically included in the child, so this config creates both `"/dashboard"` and `"/dashboard/settings"` URLs.

Child routes are rendered through the `` in the parent route.

```tsx filename=app/dashboard.tsx
import { Outlet } from "react-router";

export default function Dashboard() {
  return (
    <div>
      <h1>Dashboard</h1>
      {/* will either be  or  */}
      
    </div>
  );
}
```

## Layout Routes

Routes _without_ a `path` create new nesting for their children, but they don't add any segments to the URL.

```tsx lines=[2,9]

  <Route element={}>
    <Route index element={} />
    <Route path="contact" element={} />
  

  <Route path="projects">
    <Route index element={} />
    <Route element={}>
      <Route path=":pid" element={} />
      <Route path=":pid/edit" element={} />
    
  

```

## Index Routes

Index routes render into their parent's `` at their parent's URL (like a default child route). They are configured with the `index` prop:

```tsx lines=[4,8]

  <Route path="/" element={}>
    {/* renders into the outlet in  at "/" */}
    <Route index element={} />

    <Route path="dashboard" element={}>
      {/* renders into the outlet in  at "/dashboard" */}
      <Route index element={} />
      <Route path="settings" element={} />
    
  

```

Note that index routes can't have children. If you're expecting that behavior, you probably want a [layout route](#layout-routes).

## Route Prefixes

A `<Route path>` _without_ an `element` prop adds a path prefix to its child routes, without introducing a parent layout.

```tsx filename=app/routes.ts lines=[1]
<Route path="projects">
  <Route index element={} />
  <Route element={}>
    <Route path=":pid" element={} />
    <Route path=":pid/edit" element={} />
  

```

## Dynamic Segments

If a path segment starts with `:` then it becomes a "dynamic segment". When the route matches the URL, the dynamic segment will be parsed from the URL and provided as `params` to other router APIs like `useParams`.

```tsx
<Route path="teams/:teamId" element={} />
```

```tsx filename=app/team.tsx
import { useParams } from "react-router";

export default function Team() {
  let params = useParams();
  // params.teamId
}
```

You can have multiple dynamic segments in one route path:

```tsx
<Route
  path="/c/:categoryId/p/:productId"
  element={}
/>
```

```tsx filename=app/category-product.tsx
import { useParams } from "react-router";

export default function CategoryProduct() {
  let { categoryId, productId } = useParams();
  // ...
}
```

You should ensure that all dynamic segments in a given path are unique. Otherwise, as the `params` object is populated - latter dynamic segment values will override earlier values.

## Optional Segments

You can make a route segment optional by adding a `?` to the end of the segment.

```tsx
<Route path=":lang?/categories" element={} />
```

You can have optional static segments, too:

```tsx
<Route path="users/:userId/edit?" element={} />
```

## Splats

Also known as "catchall" and "star" segments. If a route path pattern ends with `/*` then it will match any characters following the `/`, including other `/` characters.

```tsx
<Route path="files/*" element={} />
```

```tsx
let params = useParams();
// params["*"] will contain the remaining URL after files/
let filePath = params["*"];
```

You can destructure the `*`, you just have to assign it a new name. A common name is `splat`:

```tsx
let { "*": splat } = useParams();
```

## Linking

Link to routes from your UI with `Link` and `NavLink`

```tsx
import { NavLink, Link } from "react-router";

function Header() {
  return (
    <nav>
      {/* NavLink makes it easy to show active states */}
      <NavLink
        to="/"
        className={({ isActive }) =>
          isActive ? "active" : ""
        }
      >
        Home
      

      <Link to="/concerts/salt-lake-city">Concerts
    </nav>
  );
}
```

---

Next: [Navigating](./navigating)

