defmodule Authzed.Api.V1.BulkImportRelationshipsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :relationships, 1, repeated: true, type: Authzed.Api.V1.Relationship, deprecated: false
end

defmodule Authzed.Api.V1.BulkImportRelationshipsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :num_loaded, 1, type: :uint64, json_name: "numLoaded"
end

defmodule Authzed.Api.V1.BulkExportRelationshipsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :consistency, 1, type: Authzed.Api.V1.Consistency
  field :optional_limit, 2, type: :uint32, json_name: "optionalLimit", deprecated: false
  field :optional_cursor, 3, type: Authzed.Api.V1.Cursor, json_name: "optionalCursor"
end

defmodule Authzed.Api.V1.BulkExportRelationshipsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :after_result_cursor, 1, type: Authzed.Api.V1.Cursor, json_name: "afterResultCursor"
  field :relationships, 2, repeated: true, type: Authzed.Api.V1.Relationship
end

defmodule Authzed.Api.V1.ExperimentalService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "authzed.api.v1.ExperimentalService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :BulkImportRelationships,
      stream(Authzed.Api.V1.BulkImportRelationshipsRequest),
      Authzed.Api.V1.BulkImportRelationshipsResponse

  rpc :BulkExportRelationships,
      Authzed.Api.V1.BulkExportRelationshipsRequest,
      stream(Authzed.Api.V1.BulkExportRelationshipsResponse)
end

defmodule Authzed.Api.V1.ExperimentalService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.V1.ExperimentalService.Service
end