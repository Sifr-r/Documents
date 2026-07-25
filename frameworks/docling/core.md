# Docling — Core Guide

## Overview

Document parsing and data extraction library for converting PDFs, Office files, and web content into structured Markdown.

## Key Patterns & Usage

### Basic Conversion
```python
from docling.document_converter import DocumentConverter

converter = DocumentConverter()
result = converter.convert("https://arxiv.org/pdf/2408.09869")
print(result.document.export_to_markdown())
```

## Index of Available Documentation Files

All detailed guide files can be found under the [`docs/`](docs/) directory:

- [`docling-project.github.io/docling.md`](docs/docling-project.github.io/docling.md)
