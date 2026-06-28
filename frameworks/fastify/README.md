# Fastify

Fastify documentation library.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Benchmarking | [docs/Guides/Benchmarking.md](docs/Guides/Benchmarking.md) | Benchmarking is important if you want to measure how a change can affect your application's performance. We provide a... |
| Database | [docs/Guides/Database.md](docs/Guides/Database.md) | Fastify's ecosystem provides a handful of plugins for connecting to various database engines. This guide covers engin... |
| Delay-Accepting-Requests | [docs/Guides/Delay-Accepting-Requests.md](docs/Guides/Delay-Accepting-Requests.md) | Fastify provides several [hooks](../Reference/Hooks.md) useful for a variety of situations. One of them is the [`onRe... |
| Detecting-When-Clients-Abort | [docs/Guides/Detecting-When-Clients-Abort.md](docs/Guides/Detecting-When-Clients-Abort.md) | Fastify provides request events to trigger at certain points in a request's lifecycle. However, there isn't a built-i... |
| Fluent-Schema | [docs/Guides/Fluent-Schema.md](docs/Guides/Fluent-Schema.md) | The [Validation and Serialization](../Reference/Validation-and-Serialization.md) documentation outlines all parameter... |
| Getting-Started | [docs/Guides/Getting-Started.md](docs/Guides/Getting-Started.md) | Hello! Thank you for checking out Fastify! |
| Migration-Guide-V3 | [docs/Guides/Migration-Guide-V3.md](docs/Guides/Migration-Guide-V3.md) | This guide is intended to help with migration from Fastify v2 to v3. |
| Migration-Guide-V4 | [docs/Guides/Migration-Guide-V4.md](docs/Guides/Migration-Guide-V4.md) | This guide is intended to help with migration from Fastify v3 to v4. |
| Migration-Guide-V5 | [docs/Guides/Migration-Guide-V5.md](docs/Guides/Migration-Guide-V5.md) | This guide is intended to help with migration from Fastify v4 to v5. |
| Plugins-Guide | [docs/Guides/Plugins-Guide.md](docs/Guides/Plugins-Guide.md) | Fastify was built from the beginning to be an extremely modular system. We built a powerful API that allows you to ad... |
| Prototype-Poisoning | [docs/Guides/Prototype-Poisoning.md](docs/Guides/Prototype-Poisoning.md) | > The following is an article written by Eran Hammer. > It is reproduced here for posterity [with permission](https:/... |
| Recommendations | [docs/Guides/Recommendations.md](docs/Guides/Recommendations.md) | Node.js is an early adopter of frameworks shipping with an easy-to-use web server within the standard library. Previo... |
| Serverless | [docs/Guides/Serverless.md](docs/Guides/Serverless.md) | Run serverless applications and REST APIs using your existing Fastify application. You may need to make code changes ... |
| Style-Guide | [docs/Guides/Style-Guide.md](docs/Guides/Style-Guide.md) | Welcome to *Fastify Style Guide*. This guide is here to provide you with a conventional writing style for users writi... |
| Testing | [docs/Guides/Testing.md](docs/Guides/Testing.md) | Testing is one of the most important parts of developing an application. Fastify is very flexible when it comes to te... |
| Write-Plugin | [docs/Guides/Write-Plugin.md](docs/Guides/Write-Plugin.md) | The core principles of Fastify are performance, low overhead, and providing a good experience to our users. When writ... |
| Write-Type-Provider | [docs/Guides/Write-Type-Provider.md](docs/Guides/Write-Type-Provider.md) | Things to keep in mind when implementing a custom [type provider](../Reference/Type-Providers.md): |
| ContentTypeParser | [docs/Reference/ContentTypeParser.md](docs/Reference/ContentTypeParser.md) | Fastify natively supports `'application/json'` and `'text/plain'` content types with a default charset of `utf-8`. Th... |
| Decorators | [docs/Reference/Decorators.md](docs/Reference/Decorators.md) | The decorators API customizes core Fastify objects, such as the server instance and any request and reply objects use... |
| Encapsulation | [docs/Reference/Encapsulation.md](docs/Reference/Encapsulation.md) | A fundamental feature of Fastify is the "encapsulation context." It governs which [decorators](./Decorators.md), regi... |
| Errors | [docs/Reference/Errors.md](docs/Reference/Errors.md) | **Table of contents** - [Errors](#errors)   - [Error Handling In Node.js](#error-handling-in-nodejs)     - [Uncaught ... |
| HTTP2 | [docs/Reference/HTTP2.md](docs/Reference/HTTP2.md) | _Fastify_ supports HTTP2 over HTTPS (h2) or plaintext (h2c). |
| Hooks | [docs/Reference/Hooks.md](docs/Reference/Hooks.md) | [Request](./Request.md) and [Reply](./Reply.md) are the core Fastify objects. |
| Index | [docs/Reference/Index.md](docs/Reference/Index.md) | For the full table of contents (TOC), see [below](#reference-toc). The following list is a subset of the full TOC tha... |
| LTS | [docs/Reference/LTS.md](docs/Reference/LTS.md) | Fastify's Long Term Support (LTS) is provided according to the schedule laid out in this document: |
| Lifecycle | [docs/Reference/Lifecycle.md](docs/Reference/Lifecycle.md) | This schema shows the internal lifecycle of Fastify. |
| Logging | [docs/Reference/Logging.md](docs/Reference/Logging.md) | As Fastify is focused on performance, it uses [pino](https://github.com/pinojs/pino) as its logger, with the default ... |
| Middleware | [docs/Reference/Middleware.md](docs/Reference/Middleware.md) | Starting with Fastify v3.0.0, middleware is not supported out of the box and requires an external plugin such as [`@f... |
| Plugins | [docs/Reference/Plugins.md](docs/Reference/Plugins.md) | Fastify can be extended with plugins, which can be a set of routes, a server [decorator](./Decorators.md), or other f... |
| Principles | [docs/Reference/Principles.md](docs/Reference/Principles.md) | Every decision in the Fastify framework and its official plugins is guided by the following technical principles: |
| Reply | [docs/Reference/Reply.md](docs/Reference/Reply.md) | - [Reply](#reply)   - [Introduction](#introduction)   - [.code(statusCode)](#codestatuscode)   - [.elapsedTime](#elap... |
| Request | [docs/Reference/Request.md](docs/Reference/Request.md) | The first parameter of the handler function is `Request`. |
| Routes | [docs/Reference/Routes.md](docs/Reference/Routes.md) | The route methods configure the endpoints of the application. Routes can be declared using the shorthand method or th... |
| Server | [docs/Reference/Server.md](docs/Reference/Server.md) | The Fastify module exports a factory function that is used to create new <code><b>Fastify server</b></code> instances... |
| Type-Providers | [docs/Reference/Type-Providers.md](docs/Reference/Type-Providers.md) | Type Providers are a TypeScript feature that enables Fastify to infer type information from inline JSON Schema. They ... |
| TypeScript | [docs/Reference/TypeScript.md](docs/Reference/TypeScript.md) | The Fastify framework is written in vanilla JavaScript, and as such type definitions are not as easy to maintain; how... |
| Validation-and-Serialization | [docs/Reference/Validation-and-Serialization.md](docs/Reference/Validation-and-Serialization.md) | Fastify uses a schema-based approach. We recommend using [JSON Schema](https://json-schema.org/) to validate routes a... |
| Warnings | [docs/Reference/Warnings.md](docs/Reference/Warnings.md) | Fastify uses Node.js's [warning event](https://nodejs.org/api/process.html#event-warning) API to notify users of depr... |
| index | [docs/index.md](docs/index.md) | The documentation for Fastify is split into two categories: |
