# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Using spinlocking on the main thread is not recommended, as it will freeze the entire page. In general, unless designed very carefully, spinlocks may not actually be more performant than a regular wait.

