# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `addEventListener()` method is the _recommended_ way to register an event listener. The benefits are as follows:
>
> - It allows adding more than one handler for an event. This is particularly
>   useful for libraries, JavaScript modules, or any other kind of
>   code that needs to work well with other libraries or extensions.
> - In contrast to using an `onXYZ` property, it gives you finer-grained control of the phase when the listener is activated (capturing vs. bubbling).
> - It works on any event target, not just HTML or SVG elements.

> [!NOTE]
> If a particular anonymous function is in the list of event listeners registered for a certain target, and then later in the code, an identical anonymous function is given in an `addEventListener` call, the second function will _also_ be added to the list of event listeners for that target.
>
> Indeed, anonymous functions are not identical even if defined using
> the _same_ unchanging source-code called repeatedly, **even if in a loop**.
>
> Repeatedly defining the same unnamed function in such cases can be
> problematic. (See [Memory issues](#memory_issues), below.)

    > [!NOTE]
    > For event listeners attached to the event target, the event is in the target phase, rather than the capturing and bubbling phases.
    > Event listeners in the _capturing_ phase are called before event listeners in the target and bubbling phases.

