# Fringe Cases

## Warnings & Notes

> [!NOTE]
>
> - The JavaScript function should always be saved to a file by itself but not be embedded in a HTML file or any other file.
> - The examples at the end of this document are complete. There is no additional syntax needed to save it into a file and use it. (Of course, the JavaScripts must be edited to reflect your site's domain name and/or subnets.)

> [!NOTE]
> pactester (part of the [pacparser](https://github.com/manugarg/pacparser) package) was used to test the following syntax examples.
>
> - The PAC file is named `proxy.pac`
> - Command line: `pactester -p ~/pacparser-master/tests/proxy.pac -u https://www.mozilla.org` (passes the `host` parameter `www.mozilla.org` and the `url` parameter `https://www.mozilla.org`)

> [!NOTE]
> If supported by the client, JavaScript regular expressions typically provide a more powerful and consistent way to pattern-match URLs (and other strings).

> [!NOTE]
> (Before Firefox 49) wd1 must be less than wd2 if you want the function to evaluate these parameters as a range. See the warning below.

> [!WARNING]
> _The order of the days matters_.
> Before Firefox 49, `weekdayRange("SUN", "SAT")` will always evaluate to `true`.
> Now `weekdayRange("WED", "SUN")` will only evaluate to `true`
> if the current day is Wednesday or Sunday.

> [!NOTE]
> (Before Firefox 49) day1 must be less than day2, month1 must be less than month2, and year1 must be less than year2 if you want the function to evaluate these parameters as a range. See the warning below.

> [!WARNING]
> **The order of the days, months, and years matter**. Before Firefox 49, `dateRange("JAN", "DEC")` will always evaluate to `true`. Now `dateRange("DEC", "JAN")` will only evaluate true if the current month is December or January.

> [!NOTE]
> (Before Firefox 49) the category hour1, min1, sec1 must be less than the category hour2, min2, sec2 if you want the function to evaluate these parameters as a range. See the warning below.

> [!WARNING]
> **The order of the hour, minute, second matter**. Before Firefox 49, `timeRange(0, 23)` will always evaluate to true. Now `timeRange(23, 0)` will only evaluate true if the current hour is 23:00 or midnight.

> [!NOTE]
> Since all of the examples that follow are very specific, they have not been tested.

> [!NOTE]
> This is the simplest and most efficient autoconfig file for cases where there's only one proxy.

> [!NOTE]
> The order of the above exceptions for efficiency: `localHostOrDomainIs()` functions only get executed for URLs that are in local domain, not for every URL. Be careful to note the parentheses around the _or_ expression before the _and_ expression to achieve the above-mentioned efficient behavior.

> [!NOTE]
> The same can be accomplished using the [`shExpMatch()`](#shexpmatch) function described earlier.

> [!NOTE]
> The autoconfig file can be output by a CGI script. This is useful, for example, when making the autoconfig file act differently based on the client IP address (the `REMOTE_ADDR` environment variable in CGI).
>
> Usage of `isInNet()`, `isResolvable()` and `dnsResolve()` functions should be carefully considered, as they require the DNS server to be consulted. All the other autoconfig-related functions are mere string-matching functions that don't require the use of a DNS server. If a proxy is used, the proxy will perform its DNS lookup which would double the impact on the DNS server. Most of the time these functions are not necessary to achieve the desired result.

