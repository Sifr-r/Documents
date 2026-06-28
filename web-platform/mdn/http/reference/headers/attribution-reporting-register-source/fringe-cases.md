# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the calling site does not have the Attribution Reporting API included in a successful [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox#enrollment), the `Attribution-Reporting-Register-Source` header is ignored and attribution sources are not registered.

        > [!NOTE]
        > If `"event_report_window"` is specified, `"event_report_windows"` cannot be specified, otherwise the source registration will fail.

          > [!NOTE]
          > If `"event_report_windows"` is specified, `"event_report_window"` cannot be specified, otherwise the source registration will fail.

        > [!NOTE]
        > The values used to represent each event, and the number of elements in the array, are completely arbitrary and defined by you as the developer. The array may contain values that are not used, but values must be present in the array to be attributed to the source by the browser when a trigger is registered.

        > [!NOTE]
        > If `"modulus"` is used, the source's `"trigger_data"` must form a contiguous sequence of integers starting at 0. If the trigger data does not form such a sequence, an error occurs.

