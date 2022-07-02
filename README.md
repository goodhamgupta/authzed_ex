# Authzed

This repository houses the Elixir client library for Authzed.

[Authzed] is a database and service that stores, computes, and validates your application's permissions.

Developers create a schema that models their permissions requirements and use a client library, such as this one, to apply the schema to the database, insert data into the database, and query the data to efficiently check permissions in their applications.

Supported client API versions:
- [v1](https://docs.authzed.com/reference/api#authzedapiv1)
- [v1alpha1]((https://docs.authzed.com/reference/api#authzedapiv1alpha1)
- [v0]((https://docs.authzed.com/reference/api#authzedapiv0) - Deprecated

You can find more info on each API on the [Authzed API reference documentation].
Additionally, Protobuf API documentation can be found on the [Buf Registry Authzed API repository].

[Authzed]: https://authzed.com
[Authzed API Reference documentation]: https://docs.authzed.com/reference/api
[Buf Registry Authzed API repository]: https://buf.build/authzed/api/docs/main

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `authzed_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:authzed_ex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/authzed_ex](https://hexdocs.pm/authzed_ex).

