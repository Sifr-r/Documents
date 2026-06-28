# class-testerror

## property: TestError.cause

* since: v1.49
- type: ?<[TestError]>

Error cause. Set when there is a [cause](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause) for the error. Will be `undefined` if there is no cause or if the cause is not an instance of [Error].

## property: TestError.location

* since: v1.30
- type: ?<[Location]>

Error location in the source code.

## property: TestError.snippet

* since: v1.33
- type: ?<[string]>

Source code snippet with highlighted error.

