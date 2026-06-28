# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The {{CSP("report-to")}} directive is intended to replace `report-uri`, and in browsers that support `report-to`, the `report-uri` directive is ignored.
>
> However until `report-to` is broadly supported you can specify both headers as shown:
>
> ```http
> Content-Security-Policy: …; report-uri https://endpoint.example.com; report-to endpoint_name
> ```

> [!NOTE]
> Violation reports should be considered attacker-controlled data.
> The content should be properly sanitized before storing or rendering.
> This is particularly true of the [script-sample](#script-sample) property, if supplied.

