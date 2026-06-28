# create nuxt

## Introduction

<!--init-cmd-->
```bash [Terminal]
npm create nuxt@latest [DIR] [--cwd=<directory>] [--logLevel=<silent|info|verbose>] [-t, --template] [-f, --force] [--offline] [--preferOffline] [--no-install] [--gitInit] [--shell] [--packageManager] [-M, --modules] [--no-modules] [--nightly]
```
<!--/init-cmd-->

The `create-nuxt` command initializes a fresh Nuxt project using [unjs/giget](https://github.com/unjs/giget).

## Arguments

<!--init-args-->
| Argument | Description       |
|----------|-------------------|
| `DIR=""` | Project directory |
<!--/init-args-->

## Options

<!--init-opts-->
| Option                               | Default | Description                                              |
|--------------------------------------|---------|----------------------------------------------------------|
| `--cwd=<directory>`                  | `.`     | Specify the working directory                            |
| `--logLevel=<silent\|info\|verbose>` |         | Specify build-time log level                             |
| `-t, --template`                     |         | Template name                                            |
| `-f, --force`                        |         | Override existing directory                              |
| `--offline`                          |         | Force offline mode                                       |
| `--preferOffline`                    |         | Prefer offline mode                                      |
| `--no-install`                       |         | Skip installing dependencies                             |
| `--gitInit`                          |         | Initialize git repository                                |
| `--shell`                            |         | Start shell after installation in project directory      |
| `--packageManager`                   |         | Package manager choice (npm, pnpm, yarn, bun)            |
| `-M, --modules`                      |         | Nuxt modules to install (comma separated without spaces) |
| `--no-modules`                       |         | Skip module installation prompt                          |
| `--nightly`                          |         | Use Nuxt nightly release channel (3x or latest)          |
<!--/init-opts-->

