# Web APIs

## DOM Manipulation

```js
// Selection
const el = document.querySelector('.class');
const els = document.querySelectorAll('[data-attr]');
const el2 = document.getElementById('id');

// Create & modify
const div = document.createElement('div');
div.textContent = 'Hello';
div.innerHTML = '<span>Hello</span>'; // unsafe with user content!
div.setAttribute('data-id', '123');
div.dataset.id = '123';              // data-* shortcut
div.classList.add('active');
div.classList.toggle('hidden');
div.classList.remove('inactive');
div.classList.contains('active');    // true/false
div.style.setProperty('--color', 'red');

// DOM insertion
parent.appendChild(child);
parent.insertBefore(newNode, referenceNode);
parent.replaceChild(newNode, oldNode);
parent.removeChild(child);
child.remove();          // modern shortcut
element.before(newEl);   // insert before (modern)
element.after(newEl);    // insert after
element.replaceWith(newEl);

// Traversal
el.parentElement;
el.children;           // HTMLCollection (live)
el.firstElementChild;
el.nextElementSibling;
el.closest('.parent'); // nearest ancestor matching selector
```

## Events

```js
// Add / remove
el.addEventListener('click', handler);
el.addEventListener('click', handler, { once: true });
el.addEventListener('click', handler, { passive: true }); // for scroll
el.removeEventListener('click', handler);

// Event delegation
document.querySelector('.list').addEventListener('click', (e) => {
  const item = e.target.closest('.list-item');
  if (!item) return; // clicked outside items
  handleItem(item);
});

// Custom events
const event = new CustomEvent('user:login', {
  detail: { userId: '123' },
  bubbles: true,
});
el.dispatchEvent(event);

// Common events
// Mouse: click, dblclick, mousedown, mouseup, mousemove, wheel
// Keyboard: keydown, keyup (key, code, ctrlKey, shiftKey)
// Form: submit, change, input, focus, blur
// Document: DOMContentLoaded (HTML parsed, no CSS/images)
// Window: load (all resources), resize, scroll
```

## Fetch API

```js
// Basic
const res = await fetch(url);
if (!res.ok) throw new Error(`HTTP ${res.status}`);
const data = await res.json();
// res.text(), res.blob(), res.arrayBuffer(), res.formData()

// POST
const res = await fetch(url, {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ key: 'value' }),
});

// FormData
const form = new FormData();
form.append('file', fileInput.files[0]);
await fetch(url, { method: 'POST', body: form });

// Abort
const ctrl = new AbortController();
setTimeout(() => ctrl.abort(), 5000);
const res = await fetch(url, { signal: ctrl.signal });

// Streaming response
const res = await fetch(url);
const reader = res.body.getReader();
while (true) {
  const { done, value } = await reader.read();
  if (done) break;
  // value is Uint8Array
}
```

## Storage

```js
// localStorage (persists indefinitely)
localStorage.setItem('key', 'value');
const val = localStorage.getItem('key');
localStorage.removeItem('key');
localStorage.clear();

// sessionStorage (per tab, cleared on close)
sessionStorage.setItem('key', JSON.stringify(obj));

// IndexedDB (structured, async, large data)
// Use a wrapper: idb, Dexie.js
```

## Web Workers

```js
// main.js
const worker = new Worker('worker.js');
worker.postMessage({ type: 'compute', data: largeArray });
worker.onmessage = (e) => {
  console.log('result:', e.data);
};
worker.onerror = (e) => {
  console.error('worker error:', e);
};

// worker.js
self.onmessage = (e) => {
  const result = heavyComputation(e.data);
  self.postMessage(result);
};
```

## Observers

```js
// IntersectionObserver — detect visibility
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      observer.unobserve(entry.target); // observe once
    }
  });
}, { threshold: 0.1 }); // 10% visible
observer.observe(document.querySelector('.lazy'));

// MutationObserver — watch DOM changes
const observer = new MutationObserver((mutations) => {
  mutations.forEach(m => {
    m.addedNodes.forEach(node => { /* new element */ });
    m.removedNodes.forEach(node => { /* removed element */ });
  });
});
observer.observe(parent, { childList: true, subtree: true });

// ResizeObserver — watch element size
const observer = new ResizeObserver((entries) => {
  for (const entry of entries) {
    const { width, height } = entry.contentRect;
  }
});
observer.observe(document.querySelector('.container'));
```

## See Also

- [html.md](html.md) — semantic markup, forms
- [css.md](css.md) — styling, animations
