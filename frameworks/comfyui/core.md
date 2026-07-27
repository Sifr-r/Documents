# ComfyUI Core Reference

ComfyUI is a node-based graph execution engine and user interface optimized for Stable Diffusion, Flux, and generative AI pipelines. It evaluates workflow graphs as directed acyclic graphs (DAGs) and executes only dirty/out-of-date nodes.

---

## 1. Node Execution Model

ComfyUI processes workflows in two stages:
1. **Graph Serialization**: The UI or API client serializes the node canvas into an execution dictionary (Prompt JSON).
2. **Topological Execution**: The backend (`execution.py`) validates node inputs, checks cache keys (`IS_CHANGED`), and executes node functions in topological order.

---

## 2. Custom Node Development API

Custom nodes extend ComfyUI functionality by registering Python classes in `NODE_CLASS_MAPPINGS`.

### Minimum Custom Node Structure

```python
class ExampleNode:
    @classmethod
    def INPUT_TYPES(s):
        return {
            "required": {
                "image": ("IMAGE",),
                "factor": ("FLOAT", {"default": 1.0, "min": 0.0, "max": 10.0, "step": 0.1}),
            },
            "optional": {
                "mask": ("MASK",),
            }
        }

    RETURN_TYPES = ("IMAGE",)
    RETURN_NAMES = ("image",)
    FUNCTION = "process"
    CATEGORY = "Example"
    OUTPUT_NODE = False

    def process(self, image, factor, mask=None):
        processed_image = image * factor
        return (processed_image,)

NODE_CLASS_MAPPINGS = {
    "ExampleNodeKey": ExampleNode
}

NODE_DISPLAY_NAME_MAPPINGS = {
    "ExampleNodeKey": "Example Custom Node"
}
```

### Key Class Attributes

| Attribute | Type | Description |
|---|---|---|
| `INPUT_TYPES` | `classmethod` | Dict returning `required`, `optional`, and `hidden` input definitions |
| `RETURN_TYPES` | `tuple` | Tuple of type names produced by `FUNCTION` (e.g., `("MODEL", "CLIP", "CONDITIONING")`) |
| `RETURN_NAMES` | `tuple` | Optional tuple of display labels for output slots |
| `FUNCTION` | `str` | Name of the instance method executed during graph processing |
| `CATEGORY` | `str` | Submenu category in the node creation browser |
| `OUTPUT_NODE` | `bool` | Set `True` if node produces side-effects or user output (e.g. SaveImage, PreviewImage) |
| `IS_CHANGED` | `method` | Custom cache invalidation function returning a hashable value or `float("NaN")` |

---

## 3. REST API Reference

ComfyUI runs an `aiohttp` web server (default port `8188`).

### Endpoints

#### Submit Prompt (`POST /prompt`)
Queues a prompt JSON execution graph.

```json
// Payload
{
  "prompt": {
    "3": {
      "inputs": {
        "seed": 42,
        "steps": 20,
        "cfg": 8.0,
        "sampler_name": "euler",
        "scheduler": "normal",
        "denoise": 1.0,
        "model": ["4", 0],
        "positive": ["6", 0],
        "negative": ["7", 0],
        "latent_image": ["5", 0]
      },
      "class_type": "KSampler"
    }
  },
  "client_id": "client_123"
}
```

```bash
curl -X POST http://127.0.0.1:8188/prompt \
  -H "Content-Type: application/json" \
  -d @prompt.json
```

#### Check Queue (`GET /queue`)
Returns currently executing and pending queue tasks.

```bash
curl http://127.0.0.1:8188/queue
```

#### Fetch History (`GET /history/{prompt_id}`)
Retrieves execution status, outputs, and image filenames for completed prompts.

```bash
curl http://127.0.0.1:8188/history/3f2a890b-1234-4567-89ab-cdef01234567
```

#### Fetch Image (`GET /view`)
Retrieves generated images or previews.

```bash
curl "http://127.0.0.1:8188/view?filename=ComfyUI_00001_.png&type=output&subfolder=" -o output.png
```

---

## 4. WebSocket Real-Time API (`GET /ws?client_id=...`)

Listen to `/ws` for live execution status, node progress, and image preview broadcasts.

```python
import websocket
import json

ws = websocket.WebSocket()
ws.connect("ws://127.0.0.1:8188/ws?client_id=client_123")

while True:
    out = ws.recv()
    if isinstance(out, str):
        message = json.loads(out)
        if message["type"] == "progress":
            print(f"Step {message['data']['value']}/{message['data']['max']}")
        elif message["type"] == "executing":
            print(f"Executing node: {message['data']['node']}")
```

---

## 5. Command Line Flags

| Flag | Description |
|---|---|
| `--listen [IP]` | Bind server to specific network interface (default `127.0.0.1`, use `0.0.0.0` for public) |
| `--port PORT` | Set web server port (default `8188`) |
| `--cuda-device N` | Set primary CUDA GPU device index |
| `--lowvram` | Enable low VRAM optimization mode |
| `--highvram` | Force high VRAM mode (keep models loaded) |
| `--cpu` | Run execution strictly on CPU |
| `--enable-cors-header` | Enable CORS headers for external web frontends |
