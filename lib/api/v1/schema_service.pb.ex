defmodule Authzed.Api.V1.ReadSchemaRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3
end
defmodule Authzed.Api.V1.ReadSchemaResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :schema_text, 1, type: :string, json_name: "schemaText"
end
defmodule Authzed.Api.V1.WriteSchemaRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :schema, 1, type: :string, deprecated: false
end
defmodule Authzed.Api.V1.WriteSchemaResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3
end
