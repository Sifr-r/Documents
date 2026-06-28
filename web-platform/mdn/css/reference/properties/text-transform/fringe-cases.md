# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Support for language-specific cases varies between browsers, so check the [browser compatibility table](#browser_compatibility).

    > [!WARNING]
    > In many languages, it is considered incorrect to capitalize every word in a sentence, even in titles and names. If you don't know the language of the text the style will be applied to, you should avoid using `capitalize`. Furthermore, `capitalize` does not create title casing, because it does not apply language-specific rules such as skipping articles in English.

    > [!NOTE]
    > The `capitalize` keyword was under-specified in CSS 1 and CSS 2.1. This resulted in differences between browsers in the way the first letter was calculated (Firefox considered `-` and `_` as letters, but other browsers did not. Both WebKit and Gecko incorrectly considered letter-based symbols like `ⓐ` to be real letters.) By precisely defining the correct behavior, CSS Text Level 3 cleans this mess up. The `capitalize` line in the browser compatibility table contains the version the different engines started to support this now precisely-defined behavior.

