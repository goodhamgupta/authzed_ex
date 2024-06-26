defmodule Authzed.Api.V1.WatchRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

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
end

defmodule Authzed.Api.V1.WatchResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:updates, 1, repeated: true, type: Authzed.Api.V1.RelationshipUpdate)
  field(:changes_through, 2, type: Authzed.Api.V1.ZedToken, json_name: "changesThrough")
end

defmodule Authzed.Api.V1.WatchService.Service do
  @moduledoc false

  use GRPC.Service, name: "authzed.api.v1.WatchService", protoc_gen_elixir_version: "0.12.0"

  rpc(:Watch, Authzed.Api.V1.WatchRequest, stream(Authzed.Api.V1.WatchResponse))
end

defmodule Authzed.Api.V1.WatchService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.V1.WatchService.Service
end
