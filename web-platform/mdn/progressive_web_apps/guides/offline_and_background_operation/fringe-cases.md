# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The strategy described here is just one way a service worker could implement caching. Specifically, in a cache first strategy, we check the cache first before the network, meaning that we are more likely to return a quick response without incurring a network cost, but are more likely to return a stale response.
>
> An alternative would be a _network first_ strategy, in which we try to fetch the resource from the server first, and fall back to the cache if the device is offline.
>
> The optimal caching strategy is dependent on the particular web app and how it is used.

