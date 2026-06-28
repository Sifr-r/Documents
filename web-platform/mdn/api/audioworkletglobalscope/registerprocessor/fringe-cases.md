# Fringe Cases

## Warnings & Notes

> [!NOTE]
> A key-value pair `{ name: constructor }`
> is saved internally in the {{domxref("AudioWorkletGlobalScope")}} once the processor
> is registered. The _name_ is to be referred to when creating an
> {{domxref("AudioWorkletNode")}} based on the registered processor. A new processor by
> the given name is internally created and associated with the new node.

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown under the following conditions:
    - The _name_ is an empty string.
    - A constructor under the given _name_ is already registered. Registering
      the same name twice is not allowed.

- {{jsxref("TypeError")}}
  - : Thrown under the following conditions:
    - The _processorCtor_ is not a callable constructor.
    - The {{domxref("AudioWorkletProcessor.parameterDescriptors", "parameterDescriptors")}} property of the constructor exists and doesn't return an array of {{domxref("AudioParamDescriptor")}}-based objects.

