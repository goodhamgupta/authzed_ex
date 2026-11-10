defmodule Authzed.Api.Materialize.V0.ExperimentalCountRelationshipsByFilterRequest do
  @moduledoc false

  use Protobuf,
    full_name: "authzed.api.materialize.v0.ExperimentalCountRelationshipsByFilterRequest",
    protoc_gen_elixir_version: "0.17.1",
    syntax: :proto3

  field(:relationship_filter, 1,
    type: Authzed.Api.V1.RelationshipFilter,
    json_name: "relationshipFilter",
    deprecated: false
  )
end

defmodule Authzed.Api.Materialize.V0.ExperimentalCountRelationshipsByFilterResponse do
  @moduledoc false

  use Protobuf,
    full_name: "authzed.api.materialize.v0.ExperimentalCountRelationshipsByFilterResponse",
    protoc_gen_elixir_version: "0.17.1",
    syntax: :proto3

  field(:relationship_count, 1, type: :uint64, json_name: "relationshipCount")
  field(:read_at, 2, type: Authzed.Api.V1.ZedToken, json_name: "readAt", deprecated: false)
end

defmodule Authzed.Api.Materialize.V0.RelationshipsService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "authzed.api.materialize.v0.RelationshipsService",
    protoc_gen_elixir_version: "0.17.1"

  rpc(
    :ExperimentalCountRelationshipsByFilter,
    Authzed.Api.Materialize.V0.ExperimentalCountRelationshipsByFilterRequest,
    Authzed.Api.Materialize.V0.ExperimentalCountRelationshipsByFilterResponse
  )
end

defmodule Authzed.Api.Materialize.V0.RelationshipsService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.Materialize.V0.RelationshipsService.Service
end
