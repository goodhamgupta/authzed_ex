defmodule Authzed.Api.V0.RelationTuple do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:object_and_relation, 1,
    type: Authzed.Api.V0.ObjectAndRelation,
    json_name: "objectAndRelation",
    deprecated: false
  )

  field(:user, 2, type: Authzed.Api.V0.User, deprecated: false)
end

defmodule Authzed.Api.V0.ObjectAndRelation do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:namespace, 1, type: :string, deprecated: false)
  field(:object_id, 2, type: :string, json_name: "objectId", deprecated: false)
  field(:relation, 3, type: :string, deprecated: false)
end

defmodule Authzed.Api.V0.RelationReference do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:namespace, 1, type: :string, deprecated: false)
  field(:relation, 3, type: :string, deprecated: false)
end

defmodule Authzed.Api.V0.User do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  oneof(:user_oneof, 0)

  field(:userset, 2, type: Authzed.Api.V0.ObjectAndRelation, oneof: 0, deprecated: false)
end
