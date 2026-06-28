# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In non-supporting browsers (check the [compatibility data](#browser_compatibility)), a [polyfill](https://github.com/guybedford/es-module-shims) can be used to avoid issues related to module resolution.

## Exceptions

- `TypeError`
  - : The import map definition is not a JSON object, the `importmap` key is defined but its value is not a JSON object, or the `scopes` key is defined but its value is not a JSON object.

Browsers generate console warnings for other cases where the import map JSON does not conform to the [import map](#import_map_json_representation) schema.

