
## Introduction

<img align="right" src="https://github.com/tauri-apps/tauri/raw/dev/.github/icon.png" height="128" width="128">

[![status](https://img.shields.io/badge/Status-Beta-green.svg)](https://github.com/tauri-apps/tauri)
[![Chat Server](https://img.shields.io/badge/chat-on%20discord-7289da.svg)](https://discord.gg/SpmNs4S)

[![test core](https://img.shields.io/github/actions/workflow/status/tauri-apps/tauri/test-core.yml?label=test%20core&logo=github)](https://github.com/tauri-apps/tauri/actions/workflows/test-core.yml)
[![website](https://img.shields.io/badge/website-tauri.app-purple.svg)](https://tauri.app)

[![https://good-labs.github.io/greater-good-affirmation/assets/images/badge.svg](https://good-labs.github.io/greater-good-affirmation/assets/images/badge.svg)](https://good-labs.github.io/greater-good-affirmation)
[![support](https://img.shields.io/badge/sponsor-Opencollective-blue.svg)](https://opencollective.com/tauri)

| Component     | Version                                                                                                        |
| ------------- | -------------------------------------------------------------------------------------------------------------- |
| tauri-runtime | [![](https://img.shields.io/crates/v/tauri-runtime?style=flat-square)](https://crates.io/crates/tauri-runtime) |



## This module

This is the glue layer between tauri itself and lower level webview libraries.
None of the exposed API of this crate is stable, and it may break semver
compatibility in the future. The major version only signifies the intended Tauri version.

To learn more about the details of how all of these pieces fit together, please consult this [ARCHITECTURE.md](https://github.com/tauri-apps/tauri/blob/dev/ARCHITECTURE.md) document.

