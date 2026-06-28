# Fringe Cases

## Warnings & Notes

> [!NOTE]
> To further protect user privacy, the summary report values associated with each attribution source have a finite total value — this is called the **contribution budget**. This value may very across different implementations of the API; in Chrome it is 65,536. Any conversions that would generate reports adding values over that limit are not recorded. Make sure you keep track of the budget and share it between the different metrics you are trying to measure.

> [!NOTE]
> The report limit can be adjusted by setting a different number of `"end_times"` in the [`"event_report_windows"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#event_report_windows) fields of the associated `Attribution-Reporting-Register-Source` header.

> [!NOTE]
> `"source_type"` is an automatically populated field available on the source's `"filter_data"`.

> [!NOTE]
> `not_filters`, which filters with negation, is also supported.

> [!NOTE]
> To use debug reports, the reporting origin needs to set a cookie. If the origin configured to receive reports is a third party, this cookie will be a [third-party cookie](/en-US/docs/Web/Privacy/Guides/Third-party_cookies), which means that debug reports will not be available in browsers where third-party cookies are disabled/not available.

   > [!NOTE]
   > Make the source-side debug key different from the `source_event_id`, so that you can differentiate individual reports that have the same source event ID.

