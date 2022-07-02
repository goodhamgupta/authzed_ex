defmodule Authzed.Api.V0.RelationTupleUpdate.Operation do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:UNKNOWN, 0)
  field(:CREATE, 1)
  field(:TOUCH, 2)
  field(:DELETE, 3)
end

defmodule Authzed.Api.V0.SetOperationUserset.Operation do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:INVALID, 0)
  field(:UNION, 1)
  field(:INTERSECTION, 2)
  field(:EXCLUSION, 3)
end

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

defmodule Authzed.Api.V0.Zookie do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:token, 1, type: :string, deprecated: false)
end

defmodule Authzed.Api.V0.RelationTupleUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:operation, 1,
    type: Authzed.Api.V0.RelationTupleUpdate.Operation,
    enum: true,
    deprecated: false
  )

  field(:tuple, 2, type: Authzed.Api.V0.RelationTuple, deprecated: false)
end

defmodule Authzed.Api.V0.RelationTupleTreeNode do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  oneof(:node_type, 0)

  field(:intermediate_node, 1,
    type: Authzed.Api.V0.SetOperationUserset,
    json_name: "intermediateNode",
    oneof: 0
  )

  field(:leaf_node, 2, type: Authzed.Api.V0.DirectUserset, json_name: "leafNode", oneof: 0)
  field(:expanded, 3, type: Authzed.Api.V0.ObjectAndRelation)
end

defmodule Authzed.Api.V0.SetOperationUserset do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:operation, 1, type: Authzed.Api.V0.SetOperationUserset.Operation, enum: true)

  field(:child_nodes, 2,
    repeated: true,
    type: Authzed.Api.V0.RelationTupleTreeNode,
    json_name: "childNodes"
  )
end

defmodule Authzed.Api.V0.DirectUserset do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:users, 1, repeated: true, type: Authzed.Api.V0.User)
end
