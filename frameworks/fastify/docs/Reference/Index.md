# Index

## Core Documents

<a id="reference-core-docs"></a>

For the full table of contents (TOC), see [below](#reference-toc). The following
list is a subset of the full TOC that detail core Fastify APIs and concepts in
order of most likely importance to the reader:

+ [Server](./Server.md): Documents the core Fastify API. Includes documentation
  for the factory function and the object returned by the factory function.
+ [Lifecycle](./Lifecycle.md): Explains the Fastify request lifecycle and
  illustrates where [Hooks](./Hooks.md) are available for integrating with it.
+ [Routes](./Routes.md): Details how to register routes with Fastify and how
  Fastify builds and evaluates the routing trie.
+ [Request](./Request.md): Details Fastify's request object that is passed into
  each request handler.
+ [Reply](./Reply.md): Details Fastify's response object available to each
  request handler.
+ [Validation and Serialization](./Validation-and-Serialization.md): Details
  Fastify's support for validating incoming data and how Fastify serializes data
  for responses.
+ [Plugins](./Plugins.md): Explains Fastify's plugin architecture and API.
+ [Encapsulation](./Encapsulation.md): Explains a core concept upon which all
  Fastify plugins are built.
+ [Decorators](./Decorators.md): Explains the server, request, and response
  decorator APIs.
+ [Hooks](./Hooks.md): Details the API by which Fastify plugins can inject
  themselves into Fastify's handling of the request lifecycle.

