# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If you want to download the examples and run them locally, you'll need to run them through a local web server.

> [!NOTE]
> All of the examples in this guide have basically the same structure; the above should start getting pretty familiar.

> [!NOTE]
> In some module systems, you can use a module specifier like `modules/square` that isn't a relative or absolute path, and that doesn't have a file extension.
> This kind of specifier can be used in a browser environment if you first define an [import map](#importing_modules_using_import_maps).

> [!NOTE]
> The imported values are read-only views of the features that were exported. Similar to `const` variables, you cannot re-assign the variable that was imported, but you can still modify properties of object values. The value can only be re-assigned by the module exporting it. See the [`import` reference](/en-US/docs/Web/JavaScript/Reference/Statements/import#imported_values_can_only_be_modified_by_the_exporter) for an example.

> [!NOTE]
> The trailing `/` indicates that the module specifier key can be substituted as _part_ of a module specifier.
> If this is not present, the browser will only match (and substitute) the whole module specifier key.

> [!NOTE]
> You can also achieve version management using relative paths, but this is subpar because, among other things, this forces a particular structure on your project, and prevents you from using bare module names.

> [!NOTE]
> Modules and their dependencies can be preloaded by specifying them in [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) elements with [`rel="modulepreload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/modulepreload).
> This can significantly reduce load time when the modules are used.

> [!NOTE]
> The as syntax for renaming exported items is explained below in the [Renaming imports and exports](#renaming_imports_and_exports) section.

> [!NOTE]
> The exports referenced in `shapes.js` basically get redirected through the file and don't really exist there, so you won't be able to write any useful related code inside the same file.

> [!NOTE]
> Dynamic import is permitted in the browser main thread, and in shared and dedicated workers.
> However `import()` will throw if called in a service worker or worklet.

