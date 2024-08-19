defmodule Authzed.Api.V1.ReadSchemaRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Authzed.Api.V1.ReadSchemaResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:schema_text, 1, type: :string, json_name: "schemaText")
  field(:read_at, 2, type: Authzed.Api.V1.ZedToken, json_name: "readAt", deprecated: false)
end

defmodule Authzed.Api.V1.WriteSchemaRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:schema, 1, type: :string, deprecated: false)
end

defmodule Authzed.Api.V1.WriteSchemaResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:written_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "writtenAt", deprecated: false)
end

defmodule Authzed.Api.V1.SchemaService.Service do
  @moduledoc false

  use GRPC.Service, name: "authzed.api.v1.SchemaService", protoc_gen_elixir_version: "0.12.0"

  rpc(:ReadSchema, Authzed.Api.V1.ReadSchemaRequest, Authzed.Api.V1.ReadSchemaResponse)

  rpc(:WriteSchema, Authzed.Api.V1.WriteSchemaRequest, Authzed.Api.V1.WriteSchemaResponse)
end

defmodule Authzed.Api.V1.SchemaService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.V1.SchemaService.Service
end
