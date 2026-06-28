# Test Runners

## Introduction

While Playwright for .NET isn't tied to a particular test runner or testing framework, in our experience the easiest way of getting started is by using the base classes we provide for MSTest, NUnit, xUnit, or xUnit v3. These classes support running tests on multiple browser engines, adjusting launch/context options and getting a [Page]/[BrowserContext] instance per test out of the box. 

Playwright and Browser instances will be reused between tests for better performance. We
recommend running each test case in a new BrowserContext, this way browser state will be
isolated between the tests.

<Tabs
  groupId="test-runners"
  defaultValue="mstest"
  values={[
    {label: 'MSTest', value: 'mstest'},
    {label: 'NUnit', value: 'nunit'},
    {label: 'xUnit', value: 'xunit'},
    {label: 'xUnit v3', value: 'xunit-v3'},
  ]
}>
<TabItem value="nunit">

Playwright provides base classes to write tests with NUnit via the [`Microsoft.Playwright.NUnit`](https://www.nuget.org/packages/Microsoft.Playwright.NUnit) package.

<TabItem value="mstest">

Playwright provides base classes to write tests with MSTest via the [`Microsoft.Playwright.MSTest`](https://www.nuget.org/packages/Microsoft.Playwright.MSTest) package.

<TabItem value="xunit">

Playwright provides base classes to write tests with xUnit via the [`Microsoft.Playwright.Xunit`](https://www.nuget.org/packages/Microsoft.Playwright.Xunit) package.

<TabItem value="xunit-v3">

Playwright provides base classes to write tests with xUnit v3 via the [`Microsoft.Playwright.Xunit.v3`](https://www.nuget.org/packages/Microsoft.Playwright.Xunit.v3) package.

Check out the [installation guide](./intro.md) to get started.

## Running tests in Parallel

<Tabs
  groupId="test-runners"
  defaultValue="mstest"
  values={[
    {label: 'MSTest', value: 'mstest'},
    {label: 'NUnit', value: 'nunit'},
    {label: 'xUnit', value: 'xunit'},
    {label: 'xUnit v3', value: 'xunit-v3'},
  ]
}>
<TabItem value="nunit">

By default NUnit will run all test files in parallel, while running tests inside each file sequentially (`ParallelScope.Self`). It will create as many processes as there are cores on the host system. You can adjust this behavior using the NUnit.NumberOfTestWorkers parameter.
Only `ParallelScope.Self` is supported.

For CPU-bound tests, we recommend using as many workers as there are cores on your system, divided by 2. For IO-bound tests you can use as many workers as you have cores.

```bash
dotnet test -- NUnit.NumberOfTestWorkers=5
```

<TabItem value="mstest">

By default MSTest will run all classes in parallel, while running tests inside each class sequentially (`ExecutionScope.ClassLevel`). It will create as many processes as there are cores on the host system. You can adjust this behavior by using the following CLI parameter or using a `.runsettings` file, see below.
Running tests in parallel at the method level (`ExecutionScope.MethodLevel`) is not supported.

```bash
dotnet test --settings:.runsettings -- MSTest.Parallelize.Workers=4
```

<TabItem value="xunit">

By default xUnit will run all classes in parallel, while running tests inside each class sequentially.
It will create by default as many processes as there are cores on the system. You can adjust this behavior by using the following CLI parameter or using a `.runsettings` file, see below.

```bash
dotnet test -- xUnit.MaxParallelThreads=5
```

:::note
We recommend xUnit 2.8+ which uses the [`conservative` parallelism algorithm](https://xunit.net/docs/running-tests-in-parallel.html#algorithms) by default.
:::

<TabItem value="xunit-v3">

By default xUnit v3 will run all classes in parallel, while running tests inside each class sequentially.
It will create by default as many processes as there are cores on the system. You can adjust this behavior by using the following CLI parameter or using a `.runsettings` file, see below.

```bash
dotnet test -- xUnit.MaxParallelThreads=5
```

:::note
xUnit v3 uses the [`conservative` parallelism algorithm](https://xunit.net/docs/running-tests-in-parallel.html#algorithms) by default.
:::

## Customizing [BrowserContext] options

<Tabs
  groupId="test-runners"
  defaultValue="mstest"
  values={[
    {label: 'MSTest', value: 'mstest'},
    {label: 'NUnit', value: 'nunit'},
    {label: 'xUnit', value: 'xunit'},
    {label: 'xUnit v3', value: 'xunit-v3'},
  ]
}>
<TabItem value="nunit">

To customize context options, you can override the `ContextOptions` method of your test class derived from `Microsoft.Playwright.NUnit.PageTest` or `Microsoft.Playwright.NUnit.ContextTest`. See the following example:

```csharp
using Microsoft.Playwright.NUnit;

namespace PlaywrightTests;

[Parallelizable(ParallelScope.Self)]
[TestFixture]
public class MyTest : PageTest
{
    [Test]
    public async Task TestWithCustomContextOptions()
    {
        // The following Page (and BrowserContext) instance has the custom colorScheme, viewport and baseURL set:
        await Page.GotoAsync("/login");
    }

    public override BrowserNewContextOptions ContextOptions()
    {
        return new BrowserNewContextOptions()
        {
            ColorScheme = ColorScheme.Light,
            ViewportSize = new()
            {
                Width = 1920,
                Height = 1080
            },
            BaseURL = "https://github.com",
        };
    }
}
```

<TabItem value="mstest">

To customize context options, you can override the `ContextOptions` method of your test class derived from `Microsoft.Playwright.MSTest.PageTest` or `Microsoft.Playwright.MSTest.ContextTest`. See the following example:

```csharp
using System.Threading.Tasks;
using Microsoft.Playwright;
using Microsoft.Playwright.MSTest;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace PlaywrightTests;

[TestClass]
public class ExampleTest : PageTest
{
    [TestMethod]
    public async Task TestWithCustomContextOptions()
    {
        // The following Page (and BrowserContext) instance has the custom colorScheme, viewport and baseURL set:
        await Page.GotoAsync("/login");
    }

    public override BrowserNewContextOptions ContextOptions()
    {
        return new BrowserNewContextOptions()
        {
            ColorScheme = ColorScheme.Light,
            ViewportSize = new()
            {
                Width = 1920,
                Height = 1080
            },
            BaseURL = "https://github.com",
        };
    }
}

```

<TabItem value="xunit">

To customize context options, you can override the `ContextOptions` method of your test class derived from `Microsoft.Playwright.Xunit.PageTest` or `Microsoft.Playwright.Xunit.ContextTest`. See the following example:

```csharp
using Microsoft.Playwright;
using Microsoft.Playwright.Xunit;

namespace PlaywrightTests;

## Customizing [BrowserContext] options (part 2)

public class UnitTest1 : PageTest
{
    [Fact]
    public async Task TestWithCustomContextOptions()
    {
        // The following Page (and BrowserContext) instance has the custom colorScheme, viewport and baseURL set:
        await Page.GotoAsync("/login");
    }
    public override BrowserNewContextOptions ContextOptions()
    {
        return new BrowserNewContextOptions()
        {
            ColorScheme = ColorScheme.Light,
            ViewportSize = new()
            {
                Width = 1920,
                Height = 1080
            },
            BaseURL = "https://github.com",
        };
    }
}
```

<TabItem value="xunit-v3">

To customize context options, you can override the `ContextOptions` method of your test class derived from `Microsoft.Playwright.Xunit.v3.PageTest` or `Microsoft.Playwright.Xunit.v3.ContextTest`. See the following example:

```csharp
using Microsoft.Playwright;
using Microsoft.Playwright.Xunit.v3;

namespace PlaywrightTests;

public class UnitTest1 : PageTest
{
    [Fact]
    public async Task TestWithCustomContextOptions()
    {
        // The following Page (and BrowserContext) instance has the custom colorScheme, viewport and baseURL set:
        await Page.GotoAsync("/login");
    }
    public override BrowserNewContextOptions ContextOptions()
    {
        return new BrowserNewContextOptions()
        {
            ColorScheme = ColorScheme.Light,
            ViewportSize = new()
            {
                Width = 1920,
                Height = 1080
            },
            BaseURL = "https://github.com",
        };
    }
}
```

## Customizing [Browser]/launch options

[Browser]/launch options can be overridden either using a run settings file or by setting the run settings options directly via the
CLI. See the following example:

```xml
<?xml version="1.0" encoding="utf-8"?>

  
    chromium
    
      false
      msedge
    
  

```

```bash
dotnet test -- Playwright.BrowserName=chromium Playwright.LaunchOptions.Headless=false Playwright.LaunchOptions.Channel=msedge
```

## Using Verbose API Logs

When you have enabled the [verbose API log](./debug.md#verbose-api-logs), via the `DEBUG` environment variable, you will see the messages in the standard error stream. Within Visual Studio, that will be the `Tests` pane of the `Output` window. It will also be displayed in the `Test Log` for each test.

## Using the .runsettings file

When running tests from Visual Studio, you can take advantage of the `.runsettings` file. The following shows a reference of the supported values.

<Tabs
  groupId="test-runners"
  defaultValue="mstest"
  values={[
    {label: 'MSTest', value: 'mstest'},
    {label: 'NUnit', value: 'nunit'},
    {label: 'xUnit', value: 'xunit'},
    {label: 'xUnit v3', value: 'xunit-v3'},
  ]
}>
<TabItem value="nunit">

For example, to specify the number of workers you can use `NUnit.NumberOfTestWorkers` or to enable `DEBUG` logs `RunConfiguration.EnvironmentVariables`.

```xml
<?xml version="1.0" encoding="utf-8"?>

  <!-- NUnit adapter -->  
  
    24
  
  <!-- General run configuration -->
  
    
      <!-- For debugging selectors, it's recommend to set the following environment variable -->
      pw:api
    
  
  <!-- Playwright -->  
  
    chromium
    5000
    
      false
      msedge
    
  

```

<TabItem value="mstest">

For example, to specify the number of workers, you can use `MSTest.Parallelize.Workers`. You can also enable `DEBUG` logs using `RunConfiguration.EnvironmentVariables`.

```xml

  <!-- MSTest adapter -->  
  
    
      4
      ClassLevel
    
  
  <!-- General run configuration -->
  
    
      <!-- For debugging selectors, it's recommend to set the following environment variable -->
      pw:api
    
  
  <!-- Playwright -->  
  
    chromium
    5000
    
      false
      msedge
    
  

```

<TabItem value="xunit">

For example, to specify the number of workers, you can use `xUnit.MaxParallelThreads`. You can also enable `DEBUG` logs using `RunConfiguration.EnvironmentVariables`.

```xml
<?xml version="1.0" encoding="utf-8"?>

  <!-- See https://xunit.net/docs/runsettings -->
  <xUnit>
    1
  </xUnit>
  <!-- General run configuration -->
  
    
      <!-- For debugging selectors, it's recommend to set the following environment variable -->
      pw:api
    
  
  <!-- Playwright -->  
  
    chromium
    5000
    
      false
      msedge
    
  

```

<TabItem value="xunit-v3">

For example, to specify the number of workers, you can use `xUnit.MaxParallelThreads`. You can also enable `DEBUG` logs using `RunConfiguration.EnvironmentVariables`.

```xml
<?xml version="1.0" encoding="utf-8"?>

  <!-- See https://xunit.net/docs/runsettings -->
  <xUnit>
    1
  </xUnit>
  <!-- General run configuration -->
  
    
      <!-- For debugging selectors, it's recommend to set the following environment variable -->
      pw:api
    
  
  <!-- Playwright -->  
  
    chromium
    5000
    
      false
      msedge
    
  

```

## Base classes for Playwright

<Tabs
  groupId="test-runners"
  defaultValue="mstest"
  values={[
    {label: 'MSTest', value: 'mstest'},
    {label: 'NUnit', value: 'nunit'},
    {label: 'xUnit', value: 'xunit'},
    {label: 'xUnit v3', value: 'xunit-v3'},
  ]
}>
<TabItem value="nunit">

There are a few base classes available to you in `Microsoft.Playwright.NUnit` namespace:

<TabItem value="mstest">

There are a few base classes available to you in `Microsoft.Playwright.MSTest` namespace:

<TabItem value="xunit">

There are a few base classes available to you in `Microsoft.Playwright.Xunit` namespace:

<TabItem value="xunit-v3">

There are a few base classes available to you in `Microsoft.Playwright.Xunit.v3` namespace:

|Test          |Description|
|--------------|-----------|
|PageTest      |Each test gets a fresh copy of a web [Page] created in its own unique [BrowserContext]. Extending this class is the simplest way of writing a fully-functional Playwright test.<br></br><br></br>Note: You can override the `ContextOptions` method in each test file to control context options, the ones typically passed into the [`method: Browser.newContext`] method. That way you can specify all kinds of emulation options for your test file individually.|
|ContextTest   |Each test will get a fresh copy of a [BrowserContext]. You can create as many pages in this context as you'd like. Using this test is the easiest way to test multi-page scenarios where you need more than one tab.<br></br><br></br>Note: You can override the `ContextOptions` method in each test file to control context options, the ones typically passed into the [`method: Browser.newContext`] method. That way you can specify all kinds of emulation options for your test file individually.|
|BrowserTest   |Each test will get a browser and can create as many contexts as it likes. Each test is responsible for cleaning up all the contexts it created.|
|PlaywrightTest|This gives each test a Playwright object so that the test could start and stop as many browsers as it likes.|

