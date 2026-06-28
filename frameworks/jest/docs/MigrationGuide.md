# Migrating to Jest

## Introduction

If you'd like to try out Jest with an existing codebase, there are a number of ways to convert to Jest:

- If you are using Jasmine, or a Jasmine like API (for example [Mocha](https://mochajs.org)), Jest should be mostly compatible, which makes it less complicated to migrate to.
- If you are using AVA, Expect.js (by Automattic), Jasmine, Mocha, proxyquire, Should.js or Tape you can automatically migrate with Jest Codemods (see below).
- If you like [chai](http://chaijs.com/), you can upgrade to Jest and continue using chai. However, we recommend trying out Jest's assertions and their failure messages. Jest Codemods can migrate from chai (see below).

