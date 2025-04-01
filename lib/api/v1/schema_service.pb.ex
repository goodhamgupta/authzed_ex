defmodule Authzed.Api.V1.ReadSchemaRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Authzed.Api.V1.ReadSchemaResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:schema_text, 1, type: :string, json_name: "schemaText")
  field(:read_at, 2, type: Authzed.Api.V1.ZedToken, json_name: "readAt", deprecated: false)
end

defmodule Authzed.Api.V1.WriteSchemaRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:schema, 1, type: :string, deprecated: false)
end

defmodule Authzed.Api.V1.WriteSchemaResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:written_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "writtenAt", deprecated: false)
end

defmodule Authzed.Api.V1.ReflectSchemaRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)

  field(:optional_filters, 2,
    repeated: true,
    type: Authzed.Api.V1.ReflectionSchemaFilter,
    json_name: "optionalFilters"
  )
end

defmodule Authzed.Api.V1.ReflectSchemaResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:definitions, 1, repeated: true, type: Authzed.Api.V1.ReflectionDefinition)
  field(:caveats, 2, repeated: true, type: Authzed.Api.V1.ReflectionCaveat)
  field(:read_at, 3, type: Authzed.Api.V1.ZedToken, json_name: "readAt")
end

defmodule Authzed.Api.V1.ReflectionSchemaFilter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:optional_definition_name_filter, 1,
    type: :string,
    json_name: "optionalDefinitionNameFilter"
  )

  field(:optional_caveat_name_filter, 2, type: :string, json_name: "optionalCaveatNameFilter")
  field(:optional_relation_name_filter, 3, type: :string, json_name: "optionalRelationNameFilter")

  field(:optional_permission_name_filter, 4,
    type: :string,
    json_name: "optionalPermissionNameFilter"
  )
end

defmodule Authzed.Api.V1.ReflectionDefinition do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:comment, 2, type: :string)
  field(:relations, 3, repeated: true, type: Authzed.Api.V1.ReflectionRelation)
  field(:permissions, 4, repeated: true, type: Authzed.Api.V1.ReflectionPermission)
end

defmodule Authzed.Api.V1.ReflectionCaveat do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:comment, 2, type: :string)
  field(:parameters, 3, repeated: true, type: Authzed.Api.V1.ReflectionCaveatParameter)
  field(:expression, 4, type: :string)
end

defmodule Authzed.Api.V1.ReflectionCaveatParameter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:type, 2, type: :string)
  field(:parent_caveat_name, 3, type: :string, json_name: "parentCaveatName")
end

defmodule Authzed.Api.V1.ReflectionRelation do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:comment, 2, type: :string)
  field(:parent_definition_name, 3, type: :string, json_name: "parentDefinitionName")

  field(:subject_types, 4,
    repeated: true,
    type: Authzed.Api.V1.ReflectionTypeReference,
    json_name: "subjectTypes"
  )
end

defmodule Authzed.Api.V1.ReflectionTypeReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof(:typeref, 0)

  field(:subject_definition_name, 1, type: :string, json_name: "subjectDefinitionName")
  field(:optional_caveat_name, 2, type: :string, json_name: "optionalCaveatName")
  field(:is_terminal_subject, 3, type: :bool, json_name: "isTerminalSubject", oneof: 0)
  field(:optional_relation_name, 4, type: :string, json_name: "optionalRelationName", oneof: 0)
  field(:is_public_wildcard, 5, type: :bool, json_name: "isPublicWildcard", oneof: 0)
end

defmodule Authzed.Api.V1.ReflectionPermission do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:comment, 2, type: :string)
  field(:parent_definition_name, 3, type: :string, json_name: "parentDefinitionName")
end

defmodule Authzed.Api.V1.ComputablePermissionsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)
  field(:definition_name, 2, type: :string, json_name: "definitionName")
  field(:relation_name, 3, type: :string, json_name: "relationName")

  field(:optional_definition_name_filter, 4,
    type: :string,
    json_name: "optionalDefinitionNameFilter"
  )
end

defmodule Authzed.Api.V1.ReflectionRelationReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:definition_name, 1, type: :string, json_name: "definitionName")
  field(:relation_name, 2, type: :string, json_name: "relationName")
  field(:is_permission, 3, type: :bool, json_name: "isPermission")
end

defmodule Authzed.Api.V1.ComputablePermissionsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:permissions, 1, repeated: true, type: Authzed.Api.V1.ReflectionRelationReference)
  field(:read_at, 2, type: Authzed.Api.V1.ZedToken, json_name: "readAt")
end

defmodule Authzed.Api.V1.DependentRelationsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)
  field(:definition_name, 2, type: :string, json_name: "definitionName")
  field(:permission_name, 3, type: :string, json_name: "permissionName")
end

defmodule Authzed.Api.V1.DependentRelationsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:relations, 1, repeated: true, type: Authzed.Api.V1.ReflectionRelationReference)
  field(:read_at, 2, type: Authzed.Api.V1.ZedToken, json_name: "readAt")
end

defmodule Authzed.Api.V1.DiffSchemaRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)
  field(:comparison_schema, 2, type: :string, json_name: "comparisonSchema")
end

defmodule Authzed.Api.V1.DiffSchemaResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:diffs, 1, repeated: true, type: Authzed.Api.V1.ReflectionSchemaDiff)
  field(:read_at, 2, type: Authzed.Api.V1.ZedToken, json_name: "readAt")
