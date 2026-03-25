defmodule Authzed.Api.V1.WatchKind do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "authzed.api.v1.WatchKind",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field(:WATCH_KIND_UNSPECIFIED, 0)
  field(:WATCH_KIND_INCLUDE_RELATIONSHIP_UPDATES, 1)
  field(:WATCH_KIND_INCLUDE_SCHEMA_UPDATES, 2)
  field(:WATCH_KIND_INCLUDE_CHECKPOINTS, 3)
end

defmodule Authzed.Api.V1.WatchRequest do
  @moduledoc false

  use Protobuf,
    full_name: "authzed.api.v1.WatchRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field(:optional_object_types, 1,
    repeated: true,
    type: :string,
    json_name: "optionalObjectTypes",
    deprecated: false
  )

  field(:optional_start_cursor, 2,
    type: Authzed.Api.V1.ZedToken,
    json_name: "optionalStartCursor"
  )

  field(:optional_relationship_filters, 3,
    repeated: true,
    type: Authzed.Api.V1.RelationshipFilter,
    json_name: "optionalRelationshipFilters"
  )

  field(:optional_update_kinds, 4,
    repeated: true,
    type: Authzed.Api.V1.WatchKind,
    json_name: "optionalUpdateKinds",
    enum: true
  )
end

defmodule Authzed.Api.V1.WatchResponse do
  @moduledoc false

  use Protobuf,
    full_name: "authzed.api.v1.WatchResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field(:updates, 1, repeated: true, type: Authzed.Api.V1.RelationshipUpdate)
  field(:changes_through, 2, type: Authzed.Api.V1.ZedToken, json_name: "changesThrough")

  field(:optional_transaction_metadata, 3,
    type: Google.Protobuf.Struct,
    json_name: "optionalTransactionMetadata"
  )

  field(:schema_updated, 4, type: :bool, json_name: "schemaUpdated")
  field(:is_checkpoint, 5, type: :bool, json_name: "isCheckpoint")

  field(:full_revision_metadata, 6,
    repeated: true,
    type: Google.Protobuf.Struct,
    json_name: "fullRevisionMetadata"
  )
end

defmodule Authzed.Api.V1.WatchService.Service do
  @moduledoc false

  use GRPC.Service, name: "authzed.api.v1.WatchService", protoc_gen_elixir_version: "0.16.0"

  rpc(:Watch, Authzed.Api.V1.WatchRequest, stream(Authzed.Api.V1.WatchResponse))
end

defmodule Authzed.Api.V1.WatchService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.V1.WatchService.Service
end
