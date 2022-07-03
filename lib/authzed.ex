defmodule Authzed do
  @moduledoc ~S"""
  This repository houses the Elixir client library for Authzed.

  [Authzed] is a database and service that stores, computes, and validates your application's permissions.

  Developers create a schema that models their permissions requirements and use a client library, such as this one, to apply the schema to the database, insert data into the database, and query the data to efficiently check permissions in their applications.

  Supported client API versions:
  - [v1](https://docs.authzed.com/reference/api#authzedapiv1)
  - [v1alpha1](https://docs.authzed.com/reference/api#authzedapiv1alpha1)
  - [v0](https://docs.authzed.com/reference/api#authzedapiv0) - Deprecated

  You can find more info on each API on the [Authzed API reference documentation].
  Additionally, Protobuf API documentation can be found on the [Buf Registry Authzed API repository].

  [Authzed]: https://authzed.com
  [Authzed API Reference documentation]: https://docs.authzed.com/reference/api
  [Buf Registry Authzed API repository]: https://buf.build/authzed/api/docs/main

  ## Getting Started

  We highly recommend following the **[Protecting Your First App]** guide to learn the latest best practice to integrate an application with Authzed.

  If you're interested in example uses of the API, see the test files in the [test directory].

  [Protecting Your First App]: https://docs.authzed.com/guides/first-app
  [test directory]: /test/authzed_test.exs

  ## Basic Usage

  ### Installation

  The package can be installed by adding `authzed_ex` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [
      {:authzed_ex, "~> 0.0.1"}
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
      GrpcUtil.insecure_bearer_auth_token("somerandomkeyhere")
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
  """
end
