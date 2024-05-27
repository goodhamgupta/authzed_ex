defmodule Authzed.Api.V1.BulkCheckPermissionRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)

  field(:items, 2,
    repeated: true,
    type: Authzed.Api.V1.BulkCheckPermissionRequestItem,
    deprecated: true
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

defmodule Authzed.Api.V1.ExperimentalReflectSchemaRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)

  field(:optional_filters, 2,
    repeated: true,
    type: Authzed.Api.V1.ExpSchemaFilter,
    json_name: "optionalFilters"
  )
end

defmodule Authzed.Api.V1.ExperimentalReflectSchemaResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:definitions, 1, repeated: true, type: Authzed.Api.V1.ExpDefinition)
  field(:caveats, 2, repeated: true, type: Authzed.Api.V1.ExpCaveat)
  field(:read_at, 3, type: Authzed.Api.V1.ZedToken, json_name: "readAt")
end

defmodule Authzed.Api.V1.ExpSchemaFilter do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

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

defmodule Authzed.Api.V1.ExpDefinition do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:name, 1, type: :string)
  field(:comment, 2, type: :string)
  field(:relations, 3, repeated: true, type: Authzed.Api.V1.ExpRelation)
  field(:permissions, 4, repeated: true, type: Authzed.Api.V1.ExpPermission)
end

defmodule Authzed.Api.V1.ExpCaveat do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:name, 1, type: :string)
  field(:comment, 2, type: :string)
  field(:parameters, 3, repeated: true, type: Authzed.Api.V1.ExpCaveatParameter)
  field(:expression, 4, type: :string)
end

defmodule Authzed.Api.V1.ExpCaveatParameter do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:name, 1, type: :string)
  field(:type, 2, type: :string)
  field(:parent_caveat_name, 3, type: :string, json_name: "parentCaveatName")
end

defmodule Authzed.Api.V1.ExpRelation do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:name, 1, type: :string)
  field(:comment, 2, type: :string)
  field(:parent_definition_name, 3, type: :string, json_name: "parentDefinitionName")

  field(:subject_types, 4,
    repeated: true,
    type: Authzed.Api.V1.ExpTypeReference,
    json_name: "subjectTypes"
  )
end

defmodule Authzed.Api.V1.ExpTypeReference do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof(:typeref, 0)

  field(:subject_definition_name, 1, type: :string, json_name: "subjectDefinitionName")
  field(:optional_caveat_name, 2, type: :string, json_name: "optionalCaveatName")
  field(:is_terminal_subject, 3, type: :bool, json_name: "isTerminalSubject", oneof: 0)
  field(:optional_relation_name, 4, type: :string, json_name: "optionalRelationName", oneof: 0)
  field(:is_public_wildcard, 5, type: :bool, json_name: "isPublicWildcard", oneof: 0)
end

defmodule Authzed.Api.V1.ExpPermission do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:name, 1, type: :string)
  field(:comment, 2, type: :string)
  field(:parent_definition_name, 3, type: :string, json_name: "parentDefinitionName")
end

defmodule Authzed.Api.V1.ExperimentalComputablePermissionsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)
  field(:definition_name, 2, type: :string, json_name: "definitionName")
  field(:relation_name, 3, type: :string, json_name: "relationName")

  field(:optional_definition_name_filter, 4,
    type: :string,
    json_name: "optionalDefinitionNameFilter"
  )
end

defmodule Authzed.Api.V1.ExpRelationReference do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:definition_name, 1, type: :string, json_name: "definitionName")
  field(:relation_name, 2, type: :string, json_name: "relationName")
  field(:is_permission, 3, type: :bool, json_name: "isPermission")
end

defmodule Authzed.Api.V1.ExperimentalComputablePermissionsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:permissions, 1, repeated: true, type: Authzed.Api.V1.ExpRelationReference)
  field(:read_at, 2, type: Authzed.Api.V1.ZedToken, json_name: "readAt")
end

defmodule Authzed.Api.V1.ExperimentalDependentRelationsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)
  field(:definition_name, 2, type: :string, json_name: "definitionName")
  field(:permission_name, 3, type: :string, json_name: "permissionName")
end

defmodule Authzed.Api.V1.ExperimentalDependentRelationsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:relations, 1, repeated: true, type: Authzed.Api.V1.ExpRelationReference)
  field(:read_at, 2, type: Authzed.Api.V1.ZedToken, json_name: "readAt")
end

defmodule Authzed.Api.V1.ExperimentalDiffSchemaRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)
  field(:comparison_schema, 2, type: :string, json_name: "comparisonSchema")
end

defmodule Authzed.Api.V1.ExperimentalDiffSchemaResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:diffs, 1, repeated: true, type: Authzed.Api.V1.ExpSchemaDiff)
  field(:read_at, 2, type: Authzed.Api.V1.ZedToken, json_name: "readAt")
