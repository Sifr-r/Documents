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

- One `.md` file per topic (max ~300 lines for optimal LLM context window)
- Start every file with a level-1 heading (`# Topic Name`)
- Include code examples in fenced blocks with language identifiers
- End each file with a "See Also" section linking to related topics
- Write in reference style — concise, factual, no fluff
