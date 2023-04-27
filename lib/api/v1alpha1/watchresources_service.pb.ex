defmodule Authzed.Api.V1alpha1.PermissionUpdate.Permissionship do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :PERMISSIONSHIP_UNSPECIFIED, 0
  field :PERMISSIONSHIP_NO_PERMISSION, 1
  field :PERMISSIONSHIP_HAS_PERMISSION, 2
end

defmodule Authzed.Api.V1alpha1.WatchResourcesRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :resource_object_type, 1,
    type: :string,
    json_name: "resourceObjectType",
    deprecated: false

  field :permission, 2, type: :string, deprecated: false
  field :subject_object_type, 3, type: :string, json_name: "subjectObjectType"
  field :optional_subject_relation, 4, type: :string, json_name: "optionalSubjectRelation"
  field :optional_start_cursor, 5, type: Authzed.Api.V1.ZedToken, json_name: "optionalStartCursor"
end

defmodule Authzed.Api.V1alpha1.PermissionUpdate do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :subject, 1, type: Authzed.Api.V1.SubjectReference
  field :resource, 2, type: Authzed.Api.V1.ObjectReference
  field :relation, 3, type: :string

  field :updated_permission, 4,
    type: Authzed.Api.V1alpha1.PermissionUpdate.Permissionship,
    json_name: "updatedPermission",
    enum: true
end

defmodule Authzed.Api.V1alpha1.WatchResourcesResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :updates, 1, repeated: true, type: Authzed.Api.V1alpha1.PermissionUpdate
  field :changes_through, 2, type: Authzed.Api.V1.ZedToken, json_name: "changesThrough"
end

defmodule Authzed.Api.V1alpha1.WatchResourcesService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "authzed.api.v1alpha1.WatchResourcesService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :WatchResources,
      Authzed.Api.V1alpha1.WatchResourcesRequest,
      stream(Authzed.Api.V1alpha1.WatchResourcesResponse)
end

defmodule Authzed.Api.V1alpha1.WatchResourcesService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.V1alpha1.WatchResourcesService.Service
end