end

defmodule Authzed.Api.V1.ReflectionRelationSubjectTypeChange do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:relation, 1, type: Authzed.Api.V1.ReflectionRelation)

  field(:changed_subject_type, 2,
    type: Authzed.Api.V1.ReflectionTypeReference,
    json_name: "changedSubjectType"
  )
end

defmodule Authzed.Api.V1.ReflectionCaveatParameterTypeChange do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:parameter, 1, type: Authzed.Api.V1.ReflectionCaveatParameter)
  field(:previous_type, 2, type: :string, json_name: "previousType")
end

defmodule Authzed.Api.V1.ReflectionSchemaDiff do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof(:diff, 0)

  field(:definition_added, 1,
    type: Authzed.Api.V1.ReflectionDefinition,
    json_name: "definitionAdded",
    oneof: 0
  )

  field(:definition_removed, 2,
    type: Authzed.Api.V1.ReflectionDefinition,
    json_name: "definitionRemoved",
    oneof: 0
  )

  field(:definition_doc_comment_changed, 3,
    type: Authzed.Api.V1.ReflectionDefinition,
    json_name: "definitionDocCommentChanged",
    oneof: 0
  )

  field(:relation_added, 4,
    type: Authzed.Api.V1.ReflectionRelation,
    json_name: "relationAdded",
    oneof: 0
  )

  field(:relation_removed, 5,
    type: Authzed.Api.V1.ReflectionRelation,
    json_name: "relationRemoved",
    oneof: 0
  )

  field(:relation_doc_comment_changed, 6,
    type: Authzed.Api.V1.ReflectionRelation,
    json_name: "relationDocCommentChanged",
    oneof: 0
  )

  field(:relation_subject_type_added, 7,
    type: Authzed.Api.V1.ReflectionRelationSubjectTypeChange,
    json_name: "relationSubjectTypeAdded",
    oneof: 0
  )

  field(:relation_subject_type_removed, 8,
    type: Authzed.Api.V1.ReflectionRelationSubjectTypeChange,
    json_name: "relationSubjectTypeRemoved",
    oneof: 0
  )

  field(:permission_added, 9,
    type: Authzed.Api.V1.ReflectionPermission,
    json_name: "permissionAdded",
    oneof: 0
  )

  field(:permission_removed, 10,
    type: Authzed.Api.V1.ReflectionPermission,
    json_name: "permissionRemoved",
    oneof: 0
  )

  field(:permission_doc_comment_changed, 11,
    type: Authzed.Api.V1.ReflectionPermission,
    json_name: "permissionDocCommentChanged",
    oneof: 0
  )

  field(:permission_expr_changed, 12,
    type: Authzed.Api.V1.ReflectionPermission,
    json_name: "permissionExprChanged",
    oneof: 0
  )

  field(:caveat_added, 13,
    type: Authzed.Api.V1.ReflectionCaveat,
    json_name: "caveatAdded",
    oneof: 0
  )

  field(:caveat_removed, 14,
    type: Authzed.Api.V1.ReflectionCaveat,
    json_name: "caveatRemoved",
    oneof: 0
  )

  field(:caveat_doc_comment_changed, 15,
    type: Authzed.Api.V1.ReflectionCaveat,
    json_name: "caveatDocCommentChanged",
    oneof: 0
  )

  field(:caveat_expr_changed, 16,
    type: Authzed.Api.V1.ReflectionCaveat,
    json_name: "caveatExprChanged",
    oneof: 0
  )

  field(:caveat_parameter_added, 17,
    type: Authzed.Api.V1.ReflectionCaveatParameter,
    json_name: "caveatParameterAdded",
    oneof: 0
  )

  field(:caveat_parameter_removed, 18,
    type: Authzed.Api.V1.ReflectionCaveatParameter,
    json_name: "caveatParameterRemoved",
    oneof: 0
  )

  field(:caveat_parameter_type_changed, 19,
    type: Authzed.Api.V1.ReflectionCaveatParameterTypeChange,
    json_name: "caveatParameterTypeChanged",
    oneof: 0
  )
end

defmodule Authzed.Api.V1.SchemaService.Service do
  @moduledoc false

  use GRPC.Service, name: "authzed.api.v1.SchemaService", protoc_gen_elixir_version: "0.14.0"

  rpc(:ReadSchema, Authzed.Api.V1.ReadSchemaRequest, Authzed.Api.V1.ReadSchemaResponse)

  rpc(:WriteSchema, Authzed.Api.V1.WriteSchemaRequest, Authzed.Api.V1.WriteSchemaResponse)

  rpc(:ReflectSchema, Authzed.Api.V1.ReflectSchemaRequest, Authzed.Api.V1.ReflectSchemaResponse)

  rpc(
    :ComputablePermissions,
    Authzed.Api.V1.ComputablePermissionsRequest,
    Authzed.Api.V1.ComputablePermissionsResponse
  )

  rpc(
    :DependentRelations,
    Authzed.Api.V1.DependentRelationsRequest,
    Authzed.Api.V1.DependentRelationsResponse
  )

  rpc(:DiffSchema, Authzed.Api.V1.DiffSchemaRequest, Authzed.Api.V1.DiffSchemaResponse)
end

defmodule Authzed.Api.V1.SchemaService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.V1.SchemaService.Service
end
