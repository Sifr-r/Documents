# Svelte

Svelte is a compiler-based JavaScript framework that shifts work from runtime to build time, resulting in smaller bundles and faster performance. Svelte 5 introduces runes for fine-grained reactivity.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Reactivity, props, control flow, events, stores, and transitions |

## Quick Reference

### Component Structure (Svelte 4)

```svelte
<script>
  let count = 0;
  
  $: doubled = count * 2;
</script>

<button on:click={() => count++}>
  Clicks: {count} (doubled: {doubled})
</button>

<style>
  button {
    padding: 10px;
  }
</style>
```

### Reactive Declarations (Svelte 4)

```svelte
<script>
  let count = 0;
  
  // Reactive declaration
  $: doubled = count * 2;
  
  // Reactive statement
  $: {
    console.log('Count is:', count);
    if (count > 10) {
      alert('Too high!');
    }
  }
</script>
```

### Svelte 5 Runes

```svelte
<script>
  let count = $state(0);
  let doubled = $derived(count * 2);
  
  $effect(() => {
    console.log('Count is:', count);
  });
</script>

<button onclick={() => count++}>
  Clicks: {count} (doubled: {doubled})
</button>
```

### Props (Svelte 4)

```svelte
<script>
  export let name = 'World';
  export let count;
</script>

<h1>Hello {name}!</h1>
<p>Count: {count}</p>
```

### Props (Svelte 5)

```svelte
<script>
  let { name = 'World', count } = $props();
</script>

<h1>Hello {name}!</h1>
<p>Count: {count}</p>
```

### Control Flow

```svelte
{#if user}
  <p>Welcome, {user.name}</p>
{:else}
  <p>Please log in</p>
{/if}

{#each items as item, index}
  <li>{index}: {item.name}</li>
{/each}

{#await promise}
  <p>Loading...</p>
{:then data}
  <p>{data}</p>
{:catch error}
  <p>Error: {error}</p>
{/await}
```

### Stores

```svelte
<script>
  import { writable } from 'svelte/store';
  
  const count = writable(0);
  
  count.subscribe(value => {
    console.log('Count:', value);
  });
</script>

<button on:click={() => count.update(n => n + 1)}>
  Count: {$count}
</button>
```

### Transitions

```svelte
<script>
  import { fade, fly } from 'svelte/transition';
  let visible = true;
</script>

<button on:click={() => visible = !visible}>Toggle</button>

{#if visible}
  <div transition:fade={{ duration: 300 }}>
    Fading content
  </div>
  
  <div transition:fly={{ y: 200, duration: 500 }}>
    Flying content
  </div>
{/if}
```

### Actions

```svelte
<script>
  function tooltip(node, message) {
    const tooltip = document.createElement('div');
    tooltip.textContent = message;
    tooltip.style.position = 'absolute';
    tooltip.style.background = 'black';
    tooltip.style.color = 'white';
    tooltip.style.padding = '4px 8px';
    
    node.addEventListener('mouseenter', () => {
      document.body.appendChild(tooltip);
    });
    
    node.addEventListener('mouseleave', () => {
      tooltip.remove();
    });
    
    return {
      destroy() {
        tooltip.remove();
      }
    };
  }
</script>

<button use:tooltip={'Click me!'}>Hover me</button>
```
