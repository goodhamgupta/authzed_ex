defmodule Authzed.Api.V1alpha1.ReadSchemaRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:object_definitions_names, 1,
    repeated: true,
    type: :string,
    json_name: "objectDefinitionsNames",
    deprecated: false
  )
end

defmodule Authzed.Api.V1alpha1.ReadSchemaResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:object_definitions, 1, repeated: true, type: :string, json_name: "objectDefinitions")

  field(:computed_definitions_revision, 2,
    type: :string,
    json_name: "computedDefinitionsRevision"
  )
end

defmodule Authzed.Api.V1alpha1.WriteSchemaRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:schema, 1, type: :string, deprecated: false)

  field(:optional_definitions_revision_precondition, 2,
    type: :string,
    json_name: "optionalDefinitionsRevisionPrecondition"
  )
end

defmodule Authzed.Api.V1alpha1.WriteSchemaResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:object_definitions_names, 1,
    repeated: true,
    type: :string,
    json_name: "objectDefinitionsNames"
  )

  field(:computed_definitions_revision, 2,
    type: :string,
    json_name: "computedDefinitionsRevision"
  )
end

defmodule Authzed.Api.V1alpha1.SchemaService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "authzed.api.v1alpha1.SchemaService",
    protoc_gen_elixir_version: "0.12.0"

  rpc(
    :ReadSchema,
    Authzed.Api.V1alpha1.ReadSchemaRequest,
    Authzed.Api.V1alpha1.ReadSchemaResponse
  )

  rpc(
    :WriteSchema,
    Authzed.Api.V1alpha1.WriteSchemaRequest,
    Authzed.Api.V1alpha1.WriteSchemaResponse
  )
end

defmodule Authzed.Api.V1alpha1.SchemaService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.V1alpha1.SchemaService.Service
end
