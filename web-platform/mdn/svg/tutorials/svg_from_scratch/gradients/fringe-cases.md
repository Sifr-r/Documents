# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can also use the `href` attribute on gradients too. When it is used, attributes and stops from one gradient can be included on another. In the above example, you wouldn't have to recreate all the stops in Gradient2.
>
> ```html
> <linearGradient id="Gradient1">
>   <stop id="stop1" offset="0%" />
>   <stop id="stop2" offset="50%" />
>   <stop id="stop3" offset="100%" />
> </linearGradient>
> <linearGradient
>   id="Gradient2"
>   x1="0"
>   x2="0"
>   y1="0"
>   y2="1"
>   xmlns:xlink="http://www.w3.org/1999/xlink"
>   href="#Gradient1" />
> ```
>
> We've included the xlink namespace here directly on the node, although usually you would define it at the top of your document. More on that when we [talk about images](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Other_content_in_SVG).

