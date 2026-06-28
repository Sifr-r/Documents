# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If an `opacity` value is applied to a non-positioned element (i.e., DIV #4 in the example below), something strange happens: the background and border of that block pop up above the floating blocks and the positioned blocks. This is due to a peculiar part of the specification: applying an `opacity` value creates a new stacking context (see [What No One Told You About Z-Index](https://philipwalton.com/articles/what-no-one-told-you-about-z-index/)).

