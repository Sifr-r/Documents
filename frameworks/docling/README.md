# Docling

Document parsing and data extraction library for converting PDFs, Office files, and web content into structured Markdown.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Core concepts, API reference, and key usage patterns |
| Documentation | [docs/](docs/) | Full documentation set indexed from upstream package |

## Quick Reference

### Basic Conversion
```python
from docling.document_converter import DocumentConverter

converter = DocumentConverter()
result = converter.convert("https://arxiv.org/pdf/2408.09869")
print(result.document.export_to_markdown())
```

## See Also

- [Docling Official Documentation](https://neuledge.com)
