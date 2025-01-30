defmodule Authzed.Api.Materialize.V0.PermissionChange.Permissionship do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:PERMISSIONSHIP_UNSPECIFIED, 0)
  field(:PERMISSIONSHIP_NO_PERMISSION, 1)
  field(:PERMISSIONSHIP_HAS_PERMISSION, 2)
  field(:PERMISSIONSHIP_CONDITIONAL_PERMISSION, 3)
end

defmodule Authzed.Api.Materialize.V0.WatchPermissionsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:permissions, 1, repeated: true, type: Authzed.Api.Materialize.V0.WatchedPermission)

  field(:optional_starting_after, 2,
    type: Authzed.Api.V1.ZedToken,
    json_name: "optionalStartingAfter"
  )
end

defmodule Authzed.Api.Materialize.V0.WatchedPermission do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:resource_type, 1, type: :string, json_name: "resourceType")
  field(:permission, 2, type: :string)
  field(:subject_type, 3, type: :string, json_name: "subjectType")
  field(:optional_subject_relation, 4, type: :string, json_name: "optionalSubjectRelation")
end

defmodule Authzed.Api.Materialize.V0.WatchPermissionsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof(:response, 0)

  field(:change, 1, type: Authzed.Api.Materialize.V0.PermissionChange, oneof: 0)

  field(:completed_revision, 2,
    type: Authzed.Api.V1.ZedToken,
    json_name: "completedRevision",
    oneof: 0
  )
end

defmodule Authzed.Api.Materialize.V0.PermissionChange do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:revision, 1, type: Authzed.Api.V1.ZedToken)
  field(:resource, 2, type: Authzed.Api.V1.ObjectReference)
  field(:permission, 3, type: :string)
  field(:subject, 4, type: Authzed.Api.V1.SubjectReference)

  field(:permissionship, 5,
    type: Authzed.Api.Materialize.V0.PermissionChange.Permissionship,
    enum: true
  )
end

defmodule Authzed.Api.Materialize.V0.WatchPermissionsService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "authzed.api.materialize.v0.WatchPermissionsService",
    protoc_gen_elixir_version: "0.14.0"

  rpc(
    :WatchPermissions,
    Authzed.Api.Materialize.V0.WatchPermissionsRequest,
    stream(Authzed.Api.Materialize.V0.WatchPermissionsResponse)
  )
end

defmodule Authzed.Api.Materialize.V0.WatchPermissionsService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Authzed.Api.Materialize.V0.WatchPermissionsService.Service
end
