# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Support depends on the system's graphics driver (Windows+ANGLE and Android are supported; Windows+GL, Mac, Linux are not supported).
>
> This extension is only available to {{domxref("WebGL2RenderingContext", "WebGL 2", "", 1)}} contexts as it needs GLSL 3.00 and texture arrays.
>
> Currently, there is no way to use multiview to render to a multisampled backbuffer, so you should create contexts with `antialias: false`. However, the Oculus browser (6+) also supports multisampling using the [`OCULUS_multiview`](https://developers.meta.com/horizon/documentation/web/web-multiview/#using-oculus_multiview-in-webgl-20) extension. See also [this WebGL issue](https://github.com/KhronosGroup/WebGL/issues/2912).

