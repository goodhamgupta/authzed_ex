defmodule Authzed.Api.V1.LookupPermissionship do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:LOOKUP_PERMISSIONSHIP_UNSPECIFIED, 0)
  field(:LOOKUP_PERMISSIONSHIP_HAS_PERMISSION, 1)
  field(:LOOKUP_PERMISSIONSHIP_CONDITIONAL_PERMISSION, 2)
end

defmodule Authzed.Api.V1.Precondition.Operation do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:OPERATION_UNSPECIFIED, 0)
  field(:OPERATION_MUST_NOT_MATCH, 1)
  field(:OPERATION_MUST_MATCH, 2)
end

defmodule Authzed.Api.V1.CheckPermissionResponse.Permissionship do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:PERMISSIONSHIP_UNSPECIFIED, 0)
  field(:PERMISSIONSHIP_NO_PERMISSION, 1)
  field(:PERMISSIONSHIP_HAS_PERMISSION, 2)
  field(:PERMISSIONSHIP_CONDITIONAL_PERMISSION, 3)
end

defmodule Authzed.Api.V1.Consistency do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  oneof(:requirement, 0)

  field(:minimize_latency, 1,
    type: :bool,
    json_name: "minimizeLatency",
    oneof: 0,
    deprecated: false
  )

  field(:at_least_as_fresh, 2,
    type: Authzed.Api.V1.ZedToken,
    json_name: "atLeastAsFresh",
    oneof: 0
  )

  field(:at_exact_snapshot, 3,
    type: Authzed.Api.V1.ZedToken,
    json_name: "atExactSnapshot",
    oneof: 0
  )

  field(:fully_consistent, 4,
    type: :bool,
    json_name: "fullyConsistent",
    oneof: 0,
    deprecated: false
  )
end

defmodule Authzed.Api.V1.RelationshipFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:resource_type, 1, type: :string, json_name: "resourceType", deprecated: false)

  field(:optional_resource_id, 2,
    type: :string,
    json_name: "optionalResourceId",
    deprecated: false
  )

  field(:optional_relation, 3, type: :string, json_name: "optionalRelation", deprecated: false)

  field(:optional_subject_filter, 4,
    type: Authzed.Api.V1.SubjectFilter,
    json_name: "optionalSubjectFilter"
  )
end

defmodule Authzed.Api.V1.SubjectFilter.RelationFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:relation, 1, type: :string, deprecated: false)
end

defmodule Authzed.Api.V1.SubjectFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:subject_type, 1, type: :string, json_name: "subjectType", deprecated: false)
  field(:optional_subject_id, 2, type: :string, json_name: "optionalSubjectId", deprecated: false)

  field(:optional_relation, 3,
    type: Authzed.Api.V1.SubjectFilter.RelationFilter,
    json_name: "optionalRelation"
  )
end

defmodule Authzed.Api.V1.ReadRelationshipsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)

  field(:relationship_filter, 2,
    type: Authzed.Api.V1.RelationshipFilter,
    json_name: "relationshipFilter",
    deprecated: false
  )
end

defmodule Authzed.Api.V1.ReadRelationshipsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:read_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "readAt", deprecated: false)
  field(:relationship, 2, type: Authzed.Api.V1.Relationship, deprecated: false)
end

defmodule Authzed.Api.V1.Precondition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:operation, 1, type: Authzed.Api.V1.Precondition.Operation, enum: true, deprecated: false)
  field(:filter, 2, type: Authzed.Api.V1.RelationshipFilter, deprecated: false)
end

defmodule Authzed.Api.V1.WriteRelationshipsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:updates, 1, repeated: true, type: Authzed.Api.V1.RelationshipUpdate, deprecated: false)

  field(:optional_preconditions, 2,
    repeated: true,
    type: Authzed.Api.V1.Precondition,
    json_name: "optionalPreconditions",
    deprecated: false
  )
end

defmodule Authzed.Api.V1.WriteRelationshipsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:written_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "writtenAt")
end

defmodule Authzed.Api.V1.DeleteRelationshipsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:relationship_filter, 1,
    type: Authzed.Api.V1.RelationshipFilter,
    json_name: "relationshipFilter",
    deprecated: false
  )

  field(:optional_preconditions, 2,
    repeated: true,
    type: Authzed.Api.V1.Precondition,
    json_name: "optionalPreconditions",
    deprecated: false
  )
end

defmodule Authzed.Api.V1.DeleteRelationshipsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:deleted_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "deletedAt")
end

defmodule Authzed.Api.V1.CheckPermissionRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)
  field(:resource, 2, type: Authzed.Api.V1.ObjectReference, deprecated: false)
  field(:permission, 3, type: :string, deprecated: false)
  field(:subject, 4, type: Authzed.Api.V1.SubjectReference, deprecated: false)
  field(:context, 5, type: Google.Protobuf.Struct, deprecated: false)
end

defmodule Authzed.Api.V1.CheckPermissionResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:checked_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "checkedAt", deprecated: false)

  field(:permissionship, 2,
    type: Authzed.Api.V1.CheckPermissionResponse.Permissionship,
    enum: true,
    deprecated: false
  )

  field(:partial_caveat_info, 3,
    type: Authzed.Api.V1.PartialCaveatInfo,
    json_name: "partialCaveatInfo",
    deprecated: false
  )
