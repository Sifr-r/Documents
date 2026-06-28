# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If you want to share data using the Web Share API, see [Web Share API](/en-US/docs/Web/API/Web_Share_API) and [`navigator.share()`](/en-US/docs/Web/API/Navigator/share).

## Security Notes

Your PWA can only act as a web share target if it has been installed. See also [How to make PWAs installable](/en-US/docs/Web/Progressive_web_apps/Tutorials/js13kGames/Installable_PWAs).

Similar to HTML form submissions, you should be cautious about data that is sent to your application via the share target. Be sure to validate incoming data before using it.

