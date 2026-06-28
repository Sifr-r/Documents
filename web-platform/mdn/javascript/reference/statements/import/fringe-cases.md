# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `import { x, y } from "mod"` is not equivalent to `import defaultExport from "mod"` and then destructuring `x` and `y` from `defaultExport`. Named and default imports are distinct syntaxes in JavaScript modules.

> [!NOTE]
> JavaScript does not have wildcard imports like `import * from "module-name"`, because of the high possibility of name conflicts.

