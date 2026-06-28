# Jest

Jest documentation library.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Architecture | [docs/Architecture.md](docs/Architecture.md) | If you are interested in learning more about how Jest works, understand its architecture, and how Jest is split up in... |
| Bypassing module mocks | [docs/BypassingModuleMocks.md](docs/BypassingModuleMocks.md) | Jest allows you to mock out whole modules in your tests, which can be useful for testing if your code is calling func... |
| Jest CLI Options | [docs/CLI.md](docs/CLI.md) | The `jest` command line runner has a number of useful options. You can run `jest --help` to view all available option... |
| Code Transformation | [docs/CodeTransformation.md](docs/CodeTransformation.md) | Jest runs the code in your project as JavaScript, but if you use some syntax not supported by Node out of the box (su... |
| Configuring Jest | [docs/Configuration.md](docs/Configuration.md) | The Jest philosophy is to work great by default, but sometimes you just need more configuration power. |
| Using with DynamoDB | [docs/DynamoDB.md](docs/DynamoDB.md) | [Jest DynamoDB](https://github.com/shelfio/jest-dynamodb) provides all required configuration to run your tests using... |
| ECMAScript Modules | [docs/ECMAScriptModules.md](docs/ECMAScriptModules.md) | :::caution |
| Environment Variables | [docs/EnvironmentVariables.md](docs/EnvironmentVariables.md) | Jest sets the following environment variables: |
| ES6 Class Mocks | [docs/Es6ClassMocks.md](docs/Es6ClassMocks.md) | Jest can be used to mock ES6 classes that are imported into files you want to test. |
| Expect | [docs/ExpectAPI.md](docs/ExpectAPI.md) | When you're writing tests, you often need to check that values meet certain conditions. `expect` gives you access to ... |
| Getting Started | [docs/GettingStarted.md](docs/GettingStarted.md) | Install Jest using your favorite package manager: |
| Globals | [docs/GlobalAPI.md](docs/GlobalAPI.md) | In your test files, Jest puts each of these methods and objects into the global environment. You don't have to requir... |
| Jest Community | [docs/JestCommunity.md](docs/JestCommunity.md) | The community around Jest is working hard to make the testing experience even greater. |
| The Jest Object | [docs/JestObjectAPI.md](docs/JestObjectAPI.md) | The `jest` object is automatically in scope within every test file. The methods in the `jest` object help create mock... |
| Jest Platform | [docs/JestPlatform.md](docs/JestPlatform.md) | You can cherry pick specific features of Jest and use them as standalone packages. Here's a list of the available pac... |
| Manual Mocks | [docs/ManualMocks.md](docs/ManualMocks.md) | Manual mocks are used to stub out functionality with mock data. For example, instead of accessing a remote resource l... |
| Migrating to Jest | [docs/MigrationGuide.md](docs/MigrationGuide.md) | If you'd like to try out Jest with an existing codebase, there are a number of ways to convert to Jest: |
| Mock Functions | [docs/MockFunctionAPI.md](docs/MockFunctionAPI.md) | Mock functions are also known as "spies", because they let you spy on the behavior of a function that is called indir... |
| Mock Functions | [docs/MockFunctions.md](docs/MockFunctions.md) | Mock functions allow you to test the links between code by erasing the actual implementation of a function, capturing... |
| Using with MongoDB | [docs/MongoDB.md](docs/MongoDB.md) | [Jest MongoDB](https://github.com/shelfio/jest-mongodb) provides all required configuration to run your tests using M... |
| More Resources | [docs/MoreResources.md](docs/MoreResources.md) | By now you should have a good idea of how Jest can help you test your applications. If you're interested in learning ... |
| Using with puppeteer | [docs/Puppeteer.md](docs/Puppeteer.md) | With the [Global Setup/Teardown](Configuration.md#globalsetup-string) and [Async Test Environment](Configuration.md#t... |
| Setup and Teardown | [docs/SetupAndTeardown.md](docs/SetupAndTeardown.md) | Often while writing tests you have some setup work that needs to happen before tests run, and you have some finishing... |
| Snapshot Testing | [docs/SnapshotTesting.md](docs/SnapshotTesting.md) | Snapshot tests are a very useful tool whenever you want to make sure your UI does not change unexpectedly. |
| Test Environment | [docs/TestEnvironment.md](docs/TestEnvironment.md) | Jest provides environment option to run code inside a specific environment. You can modify how environment behaves wi... |
| Testing Asynchronous Code | [docs/TestingAsyncCode.md](docs/TestingAsyncCode.md) | It's common in JavaScript for code to run asynchronously. When you have code that runs asynchronously, Jest needs to ... |
| Testing Web Frameworks | [docs/TestingFrameworks.md](docs/TestingFrameworks.md) | Jest is a universal testing platform, with the ability to adapt to any JavaScript library or framework. In this secti... |
| Timer Mocks | [docs/TimerMocks.md](docs/TimerMocks.md) | The native timer functions (i.e., `setTimeout()`, `setInterval()`, `clearTimeout()`, `clearInterval()`) are less than... |
| Troubleshooting | [docs/Troubleshooting.md](docs/Troubleshooting.md) | Uh oh, something went wrong? Use this guide to resolve issues with Jest. |
| An Async Example | [docs/TutorialAsync.md](docs/TutorialAsync.md) | First, enable Babel support in Jest as documented in the [Getting Started](GettingStarted.md#using-babel) guide. |
| Testing React Native Apps | [docs/TutorialReactNative.md](docs/TutorialReactNative.md) | Starting from react-native version 0.38, a Jest setup is included by default when running `npx @react-native-communit... |
| DOM Manipulation | [docs/TutorialjQuery.md](docs/TutorialjQuery.md) | Another class of functions that is often considered difficult to test is code that directly manipulates the DOM. Let'... |
| From v28 to v29 | [docs/UpgradingToJest29.md](docs/UpgradingToJest29.md) | Upgrading Jest from v28 to v29? This guide aims to help refactoring your configuration and tests. |
| From v29 to v30 | [docs/UpgradingToJest30.md](docs/UpgradingToJest30.md) | Upgrading Jest from v29 to v30? This guide aims to help refactoring your configuration and tests. |
| Using Matchers | [docs/UsingMatchers.md](docs/UsingMatchers.md) | Jest uses "matchers" to let you test values in different ways. This document will introduce some commonly used matche... |
| Watch Plugins | [docs/WatchPlugins.md](docs/WatchPlugins.md) | The Jest watch plugin system provides a way to hook into specific parts of Jest and to define watch mode menu prompts... |
| Using with webpack | [docs/Webpack.md](docs/Webpack.md) | Jest can be used in projects that use [webpack](https://webpack.js.org/) to manage assets, styles, and compilation. w... |
| _TypeScriptExamplesNote | [docs/_TypeScriptExamplesNote.md](docs/_TypeScriptExamplesNote.md) | :::info |
