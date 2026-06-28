# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In the examples below, we'll use the {{domxref("Window.requestAnimationFrame()")}} method to control the animation. The `requestAnimationFrame` method provides a smoother and more efficient way for animating by calling the animation frame when the system is ready to paint the frame. The number of callbacks is usually 60 times per second and may be reduced to a lower rate when running in background tabs. For more information about the animation loop, especially for games, see the article [Anatomy of a video game](/en-US/docs/Games/Anatomy) in our [Game development zone](/en-US/docs/Games).

> [!NOTE]
> Although the clock updates only once every second, the animated image is updated at 60 frames per second (or at the display refresh rate of your web browser).
> To display the clock with a sweeping second hand, replace the definition of `const sec` above with the version that has been commented out.