end

defmodule Authzed.Api.V1.ExpandPermissionTreeRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)
  field(:resource, 2, type: Authzed.Api.V1.ObjectReference, deprecated: false)
  field(:permission, 3, type: :string, deprecated: false)
end

defmodule Authzed.Api.V1.ExpandPermissionTreeResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:expanded_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "expandedAt")
  field(:tree_root, 2, type: Authzed.Api.V1.PermissionRelationshipTree, json_name: "treeRoot")
end

defmodule Authzed.Api.V1.LookupResourcesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)

  field(:resource_object_type, 2,
    type: :string,
    json_name: "resourceObjectType",
    deprecated: false
  )

  field(:permission, 3, type: :string, deprecated: false)
  field(:subject, 4, type: Authzed.Api.V1.SubjectReference, deprecated: false)
  field(:context, 5, type: Google.Protobuf.Struct, deprecated: false)
end

defmodule Authzed.Api.V1.LookupResourcesResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:looked_up_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "lookedUpAt")
  field(:resource_object_id, 2, type: :string, json_name: "resourceObjectId")

  field(:permissionship, 3,
    type: Authzed.Api.V1.LookupPermissionship,
    enum: true,
    deprecated: false
  )

  field(:partial_caveat_info, 4,
    type: Authzed.Api.V1.PartialCaveatInfo,
    json_name: "partialCaveatInfo",
    deprecated: false
  )
end

defmodule Authzed.Api.V1.LookupSubjectsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:consistency, 1, type: Authzed.Api.V1.Consistency)
  field(:resource, 2, type: Authzed.Api.V1.ObjectReference, deprecated: false)
  field(:permission, 3, type: :string, deprecated: false)
  field(:subject_object_type, 4, type: :string, json_name: "subjectObjectType", deprecated: false)

  field(:optional_subject_relation, 5,
    type: :string,
    json_name: "optionalSubjectRelation",
    deprecated: false
  )

  field(:context, 6, type: Google.Protobuf.Struct, deprecated: false)
end

defmodule Authzed.Api.V1.LookupSubjectsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:looked_up_at, 1, type: Authzed.Api.V1.ZedToken, json_name: "lookedUpAt")
  field(:subject_object_id, 2, type: :string, json_name: "subjectObjectId", deprecated: true)

  field(:excluded_subject_ids, 3,
    repeated: true,
    type: :string,
    json_name: "excludedSubjectIds",
    deprecated: true
  )

  field(:permissionship, 4,
    type: Authzed.Api.V1.LookupPermissionship,
    enum: true,
    deprecated: true
  )

  field(:partial_caveat_info, 5,
    type: Authzed.Api.V1.PartialCaveatInfo,
    json_name: "partialCaveatInfo",
    deprecated: true
  )

  field(:subject, 6, type: Authzed.Api.V1.ResolvedSubject)

  field(:excluded_subjects, 7,
    repeated: true,
    type: Authzed.Api.V1.ResolvedSubject,
    json_name: "excludedSubjects"
  )
end

defmodule Authzed.Api.V1.ResolvedSubject do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field(:subject_object_id, 1, type: :string, json_name: "subjectObjectId")

  field(:permissionship, 2,
    type: Authzed.Api.V1.LookupPermissionship,
    enum: true,
    deprecated: false
  )

  field(:partial_caveat_info, 3,
    type: Authzed.Api.V1.PartialCaveatInfo,
    json_name: "partialCaveatInfo",
    deprecated: false
  )
end

defmodule Authzed.Api.V1.PermissionsService.Service do
  @moduledoc false
  use GRPC.Service, name: "authzed.api.v1.PermissionsService", protoc_gen_elixir_version: "0.10.0"

  rpc(
    :ReadRelationships,
    Authzed.Api.V1.ReadRelationshipsRequest,
    stream(Authzed.Api.V1.ReadRelationshipsResponse)
  )

  rpc(
    :WriteRelationships,
    Authzed.Api.V1.WriteRelationshipsRequest,
    Authzed.Api.V1.WriteRelationshipsResponse
  )

  rpc(
    :DeleteRelationships,
    Authzed.Api.V1.DeleteRelationshipsRequest,
    Authzed.Api.V1.DeleteRelationshipsResponse
  )

  rpc(
    :CheckPermission,
    Authzed.Api.V1.CheckPermissionRequest,
    Authzed.Api.V1.CheckPermissionResponse
  )

  rpc(
    :ExpandPermissionTree,
    Authzed.Api.V1.ExpandPermissionTreeRequest,
    Authzed.Api.V1.ExpandPermissionTreeResponse
  )

  rpc(
    :LookupResources,
    Authzed.Api.V1.LookupResourcesRequest,
    stream(Authzed.Api.V1.LookupResourcesResponse)
  )

  rpc(
    :LookupSubjects,
    Authzed.Api.V1.LookupSubjectsRequest,
    stream(Authzed.Api.V1.LookupSubjectsResponse)
  )
end

defmodule Authzed.Api.V1.PermissionsService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Authzed.Api.V1.PermissionsService.Service
end
