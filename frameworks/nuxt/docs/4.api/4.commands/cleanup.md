# nuxt cleanup

## Introduction

<!--cleanup-cmd-->
```bash [Terminal]
npx nuxt cleanup [ROOTDIR] [--cwd=<directory>]
```
<!--/cleanup-cmd-->

The `cleanup` command removes common generated Nuxt files and caches, including:

- `.nuxt`
- `.output`
- `node_modules/.vite`
- `node_modules/.cache`

## Arguments

<!--cleanup-args-->
| Argument      | Description                                    |
|---------------|------------------------------------------------|
| `ROOTDIR="."` | Specifies the working directory (default: `.`) |
<!--/cleanup-args-->

## Options

<!--cleanup-opts-->
| Option              | Default | Description                                                                      |
|---------------------|---------|----------------------------------------------------------------------------------|
| `--cwd=<directory>` |         | Specify the working directory, this takes precedence over ROOTDIR (default: `.`) |
<!--/cleanup-opts-->

