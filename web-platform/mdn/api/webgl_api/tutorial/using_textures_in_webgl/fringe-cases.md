# Fringe Cases

## Warnings & Notes

> [!NOTE]
> It's important to note that the loading of textures follows [cross-domain rules](/en-US/docs/Web/HTTP/Guides/CORS); that is, you can only load textures from sites for which your content has CORS approval. See [Cross-domain textures below](#cross-domain_textures) for details.

> [!NOTE]
> Add these two functions to your "webgl-demo.js" script:

> [!NOTE]
> Add the following code to your `main()` function, right after the call to `initBuffers()`:

> [!NOTE]
> Finally, download the [cubetexture.png](https://raw.githubusercontent.com/mdn/dom-examples/main/webgl-examples/tutorial/sample6/cubetexture.png) file to the same local directory as your JavaScript files.

> [!NOTE]
> Add this function to your "init-buffer.js" module:

> [!NOTE]
> In the `initBuffers()` function of your "init-buffers.js" module, replace the call to `initColorBuffer()` with the following line:

> [!NOTE]
> In the `initBuffers()` function of your "init-buffers.js" module, replace the `return` statement with the following:

> [!NOTE]
> Update the `vsSource` declaration in your `main()` function like this:

> [!NOTE]
> Update the `fsSource` declaration in your `main()` function like this:

> [!NOTE]
> Update the `programInfo` declaration in your `main()` function like this:

> [!NOTE]
> In the `drawScene()` function of your "draw-scene.js" module, add the following function:

> [!NOTE]
> In the `drawScene()` function of your "draw-scene.js" module, replace the call to `setColorAttribute()` with the following line:

> [!NOTE]
> In your `drawScene()` function, just after the two calls to `gl.uniformMatrix4fv()`, add the following code:

