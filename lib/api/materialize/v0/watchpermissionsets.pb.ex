defmodule Authzed.Api.Materialize.V0.PermissionSetChange.SetOperation do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:SET_OPERATION_UNSPECIFIED, 0)
  field(:SET_OPERATION_ADDED, 1)
  field(:SET_OPERATION_REMOVED, 2)
end

defmodule Authzed.Api.Materialize.V0.WatchPermissionSetsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:optional_starting_after, 1,
    type: Authzed.Api.V1.ZedToken,
    json_name: "optionalStartingAfter"
  )
end

defmodule Authzed.Api.Materialize.V0.WatchPermissionSetsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof(:response, 0)

  field(:change, 1, type: Authzed.Api.Materialize.V0.PermissionSetChange, oneof: 0)

  field(:completed_revision, 2,
    type: Authzed.Api.V1.ZedToken,
    json_name: "completedRevision",
    oneof: 0
  )

  field(:lookup_permission_sets_required, 3,
    type: Authzed.Api.Materialize.V0.LookupPermissionSetsRequired,
    json_name: "lookupPermissionSetsRequired",
    oneof: 0
  )

  field(:breaking_schema_change, 4,
    type: Authzed.Api.Materialize.V0.BreakingSchemaChange,
    json_name: "breakingSchemaChange",
    oneof: 0
  )
end

defmodule Authzed.Api.Materialize.V0.Cursor do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:limit, 1, type: :uint32)
  field(:token, 4, type: Authzed.Api.V1.ZedToken)
  field(:starting_index, 5, type: :uint32, json_name: "startingIndex")
  field(:completed_members, 6, type: :bool, json_name: "completedMembers")
  field(:starting_key, 7, type: :string, json_name: "startingKey")
  field(:cursor, 8, type: :string)
end

defmodule Authzed.Api.Materialize.V0.LookupPermissionSetsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:limit, 1, type: :uint32)
  field(:optional_at_revision, 2, type: Authzed.Api.V1.ZedToken, json_name: "optionalAtRevision")

  field(:optional_starting_after_cursor, 4,
    type: Authzed.Api.Materialize.V0.Cursor,
    json_name: "optionalStartingAfterCursor"
  )
end

defmodule Authzed.Api.Materialize.V0.LookupPermissionSetsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:change, 1, type: Authzed.Api.Materialize.V0.PermissionSetChange)
  field(:cursor, 2, type: Authzed.Api.Materialize.V0.Cursor)
end

defmodule Authzed.Api.Materialize.V0.PermissionSetChange do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof(:child, 0)

  field(:at_revision, 1, type: Authzed.Api.V1.ZedToken, json_name: "atRevision")

  field(:operation, 2,
    type: Authzed.Api.Materialize.V0.PermissionSetChange.SetOperation,
    enum: true
  )

  field(:parent_set, 3, type: Authzed.Api.Materialize.V0.SetReference, json_name: "parentSet")

  field(:child_set, 4,
    type: Authzed.Api.Materialize.V0.SetReference,
    json_name: "childSet",
    oneof: 0
  )

  field(:child_member, 5,
    type: Authzed.Api.Materialize.V0.MemberReference,
    json_name: "childMember",
    oneof: 0
  )
end

defmodule Authzed.Api.Materialize.V0.SetReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:object_type, 1, type: :string, json_name: "objectType")
  field(:object_id, 2, type: :string, json_name: "objectId")
  field(:permission_or_relation, 3, type: :string, json_name: "permissionOrRelation")
end

defmodule Authzed.Api.Materialize.V0.MemberReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:object_type, 1, type: :string, json_name: "objectType")
  field(:object_id, 2, type: :string, json_name: "objectId")

  field(:optional_permission_or_relation, 3,
    type: :string,
    json_name: "optionalPermissionOrRelation"
  )
end

defmodule Authzed.Api.Materialize.V0.LookupPermissionSetsRequired do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:required_lookup_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "requiredLookupAt")
end

defmodule Authzed.Api.Materialize.V0.BreakingSchemaChange do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:change_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "changeAt")
end

defmodule Authzed.Api.Materialize.V0.WatchPermissionSetsService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "authzed.api.materialize.v0.WatchPermissionSetsService",
    protoc_gen_elixir_version: "0.14.0"

  rpc(
    :WatchPermissionSets,
    Authzed.Api.Materialize.V0.WatchPermissionSetsRequest,
    stream(Authzed.Api.Materialize.V0.WatchPermissionSetsResponse)
  )

  rpc(
    :LookupPermissionSets,
    Authzed.Api.Materialize.V0.LookupPermissionSetsRequest,
    stream(Authzed.Api.Materialize.V0.LookupPermissionSetsResponse)
  )
end

defmodule Authzed.Api.Materialize.V0.WatchPermissionSetsService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.Materialize.V0.WatchPermissionSetsService.Service
end
