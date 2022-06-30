defmodule Authzed.Api.V0.RelationTupleFilter.Filter do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :UNKNOWN, 0
  field :OBJECT_ID, 1
  field :RELATION, 2
  field :USERSET, 4
end
defmodule Authzed.Api.V0.CheckResponse.Membership do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :UNKNOWN, 0
  field :NOT_MEMBER, 1
  field :MEMBER, 2
end
defmodule Authzed.Api.V0.RelationTupleFilter do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :namespace, 1, type: :string, deprecated: false
  field :object_id, 2, type: :string, json_name: "objectId", deprecated: false
  field :relation, 3, type: :string, deprecated: false
  field :userset, 5, type: Authzed.Api.V0.ObjectAndRelation

  field :filters, 6,
    repeated: true,
    type: Authzed.Api.V0.RelationTupleFilter.Filter,
    enum: true,
    deprecated: false
end
defmodule Authzed.Api.V0.ReadRequest do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :tuplesets, 1, repeated: true, type: Authzed.Api.V0.RelationTupleFilter, deprecated: false
  field :at_revision, 2, type: Authzed.Api.V0.Zookie, json_name: "atRevision"
end
defmodule Authzed.Api.V0.ReadResponse.Tupleset do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :tuples, 1, repeated: true, type: Authzed.Api.V0.RelationTuple
end
defmodule Authzed.Api.V0.ReadResponse do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :tuplesets, 1, repeated: true, type: Authzed.Api.V0.ReadResponse.Tupleset
  field :revision, 2, type: Authzed.Api.V0.Zookie
end
defmodule Authzed.Api.V0.WriteRequest do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :write_conditions, 1,
    repeated: true,
    type: Authzed.Api.V0.RelationTuple,
    json_name: "writeConditions",
    deprecated: false

  field :updates, 2, repeated: true, type: Authzed.Api.V0.RelationTupleUpdate, deprecated: false
end
defmodule Authzed.Api.V0.WriteResponse do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :revision, 1, type: Authzed.Api.V0.Zookie
end
defmodule Authzed.Api.V0.CheckRequest do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :test_userset, 1,
    type: Authzed.Api.V0.ObjectAndRelation,
    json_name: "testUserset",
    deprecated: false

  field :user, 2, type: Authzed.Api.V0.User, deprecated: false
  field :at_revision, 3, type: Authzed.Api.V0.Zookie, json_name: "atRevision"
end
defmodule Authzed.Api.V0.ContentChangeCheckRequest do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :test_userset, 1,
    type: Authzed.Api.V0.ObjectAndRelation,
    json_name: "testUserset",
    deprecated: false

  field :user, 2, type: Authzed.Api.V0.User, deprecated: false
end
defmodule Authzed.Api.V0.CheckResponse do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :is_member, 1, type: :bool, json_name: "isMember"
  field :revision, 2, type: Authzed.Api.V0.Zookie
  field :membership, 3, type: Authzed.Api.V0.CheckResponse.Membership, enum: true
end
defmodule Authzed.Api.V0.ExpandRequest do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :userset, 1, type: Authzed.Api.V0.ObjectAndRelation, deprecated: false
  field :at_revision, 2, type: Authzed.Api.V0.Zookie, json_name: "atRevision"
end
defmodule Authzed.Api.V0.ExpandResponse do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :tree_node, 1, type: Authzed.Api.V0.RelationTupleTreeNode, json_name: "treeNode"
  field :revision, 3, type: Authzed.Api.V0.Zookie
end
defmodule Authzed.Api.V0.LookupRequest do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :object_relation, 1,
    type: Authzed.Api.V0.RelationReference,
    json_name: "objectRelation",
    deprecated: false

  field :user, 2, type: Authzed.Api.V0.ObjectAndRelation, deprecated: false
  field :at_revision, 3, type: Authzed.Api.V0.Zookie, json_name: "atRevision"
  field :page_reference, 4, type: :string, json_name: "pageReference"
  field :limit, 5, type: :uint32
end
defmodule Authzed.Api.V0.LookupResponse do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :resolved_object_ids, 1, repeated: true, type: :string, json_name: "resolvedObjectIds"
  field :next_page_reference, 2, type: :string, json_name: "nextPageReference"
  field :revision, 3, type: Authzed.Api.V0.Zookie
end
