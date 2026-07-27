# ComfyUI

ComfyUI is a modular, node-based graph execution engine and graphical user interface for Stable Diffusion, Flux, and generative AI workflow execution pipelines.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Node execution engine, Custom Node API, REST/WebSocket API endpoints, Prompt JSON schema, CLI configuration |
| Upstream Docs | [get_started/](get_started/) | Upstream user guides, installation tutorials, custom node developer documentation, and API references |

## Quick Reference

### Python Custom Node

```python
class TextConcatenator:
    @classmethod
    def INPUT_TYPES(s):
        return {
            "required": {
                "text_a": ("STRING", {"multiline": True, "default": ""}),
                "text_b": ("STRING", {"multiline": True, "default": ""}),
                "separator": ("STRING", {"default": ", "}),
            }
        }

    RETURN_TYPES = ("STRING",)
    FUNCTION = "combine"
    CATEGORY = "text/processing"

    def combine(self, text_a, text_b, separator):
        return (f"{text_a}{separator}{text_b}",)

NODE_CLASS_MAPPINGS = {"TextConcatenator": TextConcatenator}
NODE_DISPLAY_NAME_MAPPINGS = {"TextConcatenator": "Concatenate Text"}
```

### Submit Workflow Prompt via REST API

```python
import urllib.request
import json

prompt_data = {
    "prompt": {
        "3": {
            "inputs": {
                "seed": 42,
                "steps": 20,
                "cfg": 7.0,
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
    }
}

req = urllib.request.Request(
    "http://127.0.0.1:8188/prompt",
    data=json.dumps(prompt_data).encode("utf-8"),
    headers={"Content-Type": "application/json"}
)

response = urllib.request.urlopen(req)
print(json.loads(response.read()))
```

### Launch ComfyUI Server

```bash
python main.py --listen 0.0.0.0 --port 8188 --lowvram
```

## See Also

- [Official ComfyUI Docs](https://docs.comfy.org)
- [ComfyUI GitHub Repository](https://github.com/Comfy-Org/ComfyUI)
- [Comfy-Org Docs GitHub](https://github.com/Comfy-Org/docs)
