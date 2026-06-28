# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The prebuilt ffmpeg does not include libfdk_aac due to licensing reasons. Bento4 uses this by default, so you need to compile ffmpeg if necessary. If you don't need it, add `--audio-codec=aac` to the `mp4-dash-encode.py` command line.

> [!NOTE]
> The fragmented version is slightly larger than the original, due to additional metadata spread throughout the file. This is usually a file size increase of 1 percent or less.

> [!NOTE]
> `mp4-dash-encode.py` does not display ffmpeg error messages. You can see it by specifying the `-d` option.

> [!NOTE]
> If `"Invalid duration specification for force_key_frames: 'expr:eq(mod(n"` is displayed as an error message, modify `mp4-dash-encode.py` and remove two `"'"` from `"-force_key_frames 'expr:eq(mod(n,%d),0)'"`.

