defmodule Authzed.Api.V0.WatchRequest do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:namespaces, 1, repeated: true, type: :string, deprecated: false)
  field(:start_revision, 2, type: Authzed.Api.V0.Zookie, json_name: "startRevision")
end

defmodule Authzed.Api.V0.WatchResponse do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:updates, 1, repeated: true, type: Authzed.Api.V0.RelationTupleUpdate)
  field(:end_revision, 2, type: Authzed.Api.V0.Zookie, json_name: "endRevision")
end

defmodule Authzed.Api.V0.WatchService.Service do
  @moduledoc false
  use GRPC.Service, name: "authzed.api.v0.WatchService", protoc_gen_elixir_version: "0.10.0"

  rpc(:Watch, Authzed.Api.V0.WatchRequest, stream(Authzed.Api.V0.WatchResponse))
end

defmodule Authzed.Api.V0.WatchService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Authzed.Api.V0.WatchService.Service
end
