# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This attribute is merely a hint for the browser: browsers are not required to check for spelling errors. Typically non-editable elements are not checked for spelling errors, even if the `spellcheck` attribute is set to `true` and the browser supports spellchecking.

## Security Notes

Using spellchecking can have consequences for users' security and privacy.
The specification does not regulate _how_ spellchecking is done and the content of the element may be sent to a third party for spellchecking results (see [enhanced spellchecking and "spell-jacking"](https://www.comparitech.com/blog/information-security/what-is-spell-jacking/)).

You should consider setting `spellcheck` to `false` for elements that can contain sensitive information.

