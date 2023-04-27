defmodule Authzed.Api.V1.RelationshipUpdate.Operation do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :OPERATION_UNSPECIFIED, 0
  field :OPERATION_CREATE, 1
  field :OPERATION_TOUCH, 2
  field :OPERATION_DELETE, 3
end

defmodule Authzed.Api.V1.AlgebraicSubjectSet.Operation do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :OPERATION_UNSPECIFIED, 0
  field :OPERATION_UNION, 1
  field :OPERATION_INTERSECTION, 2
  field :OPERATION_EXCLUSION, 3
end

defmodule Authzed.Api.V1.Relationship do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :resource, 1, type: Authzed.Api.V1.ObjectReference, deprecated: false
  field :relation, 2, type: :string, deprecated: false
  field :subject, 3, type: Authzed.Api.V1.SubjectReference, deprecated: false

  field :optional_caveat, 4,
    type: Authzed.Api.V1.ContextualizedCaveat,
    json_name: "optionalCaveat",
    deprecated: false
end

defmodule Authzed.Api.V1.ContextualizedCaveat do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :caveat_name, 1, type: :string, json_name: "caveatName", deprecated: false
  field :context, 2, type: Google.Protobuf.Struct, deprecated: false
end

defmodule Authzed.Api.V1.SubjectReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :object, 1, type: Authzed.Api.V1.ObjectReference, deprecated: false
  field :optional_relation, 2, type: :string, json_name: "optionalRelation", deprecated: false
end

defmodule Authzed.Api.V1.ObjectReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :object_type, 1, type: :string, json_name: "objectType", deprecated: false
  field :object_id, 2, type: :string, json_name: "objectId", deprecated: false
end

defmodule Authzed.Api.V1.ZedToken do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :token, 1, type: :string, deprecated: false
end

defmodule Authzed.Api.V1.RelationshipUpdate do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :operation, 1,
    type: Authzed.Api.V1.RelationshipUpdate.Operation,
    enum: true,
    deprecated: false

  field :relationship, 2, type: Authzed.Api.V1.Relationship, deprecated: false
end

defmodule Authzed.Api.V1.PermissionRelationshipTree do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :tree_type, 0

  field :intermediate, 1, type: Authzed.Api.V1.AlgebraicSubjectSet, oneof: 0
  field :leaf, 2, type: Authzed.Api.V1.DirectSubjectSet, oneof: 0
  field :expanded_object, 3, type: Authzed.Api.V1.ObjectReference, json_name: "expandedObject"
  field :expanded_relation, 4, type: :string, json_name: "expandedRelation"
end

defmodule Authzed.Api.V1.AlgebraicSubjectSet do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :operation, 1,
    type: Authzed.Api.V1.AlgebraicSubjectSet.Operation,
    enum: true,
    deprecated: false

  field :children, 2,
    repeated: true,
    type: Authzed.Api.V1.PermissionRelationshipTree,
    deprecated: false
end

defmodule Authzed.Api.V1.DirectSubjectSet do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :subjects, 1, repeated: true, type: Authzed.Api.V1.SubjectReference
end

defmodule Authzed.Api.V1.PartialCaveatInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :missing_required_context, 1,
    repeated: true,
    type: :string,
    json_name: "missingRequiredContext",
    deprecated: false
end