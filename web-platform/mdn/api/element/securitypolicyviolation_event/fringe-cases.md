# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You should generally add the handler for this event to a top level object (i.e., {{domxref("Window")}} or {{domxref("Document")}}).
> While HTML elements can technically be the target of the `securitypolicyviolation` event, in reality this event does not fire on them—for example, a blocked `<img>` source directly triggers this event on `document` as the target, instead of bubbling from the `<img>` element.

