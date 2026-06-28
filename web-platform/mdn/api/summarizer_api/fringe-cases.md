# Fringe Cases

## Warnings & Notes

> [!NOTE]
   > If you want to check whether the browser AI model is able to support your preferences, you can do so with the {{domxref("Summarizer.availability_static", "Summarizer.availability()")}} static method.

## Security Notes

The specification requires that a user has recently interacted with the page when creating `Summarizer` objects ([transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required).

In addition, the specification controls access to the API via {{httpheader('Permissions-Policy/summarizer','summarizer')}} {{httpheader("Permissions-Policy")}} directives.

