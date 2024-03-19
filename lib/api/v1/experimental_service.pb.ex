defmodule Authzed.Api.V1.BulkCheckPermissionRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)

  field(:items, 2,
    repeated: true,
    type: Authzed.Api.V1.BulkCheckPermissionRequestItem,
    deprecated: false
  )
end

defmodule Authzed.Api.V1.BulkCheckPermissionRequestItem do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:resource, 1, type: Authzed.Api.V1.ObjectReference, deprecated: false)
  field(:permission, 2, type: :string, deprecated: false)
  field(:subject, 3, type: Authzed.Api.V1.SubjectReference, deprecated: false)
  field(:context, 4, type: Google.Protobuf.Struct, deprecated: false)
end

defmodule Authzed.Api.V1.BulkCheckPermissionResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:checked_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "checkedAt", deprecated: false)

  field(:pairs, 2,
    repeated: true,
    type: Authzed.Api.V1.BulkCheckPermissionPair,
    deprecated: false
  )
end

defmodule Authzed.Api.V1.BulkCheckPermissionPair do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof(:response, 0)

  field(:request, 1, type: Authzed.Api.V1.BulkCheckPermissionRequestItem)
  field(:item, 2, type: Authzed.Api.V1.BulkCheckPermissionResponseItem, oneof: 0)
  field(:error, 3, type: Google.Rpc.Status, oneof: 0)
end

defmodule Authzed.Api.V1.BulkCheckPermissionResponseItem do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:permissionship, 1,
    type: Authzed.Api.V1.CheckPermissionResponse.Permissionship,
    enum: true,
    deprecated: false
  )

  field(:partial_caveat_info, 2,
    type: Authzed.Api.V1.PartialCaveatInfo,
    json_name: "partialCaveatInfo",
    deprecated: false
  )
end

defmodule Authzed.Api.V1.BulkImportRelationshipsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:relationships, 1, repeated: true, type: Authzed.Api.V1.Relationship, deprecated: false)
end

defmodule Authzed.Api.V1.BulkImportRelationshipsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:num_loaded, 1, type: :uint64, json_name: "numLoaded")
end

defmodule Authzed.Api.V1.BulkExportRelationshipsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)
  field(:optional_limit, 2, type: :uint32, json_name: "optionalLimit", deprecated: false)
  field(:optional_cursor, 3, type: Authzed.Api.V1.Cursor, json_name: "optionalCursor")

  field(:optional_relationship_filter, 4,
    type: Authzed.Api.V1.RelationshipFilter,
    json_name: "optionalRelationshipFilter"
  )
end

defmodule Authzed.Api.V1.BulkExportRelationshipsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:after_result_cursor, 1, type: Authzed.Api.V1.Cursor, json_name: "afterResultCursor")
  field(:relationships, 2, repeated: true, type: Authzed.Api.V1.Relationship)
end

defmodule Authzed.Api.V1.ExperimentalService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "authzed.api.v1.ExperimentalService",
    protoc_gen_elixir_version: "0.12.0"

  rpc(
    :BulkImportRelationships,
    stream(Authzed.Api.V1.BulkImportRelationshipsRequest),
    Authzed.Api.V1.BulkImportRelationshipsResponse
  )

  rpc(
    :BulkExportRelationships,
    Authzed.Api.V1.BulkExportRelationshipsRequest,
    stream(Authzed.Api.V1.BulkExportRelationshipsResponse)
  )

  rpc(
    :BulkCheckPermission,
    Authzed.Api.V1.BulkCheckPermissionRequest,
    Authzed.Api.V1.BulkCheckPermissionResponse
  )
end

defmodule Authzed.Api.V1.ExperimentalService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.V1.ExperimentalService.Service
end
