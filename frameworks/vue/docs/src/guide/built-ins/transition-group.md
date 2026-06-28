# transition-group

## Introduction

<script setup>
import ListBasic from './transition-demos/ListBasic.vue'
import ListMove from './transition-demos/ListMove.vue'
import ListStagger from './transition-demos/ListStagger.vue'
</script>

# TransitionGroup {#transitiongroup}

`` is a built-in component designed for animating the insertion, removal, and order change of elements or components that are rendered in a list.

## Differences from <Transition> {#differences-from-transition}

`` supports the same props, CSS transition classes, and JavaScript hook listeners as ``, with the following differences:

- By default, it doesn't render a wrapper element. But you can specify an element to be rendered with the `tag` prop.

- [Transition modes](./transition#transition-modes) are not available, because we are no longer alternating between mutually exclusive elements.

- Elements inside are **always required** to have a unique `key` attribute.

- CSS transition classes will be applied to individual elements in the list, **not** to the group / container itself.

:::tip
When used in [in-DOM templates](/guide/essentials/component-basics#in-dom-template-parsing-caveats), it should be referenced as `<transition-group>`.
:::

## Enter / Leave Transitions {#enter-leave-transitions}

Here is an example of applying enter / leave transitions to a `v-for` list using ``:

```vue-html
<TransitionGroup name="list" tag="ul">
  <li v-for="item in items" :key="item">
    {{ item }}
  </li>

```

```css
.list-enter-active,
.list-leave-active {
  transition: all 0.5s ease;
}
.list-enter-from,
.list-leave-to {
  opacity: 0;
  transform: translateX(30px);
}
```

## Move Transitions {#move-transitions}

The above demo has some obvious flaws: when an item is inserted or removed, its surrounding items instantly "jump" into place instead of moving smoothly. We can fix this by adding a few additional CSS rules:

```css{1,13-17}
.list-move, /* apply transition to moving elements */
.list-enter-active,
.list-leave-active {
  transition: all 0.5s ease;
}

.list-enter-from,
.list-leave-to {
  opacity: 0;
  transform: translateX(30px);
}

/* ensure leaving items are taken out of layout flow so that moving
   animations can be calculated correctly. */
.list-leave-active {
  position: absolute;
}
```

Now it looks much better - even animating smoothly when the whole list is shuffled:

[Full Example](/examples/#list-transition)

### Custom TransitionGroup classes {#custom-transitiongroup-classes}

You can also specify custom transition classes for the moving element by passing the `moveClass` prop to ``, just like [custom transition classes on ``](/guide/built-ins/transition.html#custom-transition-classes).

