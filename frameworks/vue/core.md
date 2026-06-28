# Vue — Core

## Script Setup Syntax

```vue
<script setup>
import { ref, computed } from 'vue'
import MyComponent from './MyComponent.vue'

const count = ref(0)
const doubled = computed(() => count.value * 2)
</script>

<template>
  <p>Count: {{ count }}, Doubled: {{ doubled }}</p>
  <MyComponent />
</template>
```

## Reactivity: ref

```vue
<script setup>
import { ref } from 'vue'

const count = ref(0)
const message = ref('Hello')

// Access value with .value in script
count.value++

// In template, .value is automatic
</script>

<template>
  <p>{{ message }} - {{ count }}</p>
</template>
```

## Reactivity: reactive

```vue
<script setup>
import { reactive } from 'vue'

const state = reactive({
  count: 0,
  name: 'Vue',
  items: []
})

// Access directly, no .value needed
state.count++
state.items.push('item')
</script>
```

## Reactivity: computed

```vue
<script setup>
import { ref, computed } from 'vue'

const firstName = ref('John')
const lastName = ref('Doe')

const fullName = computed(() => {
  return `${firstName.value} ${lastName.value}`
})

// Computed with setter
const fullNameWritable = computed({
  get: () => `${firstName.value} ${lastName.value}`,
  set: (val) => {
    const [first, last] = val.split(' ')
    firstName.value = first
    lastName.value = last
  }
})
</script>
```

## Reactivity: toRef and toRefs

```vue
<script setup>
import { reactive, toRef, toRefs } from 'vue'

const state = reactive({ name: 'Vue', count: 0 })

// Single property
const nameRef = toRef(state, 'name')

// All properties
const { name, count } = toRefs(state)
</script>
```

## Lifecycle Hooks

```vue
<script setup>
import { 
  onBeforeMount,
  onMounted,
  onBeforeUpdate,
  onUpdated,
  onBeforeUnmount,
  onUnmounted
} from 'vue'

onBeforeMount(() => {
  console.log('Before mount')
})

onMounted(() => {
  console.log('Mounted - DOM is available')
})

onBeforeUpdate(() => {
  console.log('Before update')
})

onUpdated(() => {
  console.log('Updated')
})

onBeforeUnmount(() => {
  console.log('Before unmount')
})

onUnmounted(() => {
  console.log('Unmounted - cleanup here')
})
</script>
```

## Watchers: watch

```vue
<script setup>
import { ref, reactive, watch } from 'vue'

const search = ref('')
const state = reactive({ id: 1 })

// Watch single ref
watch(search, (newValue, oldValue) => {
  console.log('Search changed:', newValue)
})

// Watch reactive object
watch(state, (newState) => {
  console.log('State changed:', newState)
}, { deep: true })

// Watch multiple sources
watch([search, () => state.id], ([newSearch, newId]) => {
  console.log(newSearch, newId)
})

// Immediate execution
watch(search, callback, { immediate: true })
</script>
```

## Watchers: watchEffect

```vue
<script setup>
import { ref, watchEffect } from 'vue'

const count = ref(0)

// Automatically tracks dependencies
const stop = watchEffect(() => {
  console.log('Count is:', count.value)
})

// Stop watching
stop()
</script>
```

## Props and Emits

```vue
<script setup>
// Props with type validation
const props = defineProps({
  title: {
    type: String,
    required: true
  },
  count: {
    type: Number,
    default: 0
  }
})

// Emits with validation
const emit = defineEmits({
  update: (value) => value > 0,
  delete: null
})
</script>

<template>
  <h1>{{ title }}</h1>
  <button @click="emit('update', count + 1)">Update</button>
</template>
```

## Slots

```vue
<!-- Default slot -->
<template>
  <div class="card">
    <slot>Default content</slot>
  </div>
</template>

<!-- Named slots -->
<template>
  <header>
    <slot name="header"></slot>
  </header>
  <main>
    <slot></slot>
  </main>
  <footer>
    <slot name="footer"></slot>
  </footer>
</template>

<!-- Scoped slots -->
<template>
  <slot :item="item" :index="index"></slot>
</template>
```

### Using slots

```vue
<Card>
  <template #header>
    <h1>Header</h1>
  </template>
  
  <p>Main content</p>
  
  <template #footer="{ item, index }">
    <p>{{ item }} at {{ index }}</p>
  </template>
</Card>
```

## Template Directives

```vue
<template>
  <!-- Conditional rendering -->
  <div v-if="show">Visible</div>
  <div v-else-if="other">Other</div>
  <div v-else>Hidden</div>
  
  <!-- List rendering -->
  <ul>
    <li v-for="item in items" :key="item.id">
      {{ item.name }}
    </li>
  </ul>
  
  <!-- Two-way binding -->
  <input v-model="message" />
  
  <!-- Event binding -->
  <button v-on:click="handleClick">Click</button>
  <button @click="handleClick">Click (shorthand)</button>
  
  <!-- Attribute binding -->
  <div v-bind:class="className"></div>
  <div :class="className"></div>
  
  <!-- Dynamic component -->
  <component :is="currentComponent" />
</template>
```

## Provide/Inject

```vue
<!-- Parent component -->
<script setup>
import { provide, ref } from 'vue'

const theme = ref('dark')
const user = ref({ name: 'John' })

provide('theme', theme)
provide('user', user)
</script>

<!-- Child component -->
<script setup>
import { inject } from 'vue'

const theme = inject('theme', 'light') // with default
const user = inject('user')
</script>
```

## Teleport

```vue
<template>
  <!-- Render content outside component hierarchy -->
  <Teleport to="body">
    <div class="modal">
      <p>Modal content</p>
    </div>
  </Teleport>
  
  <!-- Teleport to specific element -->
  <Teleport to="#modal-container">
    <div>Content</div>
  </Teleport>
</template>
```

## Suspense

```vue
<template>
  <Suspense>
    <template #default>
      <AsyncComponent />
    </template>
    <template #fallback>
      <div>Loading...</div>
    </template>
  </Suspense>
</template>

<script setup>
import { defineAsyncComponent } from 'vue'

// Async component
const AsyncComponent = defineAsyncComponent(() => 
  import('./AsyncComponent.vue')
)
</script>
```

## See Also

- [Vue 3 Documentation](https://vuejs.org)
- [Composition API](https://vuejs.org/guide/extras/composition-api-faq.html)
- [Reactivity Fundamentals](https://vuejs.org/guide/essentials/reactivity-fundamentals.html)
