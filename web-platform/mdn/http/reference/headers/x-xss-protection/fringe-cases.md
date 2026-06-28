# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Even though this feature can protect users of older web browsers that don't support {{Glossary("CSP")}}, in some cases, **`X-XSS-Protection` can create XSS vulnerabilities** in otherwise safe websites.
> See the [Security considerations](#security_considerations) section below for more information.

## Security Notes

### Vulnerabilities caused by XSS filtering

Consider the following excerpt of HTML code for a webpage:

```html
<script>
  var productionMode = true;
</script>
<!-- [...] -->
<script>
  if (!window.productionMode) {
    // Some vulnerable debug code
  }
</script>
```

This code is completely safe if the browser doesn't perform XSS filtering. However, if it does and the search query is `?something=%3Cscript%3Evar%20productionMode%20%3D%20true%3B%3C%2Fscript%3E`, the browser might execute the scripts in the page ignoring `<script>var productionMode = true;</script>` (thinking the server included it in the response because it was in the URI), causing `window.productionMode` to be evaluated to `undefined` and executing the unsafe debug code.

Setting the `X-XSS-Protection` header to either `0` or `1; mode=block` prevents vulnerabilities like the one described above. The former would make the browser run all scripts and the latter would prevent the page from being processed at all (though this approach might be vulnerable to [side-channel attacks](https://portswigger.net/research/abusing-chromes-xss-auditor-to-steal-tokens) if the website is embeddable in an `<iframe>`).

