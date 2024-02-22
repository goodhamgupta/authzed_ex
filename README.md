# Authzed Elixir Client

[![Hex pm](http://img.shields.io/hexpm/v/authzed.svg?style=flat)](https://hex.pm/packages/authzed)
[![Build Status](https://github.com/goodhamgupta/authzed_ex/actions/workflows/main.yml/badge.svg)](https://github.com/goodhamgupta/authzed_ex/actions)

This repository houses the Elixir client library for Authzed.

[Authzed] is a database and service that stores, computes, and validates your application's permissions.

Developers create a schema that models their permissions requirements and use a client library, such as this one, to apply the schema to the database, insert data into the database, and query the data to efficiently check permissions in their applications.

Supported client API versions:
- [v1](https://docs.authzed.com/reference/api#authzedapiv1)
- [v1alpha1](https://docs.authzed.com/reference/api#authzedapiv1alpha1)
- [v0](https://docs.authzed.com/reference/api#authzedapiv0) - Deprecated

You can find more info on each API on the [Authzed API reference documentation].
Additionally, Protobuf API documentation can be found on the [Buf Registry Authzed API repository].

**NOTE**: Current Authzed SDK commit version on Buf available [here](https://buf.build/authzed/api/activity/commit/ae0019fd4971464faeac85b2e146bdb8)

[Authzed]: https://authzed.com
[Authzed API Reference documentation]: https://docs.authzed.com/reference/api
[Buf Registry Authzed API repository]: https://buf.build/authzed/api/docs/main

## Basic Usage

If you're using a local SpiceDB instance, you can start the instance with Docker and Docker Compose using the command:

```ex
make start-infra
```

### Installation

The package can be installed by adding `authzed` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:authzed, "~> 0.0.1"}
  ]
end
```

### Initializing a client

In order to successfully connect, you will have to provide a [Bearer Token] with your own API Token from the [Authzed dashboard] in place of `somerandomkeyhere` in the following example:

[Bearer Token]: https://datatracker.ietf.org/doc/html/rfc6750#section-2.1
[Authzed Dashboard]: https://app.authzed.com

```ex

alias Authzed.Api.V1.{Client, GRPCUtil}

client = Client.new(
    "localhost:50051",
    GRPCUtil.insecure_bearer_auth_token("somerandomkeyhere")
)
```

### Performing an API call

```ex

alias Authzed.Api.V1.{
  CheckPermissionRequest,
  ObjectReference,
  SubjectReference,
}

# Is Emilia in the set of users that can read post #1?
post_one = ObjectReference.new(object_type: "post", object_id: "1")

emilia =
  SubjectReference.new(object: ObjectReference.new(object_type: "user", object_id: "emilia"))

{:ok, response} =
client.permissions_service.check_permission(
  client.channel,
  CheckPermissionRequest.new(
    resource: post_one,
    permission: "view",
    subject: emilia
  )
)

assert response.permissionship == :PERMISSIONSHIP_HAS_PERMISSION
```

### Telemetry

Since version `0.0.6` telemetry events are published by the GRPC library. 
See [docs](https://hexdocs.pm/grpc/GRPC.Telemetry.html) for details.

## Running Tests

Run the tests using the command:

```sh
make run-tests
```

- Note that this will create a SpiceDB instance with the option `serve-testing`. creating an in-memory spicedb server which serves completely isolated datastores per client-supplied auth token used.

## Generate Protobuf Definitions

We use Buf to generate the protobuf and GRPC definitions for Elixir. You can use the command

```sh
make generate
```

to regenerate the definitions and move them to their respective folders.

**NOTE** 
- Install protoc-gen-elixir using the instructions in the [Elixir Protobuf Repository](https://github.com/elixir-protobuf/protobuf#generate-elixir-code)
- If you're using asdf to manage elixir versions, run the command `asdf reshim elixir` to add the `protoc-gen-elixir` executable to the PATH.
