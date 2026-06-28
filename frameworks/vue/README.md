# Vue

Vue 3 is a progressive JavaScript framework for building user interfaces with a focus on approachability and performance. The Composition API provides flexible logic reuse and better TypeScript support.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Reactivity, lifecycle hooks, watchers, props, slots, and directives |

## Quick Reference

### Script Setup Syntax

```vue
<script setup>
import { ref } from 'vue'

const count = ref(0)
</script>

<template>
  <button @click="count++">Count: {{ count }}</button>
</template>
```

### Reactivity

```vue
<script setup>
import { ref, reactive, computed } from 'vue'

const count = ref(0)
const state = reactive({ name: 'Vue' })
const doubled = computed(() => count.value * 2)
</script>
```

### Lifecycle Hooks

```vue
<script setup>
import { onMounted, onUnmounted } from 'vue'

onMounted(() => {
  console.log('Component mounted')
})

onUnmounted(() => {
  console.log('Component unmounted')
})
</script>
```

### Watchers

```vue
<script setup>
import { ref, watch, watchEffect } from 'vue'

const search = ref('')

watch(search, (newValue, oldValue) => {
  console.log('Search changed:', newValue)
})

watchEffect(() => {
  console.log('Current search:', search.value)
})
</script>
```

### Props and Emits

```vue
<script setup>
const props = defineProps(['title', 'count'])
const emit = defineEmits(['update', 'delete'])
</script>

<template>
  <div>{{ props.title }}</div>
  <button @click="emit('update', 1)">Update</button>
</template>
```

### Template Directives

```vue
<template>
  <div v-if="show">Visible</div>
  <div v-else>Hidden</div>
  
  <ul>
    <li v-for="item in items" :key="item.id">{{ item.name }}</li>
  </ul>
  
  <input v-model="message" />
  <button v-on:click="handleClick">Click</button>
</template>
```

### Provide/Inject

```vue
<script setup>
import { provide, ref } from 'vue'

const theme = ref('dark')
provide('theme', theme)
</script>
```

### Teleport

```vue
<template>
  <Teleport to="body">
    <div class="modal">Modal content</div>
  </Teleport>
</template>
```
