# Navigating

## Introduction

Users navigate your application with ``, ``, and `useNavigate`.

## NavLink

This component is for navigation links that need to render an active state.

```tsx
import { NavLink } from "react-router";

export function MyAppNav() {
  return (
    <nav>
      <NavLink to="/" end>
        Home
      
      <NavLink to="/trending" end>
        Trending Concerts
      
      <NavLink to="/concerts">All Concerts
      <NavLink to="/account">Account
    </nav>
  );
}
```

Whenever a `NavLink` is active, it will automatically have an `.active` class name for easy styling with CSS:

```css
a.active {
  color: red;
}
```

It also has callback props on `className`, `style`, and `children` with the active state for inline styling or conditional rendering:

```tsx
// className
<NavLink
  to="/messages"
  className={({ isActive }) =>
    isActive ? "text-red-500" : "text-black"
  }
>
  Messages

```

```tsx
// style
<NavLink
  to="/messages"
  style={({ isActive }) => ({
    color: isActive ? "red" : "black",
  })}
>
  Messages

```

```tsx
// children
<NavLink to="/message">
  {({ isActive }) => (
    <span className={isActive ? "active" : ""}>
      {isActive ? "👉" : ""} Tasks
    </span>
  )}

```

## Link

Use `` when the link doesn't need active styling:

```tsx
import { Link } from "react-router";

export function LoggedOutMessage() {
  return (
    <p>
      You've been logged out.{" "}
      <Link to="/login">Login again
    </p>
  );
}
```

## useNavigate

This hook allows the programmer to navigate the user to a new page without the user interacting.

For normal navigation, it's best to use `Link` or `NavLink`. They provide a better default user experience like keyboard events, accessibility labeling, "open in new window", right click context menus, etc.

Reserve usage of `useNavigate` to situations where the user is _not_ interacting but you need to navigate, for example:

- After a form submission completes
- Logging them out after inactivity
- Timed UIs like quizzes, etc.

```tsx
import { useNavigate } from "react-router";

export function LoginPage() {
  let navigate = useNavigate();

  return (
    <>
      
      <MyLoginForm
        onSuccess={() => {
          navigate("/dashboard");
        }}
      />
      
    </>
  );
}
```

---

Next: [Url values](./url-values)

