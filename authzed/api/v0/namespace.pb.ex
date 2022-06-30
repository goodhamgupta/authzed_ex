defmodule Authzed.Api.V0.ComputedUserset.Object do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :TUPLE_OBJECT, 0
  field :TUPLE_USERSET_OBJECT, 1
end
defmodule Authzed.Api.V0.Metadata do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :metadata_message, 1,
    repeated: true,
    type: Google.Protobuf.Any,
    json_name: "metadataMessage",
    deprecated: false
end
defmodule Authzed.Api.V0.NamespaceDefinition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :relation, 2, repeated: true, type: Authzed.Api.V0.Relation
  field :metadata, 3, type: Authzed.Api.V0.Metadata
end
defmodule Authzed.Api.V0.Relation do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :userset_rewrite, 2, type: Authzed.Api.V0.UsersetRewrite, json_name: "usersetRewrite"
  field :type_information, 3, type: Authzed.Api.V0.TypeInformation, json_name: "typeInformation"
  field :metadata, 4, type: Authzed.Api.V0.Metadata
end
defmodule Authzed.Api.V0.TypeInformation do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :allowed_direct_relations, 1,
    repeated: true,
    type: Authzed.Api.V0.AllowedRelation,
    json_name: "allowedDirectRelations"
end
defmodule Authzed.Api.V0.AllowedRelation.PublicWildcard do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3
end
defmodule Authzed.Api.V0.AllowedRelation do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  oneof :relation_or_wildcard, 0

  field :namespace, 1, type: :string, deprecated: false
  field :relation, 3, type: :string, oneof: 0, deprecated: false

  field :public_wildcard, 4,
    type: Authzed.Api.V0.AllowedRelation.PublicWildcard,
    json_name: "publicWildcard",
    oneof: 0
end
defmodule Authzed.Api.V0.UsersetRewrite do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  oneof :rewrite_operation, 0

  field :union, 1, type: Authzed.Api.V0.SetOperation, oneof: 0, deprecated: false
  field :intersection, 2, type: Authzed.Api.V0.SetOperation, oneof: 0, deprecated: false
  field :exclusion, 3, type: Authzed.Api.V0.SetOperation, oneof: 0, deprecated: false
end
defmodule Authzed.Api.V0.SetOperation.Child.This do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3
end
defmodule Authzed.Api.V0.SetOperation.Child do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  oneof :child_type, 0

  field :_this, 1, type: Authzed.Api.V0.SetOperation.Child.This, json_name: "This", oneof: 0

  field :computed_userset, 2,
    type: Authzed.Api.V0.ComputedUserset,
    json_name: "computedUserset",
    oneof: 0,
    deprecated: false

  field :tuple_to_userset, 3,
    type: Authzed.Api.V0.TupleToUserset,
    json_name: "tupleToUserset",
    oneof: 0,
    deprecated: false

  field :userset_rewrite, 4,
    type: Authzed.Api.V0.UsersetRewrite,
    json_name: "usersetRewrite",
    oneof: 0,
    deprecated: false
end
defmodule Authzed.Api.V0.SetOperation do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :child, 1, repeated: true, type: Authzed.Api.V0.SetOperation.Child, deprecated: false
end
defmodule Authzed.Api.V0.TupleToUserset.Tupleset do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :relation, 1, type: :string, deprecated: false
end
defmodule Authzed.Api.V0.TupleToUserset do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :tupleset, 1, type: Authzed.Api.V0.TupleToUserset.Tupleset, deprecated: false

  field :computed_userset, 2,
    type: Authzed.Api.V0.ComputedUserset,
    json_name: "computedUserset",
    deprecated: false
end
defmodule Authzed.Api.V0.ComputedUserset do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :object, 1, type: Authzed.Api.V0.ComputedUserset.Object, enum: true, deprecated: false
  field :relation, 2, type: :string, deprecated: false
end