end

defmodule Authzed.Api.V1.ExpRelationSubjectTypeChange do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:relation, 1, type: Authzed.Api.V1.ExpRelation)

  field(:changed_subject_type, 2,
    type: Authzed.Api.V1.ExpTypeReference,
    json_name: "changedSubjectType"
  )
end

defmodule Authzed.Api.V1.ExpCaveatParameterTypeChange do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:parameter, 1, type: Authzed.Api.V1.ExpCaveatParameter)
  field(:previous_type, 2, type: :string, json_name: "previousType")
end

defmodule Authzed.Api.V1.ExpSchemaDiff do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof(:diff, 0)

  field(:definition_added, 1,
    type: Authzed.Api.V1.ExpDefinition,
    json_name: "definitionAdded",
    oneof: 0
  )

  field(:definition_removed, 2,
    type: Authzed.Api.V1.ExpDefinition,
    json_name: "definitionRemoved",
    oneof: 0
  )

  field(:definition_doc_comment_changed, 3,
    type: Authzed.Api.V1.ExpDefinition,
    json_name: "definitionDocCommentChanged",
    oneof: 0
  )

  field(:relation_added, 4,
    type: Authzed.Api.V1.ExpRelation,
    json_name: "relationAdded",
    oneof: 0
  )

  field(:relation_removed, 5,
    type: Authzed.Api.V1.ExpRelation,
    json_name: "relationRemoved",
    oneof: 0
  )

  field(:relation_doc_comment_changed, 6,
    type: Authzed.Api.V1.ExpRelation,
    json_name: "relationDocCommentChanged",
    oneof: 0
  )

  field(:relation_subject_type_added, 7,
    type: Authzed.Api.V1.ExpRelationSubjectTypeChange,
    json_name: "relationSubjectTypeAdded",
    oneof: 0
  )

  field(:relation_subject_type_removed, 8,
    type: Authzed.Api.V1.ExpRelationSubjectTypeChange,
    json_name: "relationSubjectTypeRemoved",
    oneof: 0
  )

  field(:permission_added, 9,
    type: Authzed.Api.V1.ExpPermission,
    json_name: "permissionAdded",
    oneof: 0
  )

  field(:permission_removed, 10,
    type: Authzed.Api.V1.ExpPermission,
    json_name: "permissionRemoved",
    oneof: 0
  )

  field(:permission_doc_comment_changed, 11,
    type: Authzed.Api.V1.ExpPermission,
    json_name: "permissionDocCommentChanged",
    oneof: 0
  )

  field(:permission_expr_changed, 12,
    type: Authzed.Api.V1.ExpPermission,
    json_name: "permissionExprChanged",
    oneof: 0
  )

  field(:caveat_added, 13, type: Authzed.Api.V1.ExpCaveat, json_name: "caveatAdded", oneof: 0)
  field(:caveat_removed, 14, type: Authzed.Api.V1.ExpCaveat, json_name: "caveatRemoved", oneof: 0)

  field(:caveat_doc_comment_changed, 15,
    type: Authzed.Api.V1.ExpCaveat,
    json_name: "caveatDocCommentChanged",
    oneof: 0
  )

  field(:caveat_expr_changed, 16,
    type: Authzed.Api.V1.ExpCaveat,
    json_name: "caveatExprChanged",
    oneof: 0
  )

  field(:caveat_parameter_added, 17,
    type: Authzed.Api.V1.ExpCaveatParameter,
    json_name: "caveatParameterAdded",
    oneof: 0
  )

  field(:caveat_parameter_removed, 18,
    type: Authzed.Api.V1.ExpCaveatParameter,
    json_name: "caveatParameterRemoved",
    oneof: 0
  )

  field(:caveat_parameter_type_changed, 19,
    type: Authzed.Api.V1.ExpCaveatParameterTypeChange,
    json_name: "caveatParameterTypeChanged",
    oneof: 0
  )
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

  rpc(
    :ExperimentalReflectSchema,
    Authzed.Api.V1.ExperimentalReflectSchemaRequest,
    Authzed.Api.V1.ExperimentalReflectSchemaResponse
  )

  rpc(
    :ExperimentalComputablePermissions,
    Authzed.Api.V1.ExperimentalComputablePermissionsRequest,
    Authzed.Api.V1.ExperimentalComputablePermissionsResponse
  )

  rpc(
    :ExperimentalDependentRelations,
    Authzed.Api.V1.ExperimentalDependentRelationsRequest,
    Authzed.Api.V1.ExperimentalDependentRelationsResponse
  )

  rpc(
    :ExperimentalDiffSchema,
    Authzed.Api.V1.ExperimentalDiffSchemaRequest,
    Authzed.Api.V1.ExperimentalDiffSchemaResponse
  )
end

defmodule Authzed.Api.V1.ExperimentalService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.V1.ExperimentalService.Service
end
