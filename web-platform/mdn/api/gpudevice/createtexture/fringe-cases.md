# Fringe Cases

## Warnings & Notes

> [!NOTE]
        >
        > - The `depth32float-stencil8` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) needs to be enabled to create `depth32float-stencil8`-format {{domxref("GPUTexture")}}s.
        > - The `texture-compression-bc` feature needs to be enabled to create two-dimensional (`dimension: "2d"`) BC compressed `GPUTexture`s: `bc1-rgba-unorm`, `bc1-rgba-unorm-srgb`, `bc2-rgba-unorm`, `bc2-rgba-unorm-srgb`, `bc3-rgba-unorm`, `bc3-rgba-unorm-srgb`, `bc4-r-unorm`, `bc4-r-snorm`, `bc5-rg-unorm`, `bc5-rg-snorm`, `bc6h-rgb-ufloat`, `bc6h-rgb-float`, `bc7-rgba-unorm`, and `bc7-rgba-unorm-srgb` formats.
        > - The `texture-compression-bc` and `texture-compression-bc-sliced-3d` features need to be enabled to create three-dimensional BC compressed `GPUTexture`s (the same `format` values specified in the previous bullet, but with `dimension` set to `3d`).
        > - The `texture-compression-astc` feature needs to be enabled to create two-dimensional (`dimension: "2d"`) ASTC compressed `GPUTexture`s: `astc-4x4-unorm`, `astc-4x4-unorm-srgb`, `astc-5x4-unorm`, `astc-5x4-unorm-srgb`, `astc-5x5-unorm`, `astc-5x5-unorm-srgb`, `astc-6x5-unorm`, `astc-6x5-unorm-srgb`, `astc-6x6-unorm`, `astc-6x6-unorm-srgb`, `astc-8x5-unorm`, `astc-8x5-unorm-srgb`, `astc-8x6-unorm`, `astc-8x6-unorm-srgb`, `astc-8x8-unorm`, `astc-8x8-unorm-srgb`, `astc-10x5-unorm`, `astc-10x5-unorm-srgb`, `astc-10x6-unorm`, `astc-10x6-unorm-srgb`, `astc-10x8-unorm`, `astc-10x8-unorm-srgb`, `astc-10x10-unorm`, `astc-10x10-unorm-srgb`, `astc-12x10-unorm`, `astc-12x10-unorm-srgb`, `astc-12x12-unorm`, and `astc-12x12-unorm-srgb` formats.
        > - The `texture-compression-astc` and `texture-compression-astc-sliced-3d` features need to be enabled to create three-dimensional BC compressed `GPUTexture`s (the same `format` values specified in the previous bullet, but with `dimension` set to `3d`).
        > - The `texture-compression-etc2` feature needs to be enabled to create two-dimensional ETC2 compressed `GPUTexture`s: `etc2-rgb8unorm`, `etc2-rgb8unorm-srgb`, `etc2-rgb8a1unorm`, `etc2-rgb8a1unorm-srgb`, `etc2-rgba8unorm`, `etc2-rgba8unorm-srgb`, `eac-r11unorm`, `eac-r11snorm`, `eac-rg11unorm`, and `eac-rg11snorm` formats.
        > - See the [Tier 1 and Tier 2 texture formats](#tier_1_and_tier_2_texture_formats) section for more information about those texture format sets and the requirements to create them.

        > [!NOTE]
        >
        > - The `bgra8unorm-storage` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) needs to be enabled to specify `STORAGE_BINDING` usage for a `bgra8unorm`-[`format`](#format) {{domxref("GPUTexture")}}.
        > - The `rg11b10ufloat-renderable` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) needs to be enabled to specify `RENDER_ATTACHMENT` usage for a `rg11b10ufloat`-[`format`](#format) {{domxref("GPUTexture")}}, as well as its blending and multisampling.

> [!NOTE]
> Enabling the `texture-formats-tier1` feature automatically enables the `rg11b10ufloat-renderable` feature, which allows the `rg11b10ufloat` texture to be used with the `RENDER_ATTACHMENT` usage, including blending and multisampling.

> [!NOTE]
> Enabling the `texture-formats-tier2` feature automatically enables the `rg11b10ufloat-renderable` and `texture-formats-tier1` features.

