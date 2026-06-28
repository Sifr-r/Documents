# Svelte — Core

## Component Structure

```svelte
<script>
  // JavaScript logic
  let name = 'World';
  let count = 0;
</script>

<!-- Markup -->
<h1>Hello {name}!</h1>
<button on:click={() => count++}>
  Clicks: {count}
</button>

<style>
  /* Scoped styles */
  h1 {
    color: blue;
  }
</style>
```

## Reactivity: $: Declarations (Svelte 4)

```svelte
<script>
  let count = 0;
  
  // Reactive declaration
  $: doubled = count * 2;
  
  // Reactive statement
  $: {
    console.log('Count:', count);
    if (count > 10) {
      alert('Too high!');
    }
  }
  
  // Reactive expression
  $: if (count > 5) {
    console.log('High count');
  }
</script>

<p>Count: {count}, Doubled: {doubled}</p>
<button on:click={() => count++}>Increment</button>
```

## Reactivity: $state, $derived, $effect (Svelte 5 Runes)

```svelte
<script>
  // State
  let count = $state(0);
  let items = $state([1, 2, 3]);
  
  // Derived values
  let doubled = $derived(count * 2);
  let total = $derived(items.reduce((sum, n) => sum + n, 0));
  
  // Effects
  $effect(() => {
    console.log('Count changed:', count);
  });
  
  $effect(() => {
    // Runs when any dependency changes
    document.title = `Count: ${count}`;
  });
</script>

<button onclick={() => count++}>
  Count: {count} (doubled: {doubled})
</button>
```

## Props: export let (Svelte 4)

```svelte
<!-- Child.svelte -->
<script>
  export let name = 'World';
  export let count;
  
  // Reactive prop
  $: console.log('Name:', name);
</script>

<h1>Hello {name}!</h1>
<p>Count: {count}</p>

<!-- Parent.svelte -->
<script>
  import Child from './Child.svelte';
</script>

<Child name="Svelte" count={5} />
```

## Props: $props() (Svelte 5)

```svelte
<!-- Child.svelte -->
<script>
  let { name = 'World', count, children } = $props();
</script>

<h1>Hello {name}!</h1>
<p>Count: {count}</p>

<!-- Parent.svelte -->
<script>
  import Child from './Child.svelte';
</script>

<Child name="Svelte" count={5} />
```

## Control Flow: {#if}

```svelte
<script>
  let user = null;
  let role = 'admin';
</script>

{#if user}
  <p>Welcome, {user.name}</p>
{:else if role === 'admin'}
  <p>Admin access</p>
{:else}
  <p>Please log in</p>
{/if}
```

## Control Flow: {#each}

```svelte
<script>
  let items = [
    { id: 1, name: 'Apple' },
    { id: 2, name: 'Banana' },
    { id: 3, name: 'Orange' }
  ];
</script>

<ul>
  {#each items as item, index}
    <li>{index}: {item.name}</li>
  {/each}
</ul>

<!-- With keyed blocks -->
<ul>
  {#each items as item (item.id)}
    <li>{item.name}</li>
  {/each}
</ul>
```

## Control Flow: {#await}

```svelte
<script>
  let promise = fetch('/api/data').then(r => r.json());
</script>

{#await promise}
  <p>Loading...</p>
{:then data}
  <p>Data: {data}</p>
{:catch error}
  <p>Error: {error.message}</p>
{/await}
```

## Control Flow: {#snippet} (Svelte 5)

```svelte
<script>
  let { children } = $props();
</script>

{#snippet card(title)}
  <div class="card">
    <h2>{title}</h2>
    <p>{@render children()}</p>
  </div>
{/snippet}

{@render card('My Card')}
```

## Events: on:click (Svelte 4)

```svelte
<script>
  function handleClick(event) {
    console.log('Clicked:', event);
  }
  
  let count = 0;
</script>

<button on:click={handleClick}>Click me</button>
<button on:click={() => count++}>Count: {count}</button>

<!-- Event modifiers -->
<button on:click|preventDefault|stopPropagation={handleClick}>
  Modified click
</button>

<!-- Custom events -->
<script>
  import { createEventDispatcher } from 'svelte';
  
  const dispatch = createEventDispatcher();
  
  function doSomething() {
    dispatch('custom', { data: 'value' });
  }
</script>

<button on:click={doSomething}>Dispatch</button>
```

## Events: onclick (Svelte 5)

```svelte
<script>
  function handleClick(event) {
    console.log('Clicked:', event);
  }
  
  let count = $state(0);
</script>

<button onclick={handleClick}>Click me</button>
<button onclick={() => count++}>Count: {count}</button>

<!-- Event modifiers (different syntax) -->
<button onclick={(e) => { e.preventDefault(); handleClick(e); }}>
  Modified click
</button>
```

## Bindings

