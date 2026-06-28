# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > For backward compatibility with older versions of the WebRTC specification, the constructor also accepts this string directly as an argument.

> [!NOTE]
> Parsing of the `candidate` string is performed using the [candidate-attribute grammar](https://w3c.github.io/webrtc-pc/#candidate-attribute-grammar) from the WebRTC Specification.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the specified `candidateInfo` has values of `null` in **both** the `sdpMid` and `sdpMLineIndex` properties.

