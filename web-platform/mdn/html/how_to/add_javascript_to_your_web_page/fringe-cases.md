# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In this article we're going over the HTML code you need to make JavaScript take effect. If you want to learn JavaScript itself, you can start with our [JavaScript basics](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Adding_interactivity) article. If you already know something about JavaScript or if you have a background with other programming languages, we suggest you jump directly into our [JavaScript Guide](/en-US/docs/Web/JavaScript/Guide).

> [!NOTE]
> For both inline scripts and external scripts without the [`defer`](/en-US/docs/Web/HTML/Reference/Elements/script#defer) or [`async`](/en-US/docs/Web/HTML/Reference/Elements/script#async) attributes, the script is executed immediately when the browser encounters the `<script>` element while parsing the HTML. This means that the script cannot access any HTML elements that appear later in the document. To access such elements, consider moving the script to the end of the document body (just before the closing `</body>` tag), or use the `defer` attribute on external scripts.

