# _template — Blueprint for New Domains

Copy this directory to create a new documentation domain.

## Steps

1. Copy the template:
   ```bash
   cp -r _template languages/kotlin
   ```

2. Edit `README.md` — update the title and topic list.

3. Replace or add `.md` files with your documentation.

4. Delete this instruction block.

## Conventions

- **One directory per topic**: Create a folder for each topic instead of a single `.md` file.
- **Nested topic files**: Inside the topic directory, create `README.md` (core), `fringe-cases.md`, `alternatives.md`, and `cross-reference.md`.
- **Inline Backlinks**: Actively link between topics and fringe cases to provide LLMs with better context.
- **Cross-Language References**: Use `cross-reference.md` to map concepts to equivalent features in other languages.
- **Markdown only**: Ensure code examples use fenced blocks with language identifiers.
