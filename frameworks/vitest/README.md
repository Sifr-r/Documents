# Vitest

Vitest documentation library.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| import-example | [docs/advanced/api/import-example.md](docs/advanced/api/import-example.md) |  |
| Advanced API | [docs/advanced/api/index.md](docs/advanced/api/index.md) | ::: warning This guide lists advanced APIs to run tests via a Node.js script. If you just want to [run tests](/guide/... |
| Plugin API | [docs/advanced/api/plugin.md](docs/advanced/api/plugin.md) | ::: warning This is an advanced API. If you just want to [run tests](/guide/), you probably don't need this. It is pr... |
| reporters | [docs/advanced/api/reporters.md](docs/advanced/api/reporters.md) | ::: warning This is an advanced API. If you just want to configure built-in reporters, read the ["Reporters"](/guide/... |
| test-case | [docs/advanced/api/test-case.md](docs/advanced/api/test-case.md) | The `TestCase` class represents a single test. This class is only available in the main thread. Refer to the ["Runner... |
| test-collection | [docs/advanced/api/test-collection.md](docs/advanced/api/test-collection.md) | `TestCollection` represents a collection of top-level [suites](/advanced/api/test-suite) and [tests](/advanced/api/te... |
| test-module | [docs/advanced/api/test-module.md](docs/advanced/api/test-module.md) | The `TestModule` class represents a single module in a single project. This class is only available in the main threa... |
| TestProject | [docs/advanced/api/test-project.md](docs/advanced/api/test-project.md) | ::: warning This guide describes the advanced Node.js API. If you just want to define projects, follow the ["Test Pro... |
| test-specification | [docs/advanced/api/test-specification.md](docs/advanced/api/test-specification.md) | The `TestSpecification` class describes what module to run as a test and its parameters. |
| test-suite | [docs/advanced/api/test-suite.md](docs/advanced/api/test-suite.md) | The `TestSuite` class represents a single suite. This class is only available in the main thread. Refer to the ["Runn... |
| Vitest API | [docs/advanced/api/vitest.md](docs/advanced/api/vitest.md) | Vitest instance requires the current test mode. It can be either: |
| tests | [docs/advanced/guide/tests.md](docs/advanced/guide/tests.md) | ::: warning This guide explains how to use the advanced API to run tests via a Node.js script. If you just want to [r... |
| metadata | [docs/advanced/metadata.md](docs/advanced/metadata.md) | ::: warning Vitest exposes experimental private API. Breaking changes might not follow SemVer, please pin Vitest's ve... |
| pool | [docs/advanced/pool.md](docs/advanced/pool.md) | ::: warning This is an advanced and very low-level API. If you just want to [run tests](/guide/), you probably don't ... |
| reporters | [docs/advanced/reporters.md](docs/advanced/reporters.md) | ::: warning This is an advanced API. If you just want to configure built-in reporters, read the ["Reporters"](/guide/... |
| runner | [docs/advanced/runner.md](docs/advanced/runner.md) | ::: warning This is advanced API. If you just want to [run tests](/guide/), you probably don't need this. It is prima... |
| assert-type | [docs/api/assert-type.md](docs/api/assert-type.md) | ::: warning During runtime this function doesn't do anything. To [enable typechecking](/guide/testing-types#run-typec... |
| assert | [docs/api/assert.md](docs/api/assert.md) | Vitest reexports the `assert` method from [`chai`](https://www.chaijs.com/api/assert/) for verifying invariants. |
| expect-typeof | [docs/api/expect-typeof.md](docs/api/expect-typeof.md) | ::: warning During runtime this function doesn't do anything. To [enable typechecking](/guide/testing-types#run-typec... |
| expect | [docs/api/expect.md](docs/api/expect.md) | The following types are used in the type signatures below |
| index | [docs/api/index.md](docs/api/index.md) | The following types are used in the type signatures below |
| mock | [docs/api/mock.md](docs/api/mock.md) | You can create a mock function to track its execution with `vi.fn` method. If you want to track a method on an alread... |
| vi | [docs/api/vi.md](docs/api/vi.md) | Vitest provides utility functions to help you out through its `vi` helper. You can access it globally (when [globals ... |
| blog | [docs/blog.md](docs/blog.md) |  |
| Vitest 3.2 is out! | [docs/blog/vitest-3-2.md](docs/blog/vitest-3-2.md) | _June 2, 2025_ |
| Vitest 3.0 is out! | [docs/blog/vitest-3.md](docs/blog/vitest-3.md) | _January 17, 2025_ |
| index | [docs/config/index.md](docs/config/index.md) | If you are using Vite and have a `vite.config` file, Vitest will read it to match with the plugins and setup as your ... |
| Assertion API | Browser Mode | [docs/guide/browser/assertion-api.md](docs/guide/browser/assertion-api.md) | Vitest provides a wide range of DOM assertions out of the box forked from [`@testing-library/jest-dom`](https://githu... |
| Commands | Browser Mode | [docs/guide/browser/commands.md](docs/guide/browser/commands.md) | Command is a function that invokes another function on the server and passes down the result back to the browser. Vit... |
| config | [docs/guide/browser/config.md](docs/guide/browser/config.md) | You can change the browser configuration by updating the `test.browser` field in your [config file](/config/). An exa... |
| Context API | Browser Mode | [docs/guide/browser/context.md](docs/guide/browser/context.md) | Vitest exposes a context module via `@vitest/browser/context` entry point. As of 2.0, it exposes a small set of utili... |
| Browser Mode | Guide | [docs/guide/browser/index.md](docs/guide/browser/index.md) | This page provides information about the experimental browser mode feature in the Vitest API, which allows you to run... |
| Interactivity API | Browser Mode | [docs/guide/browser/interactivity-api.md](docs/guide/browser/interactivity-api.md) | Vitest implements a subset of [`@testing-library/user-event`](https://testing-library.com/docs/user-event/intro) APIs... |
| Locators | Browser Mode | [docs/guide/browser/locators.md](docs/guide/browser/locators.md) | A locator is a representation of an element or a number of elements. Every locator is defined by a string called a se... |
| multiple-setups | [docs/guide/browser/multiple-setups.md](docs/guide/browser/multiple-setups.md) | Since Vitest 3, you can specify several different browser setups using the new [`browser.instances`](/guide/browser/c... |
| playwright | [docs/guide/browser/playwright.md](docs/guide/browser/playwright.md) | By default, TypeScript doesn't recognize providers options and extra `expect` properties. Make sure to reference `@vi... |
| webdriverio | [docs/guide/browser/webdriverio.md](docs/guide/browser/webdriverio.md) | ::: info Playwright vs WebdriverIO If you do not already use WebdriverIO in your project, we recommend starting with ... |
| Why Browser Mode | Browser Mode | [docs/guide/browser/why.md](docs/guide/browser/why.md) | We developed the Vitest browser mode feature to help improve testing workflows and achieve more accurate and reliable... |
| cli-generated | [docs/guide/cli-generated.md](docs/guide/cli-generated.md) | - **CLI:** `-r, --root <path>` - **Config:** [root](/config/#root) |
| Command Line Interface | Guide | [docs/guide/cli.md](docs/guide/cli.md) | Start Vitest in the current directory. Will enter the watch mode in development environment and run mode in CI (or no... |
| Common Errors | Guide | [docs/guide/common-errors.md](docs/guide/common-errors.md) | If you receive an error that module cannot be found, it might mean several different things: |
| Comparisons with Other Test Runners | Guide | [docs/guide/comparisons.md](docs/guide/comparisons.md) | [Jest](https://jestjs.io/) took over the Testing Framework space by providing out-of-the-box support for most JavaScr... |
| Coverage | Guide | [docs/guide/coverage.md](docs/guide/coverage.md) | Both `v8` and `istanbul` support are optional. By default, `v8` will be used. |
| Debugging | Guide | [docs/guide/debugging.md](docs/guide/debugging.md) | :::tip When debugging tests you might want to use following options: |
| Test Environment | Guide | [docs/guide/environment.md](docs/guide/environment.md) | Vitest provides [`environment`](/config/#environment) option to run code inside a specific environment. You can modif... |
| Extending Matchers | Guide | [docs/guide/extending-matchers.md](docs/guide/extending-matchers.md) | Since Vitest is compatible with both Chai and Jest, you can use either the `chai.use` API or `expect.extend`, whichev... |
| Features | Guide | [docs/guide/features.md](docs/guide/features.md) | Vite's config, transformers, resolvers, and plugins. Use the same setup from your app to run the tests. |
| Test Filtering | Guide | [docs/guide/filtering.md](docs/guide/filtering.md) | Filtering, timeouts, concurrent for suite and tests |
| improving-performance | [docs/guide/improving-performance.md](docs/guide/improving-performance.md) | By default Vitest runs every test file in an isolated environment based on the [pool](/config/#pool): |
| In-Source Testing | Guide | [docs/guide/in-source.md](docs/guide/in-source.md) | Vitest provides a way to run tests within your source code along side the implementation, similar to [Rust's module t... |
| Getting Started | Guide | [docs/guide/index.md](docs/guide/index.md) | Vitest (pronounced as _"veetest"_) is a next generation testing framework powered by Vite. |
| Migration Guide | Guide | [docs/guide/migration.md](docs/guide/migration.md) | Vitest 3.0 prints a warning if you pass down an object as a third argument to `test` or `describe` functions: |
| Mocking | Guide | [docs/guide/mocking.md](docs/guide/mocking.md) | When writing tests it's only a matter of time before you need to create a "fake" version of an internal — or external... |
| Parallelism | Guide | [docs/guide/parallelism.md](docs/guide/parallelism.md) | By default, Vitest runs _test files_ in parallel. Depending on the specified `pool`, Vitest uses a different mechanis... |
| profiling-test-performance | [docs/guide/profiling-test-performance.md](docs/guide/profiling-test-performance.md) | When you run Vitest it reports multiple time metrics of your tests: |
| Test Projects | Guide | [docs/guide/projects.md](docs/guide/projects.md) | ::: tip Sample Project |
| Reporters | Guide | [docs/guide/reporters.md](docs/guide/reporters.md) | Vitest provides several built-in reporters to display test output in different formats, as well as the ability to use... |
| Snapshot | Guide | [docs/guide/snapshot.md](docs/guide/snapshot.md) | Snapshot tests are a very useful tool whenever you want to make sure the output of your functions does not change une... |
| Test Annotations | Guide | [docs/guide/test-annotations.md](docs/guide/test-annotations.md) | Vitest supports annotating your tests with custom messages and files via the [`context.annotate`](/guide/test-context... |
| Test Context | Guide | [docs/guide/test-context.md](docs/guide/test-context.md) | Inspired by [Playwright Fixtures](https://playwright.dev/docs/test-fixtures), Vitest's test context allows you to def... |
| Testing Types | Guide | [docs/guide/testing-types.md](docs/guide/testing-types.md) | ::: tip Sample Project |
| Vitest UI | Guide | [docs/guide/ui.md](docs/guide/ui.md) | Powered by Vite, Vitest also has a dev server under the hood when running the tests. This allows Vitest to provide a ... |
| Using Plugins | Guide | [docs/guide/using-plugins.md](docs/guide/using-plugins.md) | Vitest can be extended using plugins, similar to how Vite plugins work. This allows you to enhance and customize Vite... |
| Why Vitest | Guide | [docs/guide/why.md](docs/guide/why.md) | Vite's out-of-the-box support for common web patterns, features like glob imports and SSR primitives, and its many pl... |
| Meet the Team | [docs/team.md](docs/team.md) |  |