```svelte
<script>
  let name = '';
  let selected = 'option1';
  let checked = false;
  let element;
</script>

<!-- Text input -->
<input bind:value={name} />
<p>Hello {name}</p>

<!-- Select -->
<select bind:value={selected}>
  <option value="option1">Option 1</option>
  <option value="option2">Option 2</option>
</select>

<!-- Checkbox -->
<input type="checkbox" bind:checked={checked} />

<!-- Element binding -->
<div bind:this={element}>Content</div>

<!-- Component binding -->
<script>
  import Child from './Child.svelte';
  let childValue;
</script>

<Child bind:value={childValue} />
```

## Stores: writable

```svelte
<script>
  import { writable } from 'svelte/store';
  
  const count = writable(0);
  
  // Subscribe
  const unsubscribe = count.subscribe(value => {
    console.log('Count:', value);
  });
  
  // Update
  count.set(5);
  count.update(n => n + 1);
  
  // Auto-subscribe with $
  $: console.log('Auto:', $count);
</script>

<button on:click={() => count.update(n => n + 1)}>
  Count: {$count}
</button>
```

## Stores: readable

```svelte
<script>
  import { readable } from 'svelte/store';
  
  const time = readable(new Date(), (set) => {
    const interval = setInterval(() => {
      set(new Date());
    }, 1000);
    
    return () => clearInterval(interval);
  });
</script>

<p>Time: {$time}</p>
```

## Stores: derived

```svelte
<script>
  import { writable, derived } from 'svelte/store';
  
  const count = writable(0);
  const doubled = derived(count, $count => $count * 2);
  
  const firstName = writable('John');
  const lastName = writable('Doe');
  const fullName = derived(
    [firstName, lastName],
    ([$firstName, $lastName]) => `${$firstName} ${$lastName}`
  );
</script>

<p>Count: {$count}, Doubled: {$doubled}</p>
<p>Name: {$fullName}</p>
```

## Transitions and Animations

```svelte
<script>
  import { fade, fly, slide, scale } from 'svelte/transition';
  import { quintOut } from 'svelte/easing';
  
  let visible = true;
</script>

<button on:click={() => visible = !visible}>Toggle</button>

{#if visible}
  <div transition:fade={{ duration: 300 }}>
    Fade transition
  </div>
  
  <div transition:fly={{ y: 200, duration: 500, easing: quintOut }}>
    Fly transition
  </div>
  
  <div transition:slide={{ duration: 400 }}>
    Slide transition
  </div>
  
  <div transition:scale={{ duration: 300 }}>
    Scale transition
  </div>
{/if}

<!-- In/out transitions -->
{#if visible}
  <div in:fly={{ x: -200 }} out:fade>
    Different in/out
  </div>
{/if}
```

## Actions (use:)

```svelte
<script>
  function tooltip(node, message) {
    let tooltip;
    
    function show() {
      tooltip = document.createElement('div');
      tooltip.textContent = message;
      tooltip.style.position = 'absolute';
      tooltip.style.background = 'black';
      tooltip.style.color = 'white';
      tooltip.style.padding = '4px 8px';
      tooltip.style.borderRadius = '4px';
      
      const rect = node.getBoundingClientRect();
      tooltip.style.left = `${rect.left}px`;
      tooltip.style.top = `${rect.bottom + 5}px`;
      
      document.body.appendChild(tooltip);
    }
    
    function hide() {
      tooltip?.remove();
    }
    
    node.addEventListener('mouseenter', show);
    node.addEventListener('mouseleave', hide);
    
    return {
      update(newMessage) {
        message = newMessage;
      },
      destroy() {
        node.removeEventListener('mouseenter', show);
        node.removeEventListener('mouseleave', hide);
        tooltip?.remove();
      }
    };
  }
  
  let message = 'Hello!';
</script>

<button use:tooltip={message}>Hover me</button>
```

## Slots

```svelte
<!-- Card.svelte -->
<div class="card">
  <header>
    <slot name="header">Default header</slot>
  </header>
  
  <main>
    <slot>Default content</slot>
  </main>
  
  <footer>
    <slot name="footer"></slot>
  </footer>
</div>

<!-- Using Card.svelte -->
<Card>
  <svelte:fragment slot="header">
    <h1>Custom Header</h1>
  </svelte:fragment>
  
  <p>Custom content</p>
  
  <svelte:fragment slot="footer">
    <button>Close</button>
  </svelte:fragment>
</Card>
```

## Snippets (Svelte 5)

```svelte
<script>
  let items = ['Apple', 'Banana', 'Orange'];
</script>

{#snippet listItem(item)}
  <li class="item">
    <strong>{item}</strong>
  </li>
{/snippet}

<ul>
  {#each items as item}
    {@render listItem(item)}
  {/each}
</ul>

<!-- Snippet with props -->
{#snippet card(title, content)}
  <div class="card">
    <h2>{title}</h2>
    <p>{content}</p>
  </div>
{/snippet}

{@render card('Hello', 'World')}
```

## See Also

- [Svelte Documentation](https://svelte.dev)
- [Svelte 5 Runes](https://svelte.dev/docs/svelte/what-are-runes)
- [Svelte Stores](https://svelte.dev/docs/svelte/stores)
- [Svelte Tutorial](https://svelte.dev/tutorial)
