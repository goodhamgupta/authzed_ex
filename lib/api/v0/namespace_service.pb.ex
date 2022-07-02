defmodule Authzed.Api.V0.ReadConfigRequest do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:namespace, 1, type: :string, deprecated: false)
  field(:at_revision, 2, type: Authzed.Api.V0.Zookie, json_name: "atRevision")
end

defmodule Authzed.Api.V0.ReadConfigResponse do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:namespace, 1, type: :string)
  field(:config, 2, type: Authzed.Api.V0.NamespaceDefinition)
  field(:revision, 4, type: Authzed.Api.V0.Zookie)
end

defmodule Authzed.Api.V0.WriteConfigRequest do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:configs, 2, repeated: true, type: Authzed.Api.V0.NamespaceDefinition, deprecated: false)
end

defmodule Authzed.Api.V0.WriteConfigResponse do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:revision, 1, type: Authzed.Api.V0.Zookie)
end

defmodule Authzed.Api.V0.DeleteConfigsRequest do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:namespaces, 1, repeated: true, type: :string, deprecated: false)
end

defmodule Authzed.Api.V0.DeleteConfigsResponse do
  @moduledoc false
  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:revision, 1, type: Authzed.Api.V0.Zookie)
end

defmodule Authzed.Api.V0.NamespaceService.Service do
  @moduledoc false
  use GRPC.Service, name: "authzed.api.v0.NamespaceService", protoc_gen_elixir_version: "0.10.0"

  rpc(:ReadConfig, Authzed.Api.V0.ReadConfigRequest, Authzed.Api.V0.ReadConfigResponse)

  rpc(:WriteConfig, Authzed.Api.V0.WriteConfigRequest, Authzed.Api.V0.WriteConfigResponse)

  rpc(:DeleteConfigs, Authzed.Api.V0.DeleteConfigsRequest, Authzed.Api.V0.DeleteConfigsResponse)
end

defmodule Authzed.Api.V0.NamespaceService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Authzed.Api.V0.NamespaceService.Service
end
