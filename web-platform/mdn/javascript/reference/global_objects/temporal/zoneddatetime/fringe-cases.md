# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When setting the time zone name, you rarely want to set it to `"UTC"`. `ZonedDateTime` is intended to be displayed to users, but no human lives in the "UTC" time zone. If you don't know the time zone at construction time but know the wall-clock time, use a {{jsxref("Temporal.PlainDateTime")}}. If you know the exact instant, use a {{jsxref("Temporal.Instant")}}.

> [!NOTE]
> Avoid using offset identifiers if there is a named time zone you can use instead. Even if a region has always used a single offset, it is better to use the named identifier to guard against future political changes to the offset.
>
> If a region uses (or has used) multiple offsets, then using its named time zone is even more important. This is because `Temporal.ZonedDateTime` can use methods like `add` or `with` to create new instances at a different instant. If those derived instances correspond to an instant that uses a different offset (for example, after a Daylight Saving Time transition) then your calculations will have an incorrect local time. Using a named time zone ensures that local dates and times are always adjusted for the correct offset for that instant.

> [!NOTE]
> Although {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}} also takes an [RFC 9557](#rfc_9557_format) string in the same form, there is no ambiguity because it always ignores the time zone identifier and reads the offset only.

