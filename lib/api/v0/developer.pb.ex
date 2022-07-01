defmodule Authzed.Api.V0.LookupShareResponse.LookupStatus do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :UNKNOWN_REFERENCE, 0
  field :FAILED_TO_LOOKUP, 1
  field :VALID_REFERENCE, 2
  field :UPGRADED_REFERENCE, 3
end
defmodule Authzed.Api.V0.DeveloperError.Source do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :UNKNOWN_SOURCE, 0
  field :SCHEMA, 1
  field :RELATIONSHIP, 2
  field :VALIDATION_YAML, 3
  field :CHECK_WATCH, 4
  field :ASSERTION, 5
end
defmodule Authzed.Api.V0.DeveloperError.ErrorKind do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :UNKNOWN_KIND, 0
  field :PARSE_ERROR, 1
  field :SCHEMA_ISSUE, 2
  field :DUPLICATE_RELATIONSHIP, 3
  field :MISSING_EXPECTED_RELATIONSHIP, 4
  field :EXTRA_RELATIONSHIP_FOUND, 5
  field :UNKNOWN_OBJECT_TYPE, 6
  field :UNKNOWN_RELATION, 7
  field :MAXIMUM_RECURSION, 8
  field :ASSERTION_FAILED, 9
end
defmodule Authzed.Api.V0.FormatSchemaRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :schema, 1, type: :string
end
defmodule Authzed.Api.V0.FormatSchemaResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :error, 1, type: Authzed.Api.V0.DeveloperError
  field :formatted_schema, 2, type: :string, json_name: "formattedSchema"
end
defmodule Authzed.Api.V0.UpgradeSchemaRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :namespace_configs, 1, repeated: true, type: :string, json_name: "namespaceConfigs"
end
defmodule Authzed.Api.V0.UpgradeSchemaResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :error, 1, type: Authzed.Api.V0.DeveloperError
  field :upgraded_schema, 2, type: :string, json_name: "upgradedSchema"
end
defmodule Authzed.Api.V0.ShareRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :schema, 1, type: :string
  field :relationships_yaml, 2, type: :string, json_name: "relationshipsYaml"
  field :validation_yaml, 3, type: :string, json_name: "validationYaml"
  field :assertions_yaml, 4, type: :string, json_name: "assertionsYaml"
end
defmodule Authzed.Api.V0.ShareResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :share_reference, 1, type: :string, json_name: "shareReference"
end
defmodule Authzed.Api.V0.LookupShareRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :share_reference, 1, type: :string, json_name: "shareReference"
end
defmodule Authzed.Api.V0.LookupShareResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :status, 1, type: Authzed.Api.V0.LookupShareResponse.LookupStatus, enum: true
  field :schema, 2, type: :string
  field :relationships_yaml, 3, type: :string, json_name: "relationshipsYaml"
  field :validation_yaml, 4, type: :string, json_name: "validationYaml"
  field :assertions_yaml, 5, type: :string, json_name: "assertionsYaml"
end
defmodule Authzed.Api.V0.RequestContext do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :schema, 1, type: :string
  field :relationships, 2, repeated: true, type: Authzed.Api.V0.RelationTuple

  field :legacy_ns_configs, 3,
    repeated: true,
    type: Authzed.Api.V0.NamespaceDefinition,
    json_name: "legacyNsConfigs"
end
defmodule Authzed.Api.V0.EditCheckRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :context, 1, type: Authzed.Api.V0.RequestContext

  field :check_relationships, 2,
    repeated: true,
    type: Authzed.Api.V0.RelationTuple,
    json_name: "checkRelationships"
end
defmodule Authzed.Api.V0.EditCheckResult do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :relationship, 1, type: Authzed.Api.V0.RelationTuple
  field :is_member, 2, type: :bool, json_name: "isMember"
  field :error, 3, type: Authzed.Api.V0.DeveloperError
end
defmodule Authzed.Api.V0.EditCheckResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :request_errors, 1,
    repeated: true,
    type: Authzed.Api.V0.DeveloperError,
    json_name: "requestErrors"

  field :check_results, 2,
    repeated: true,
    type: Authzed.Api.V0.EditCheckResult,
    json_name: "checkResults"
end
defmodule Authzed.Api.V0.ValidateRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :context, 1, type: Authzed.Api.V0.RequestContext
  field :validation_yaml, 3, type: :string, json_name: "validationYaml"
  field :update_validation_yaml, 4, type: :bool, json_name: "updateValidationYaml"
  field :assertions_yaml, 5, type: :string, json_name: "assertionsYaml"
end
defmodule Authzed.Api.V0.ValidateResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :request_errors, 1,
    repeated: true,
    type: Authzed.Api.V0.DeveloperError,
    json_name: "requestErrors"

  field :validation_errors, 2,
    repeated: true,
    type: Authzed.Api.V0.DeveloperError,
    json_name: "validationErrors"

  field :updated_validation_yaml, 3, type: :string, json_name: "updatedValidationYaml"
end
defmodule Authzed.Api.V0.DeveloperError do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :message, 1, type: :string
  field :line, 2, type: :uint32
  field :column, 3, type: :uint32
  field :source, 4, type: Authzed.Api.V0.DeveloperError.Source, enum: true
  field :kind, 5, type: Authzed.Api.V0.DeveloperError.ErrorKind, enum: true
  field :path, 6, repeated: true, type: :string
  field :context, 7, type: :string
end
defmodule Authzed.Api.V0.DeveloperService.Service do
  @moduledoc false
  use GRPC.Service, name: "authzed.api.v0.DeveloperService", protoc_gen_elixir_version: "0.10.0"

  rpc :EditCheck, Authzed.Api.V0.EditCheckRequest, Authzed.Api.V0.EditCheckResponse

  rpc :Validate, Authzed.Api.V0.ValidateRequest, Authzed.Api.V0.ValidateResponse

  rpc :Share, Authzed.Api.V0.ShareRequest, Authzed.Api.V0.ShareResponse

  rpc :LookupShared, Authzed.Api.V0.LookupShareRequest, Authzed.Api.V0.LookupShareResponse

  rpc :UpgradeSchema, Authzed.Api.V0.UpgradeSchemaRequest, Authzed.Api.V0.UpgradeSchemaResponse

  rpc :FormatSchema, Authzed.Api.V0.FormatSchemaRequest, Authzed.Api.V0.FormatSchemaResponse
end

defmodule Authzed.Api.V0.DeveloperService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Authzed.Api.V0.DeveloperService.Service
end
