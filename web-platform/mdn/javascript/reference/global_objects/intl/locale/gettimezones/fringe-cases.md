# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In some versions of some browsers, this method was implemented as an accessor property called `timeZones`. However, because it returns a new array on each access, it is now implemented as a method to prevent the situation of `locale.timeZones === locale.timeZones` returning `false`. Check the [browser compatibility table](#browser_compatibility) for details.

> [!NOTE]
> The standardization of `Temporal` requires browsers to always return the primary identifier in the IANA database, which may change over time. See [time zones and offsets](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) for more information.

