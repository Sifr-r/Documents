# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The value is [always the file's name prefixed with `C:\fakepath\`](https://html.spec.whatwg.org/multipage/input.html#fakepath-srsly), which isn't the real path of the file. This is to prevent malicious software from guessing the user's file structure.

> [!NOTE]
> `capture` was previously a Boolean attribute which, if present, requested that the device's media capture device(s) such as camera or microphone be used instead of requesting a file input.

> [!NOTE]
> You can find this example on GitHub too — see the [source code](https://github.com/mdn/learning-area/blob/main/html/forms/file-examples/simple-file.html), and also [see it running live](https://mdn.github.io/learning-area/html/forms/file-examples/simple-file.html).

> [!NOTE]
> You can find this example on GitHub too — see the [source code](https://github.com/mdn/learning-area/blob/main/html/forms/file-examples/file-with-accept.html), and also [see it running live](https://mdn.github.io/learning-area/html/forms/file-examples/file-with-accept.html).

> [!NOTE]
> You can see the complete source code for this example on GitHub — [file-example.html](https://github.com/mdn/learning-area/blob/main/html/forms/file-examples/file-example.html) ([see it live also](https://mdn.github.io/learning-area/html/forms/file-examples/file-example.html)). We won't explain the CSS; the JavaScript is the main focus.

> [!NOTE]
> {{cssxref("opacity")}} is used to hide the file input instead of {{cssxref("visibility", "visibility: hidden")}} or {{cssxref("display", "display: none")}}, because assistive technology interprets the latter two styles to mean the file input isn't interactive.

> [!NOTE]
> The "KB" and "MB" units here use the [SI prefix](https://en.wikipedia.org/wiki/Binary_prefix) convention of 1KB = 1000B, similar to macOS. Different systems represent file sizes differently—for example, Ubuntu uses IEC prefixes where 1KiB = 1024B, while RAM specifications often use SI prefixes to represent powers of two (1KB = 1024B). For this reason, we used `1e3` (`1000`) and `1e6` (`100000`) instead of `1024` and `1048576`. In your application, you should communicate the unit system clearly to your users if the exact size is important.

