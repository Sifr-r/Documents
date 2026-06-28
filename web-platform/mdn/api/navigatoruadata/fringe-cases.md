# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The terms _high entropy_ and _low entropy_ refer to the amount of information these values reveal about the browser. The values returned as properties are deemed [low entropy](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints), which are unlikely to identify a user. The {{domxref("NavigatorUAData.getHighEntropyValues()")}} can be used to request additional [high entropy](/en-US/docs/Web/HTTP/Guides/Client_hints#high_entropy_hints) values, which could potentially reveal more identifying information. These values are therefore retrieved via a {{jsxref("Promise")}}, allowing time for the browser to request user permission, or make other checks.

