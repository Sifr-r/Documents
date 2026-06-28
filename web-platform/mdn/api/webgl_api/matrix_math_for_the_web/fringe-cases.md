# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Our examples on this page use row vectors to represent points and right-multiplication to apply transformation matrices. That is, the above does `point * matrix` where `point` is a 4x1 row vector. If you want to use column vectors and left-multiplication, you need to adjust the multiplication function accordingly, and transpose each matrix introduced below.
>
> For example, the [`translationMatrix`](#translation_matrix) introduced below originally looks like:
>
> ```js-nolint
> [1, 0, 0, 0,
>  0, 1, 0, 0,
>  0, 0, 1, 0,
>  x, y, z, 1]
> ```
>
> After transposition, it would look like:
>
> ```js-nolint
> [1, 0, 0, x,
>  0, 1, 0, y,
>  0, 0, 1, z,
>  0, 0, 0, 1]
> ```

> [!WARNING]
> These matrix functions are written for clarity of explanation, not for speed or memory management. These functions create a lot of new arrays, which can be particularly expensive for real-time operations due to garbage collection. In real production code it would be best to use optimized functions. [glMatrix](https://glmatrix.net/) is an example of a library that has a focus on speed and performance. The focus in the glMatrix library is to have target arrays that are allocated before the update loop.

