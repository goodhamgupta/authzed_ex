defmodule Authzed.Api.Materialize.V0.ExperimentalRoaringLookupResourcesRequest do
  @moduledoc false

  use Protobuf,
    full_name: "authzed.api.materialize.v0.ExperimentalRoaringLookupResourcesRequest",
    protoc_gen_elixir_version: "0.17.1",
    syntax: :proto3

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)

  field(:resource_object_type, 2,
    type: :string,
    json_name: "resourceObjectType",
    deprecated: false
  )

  field(:permission, 3, type: :string, deprecated: false)
  field(:subject, 4, type: Authzed.Api.V1.SubjectReference, deprecated: false)
end

defmodule Authzed.Api.Materialize.V0.ExperimentalRoaringLookupResourcesResponse do
  @moduledoc false

  use Protobuf,
    full_name: "authzed.api.materialize.v0.ExperimentalRoaringLookupResourcesResponse",
    protoc_gen_elixir_version: "0.17.1",
    syntax: :proto3

  field(:bitmap, 1, type: :bytes)
  field(:cardinality, 2, type: :uint64)

  field(:at_revision, 3,
    type: Authzed.Api.V1.ZedToken,
    json_name: "atRevision",
    deprecated: false
  )
end

defmodule Authzed.Api.Materialize.V0.RoaringLookupResourcesService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "authzed.api.materialize.v0.RoaringLookupResourcesService",
    protoc_gen_elixir_version: "0.17.1"

  rpc(
    :ExperimentalRoaringLookupResources,
    Authzed.Api.Materialize.V0.ExperimentalRoaringLookupResourcesRequest,
    Authzed.Api.Materialize.V0.ExperimentalRoaringLookupResourcesResponse
  )
end

defmodule Authzed.Api.Materialize.V0.RoaringLookupResourcesService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.Materialize.V0.RoaringLookupResourcesService.Service
end
