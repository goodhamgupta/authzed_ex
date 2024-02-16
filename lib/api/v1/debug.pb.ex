defmodule Authzed.Api.V1.CheckDebugTrace.PermissionType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:PERMISSION_TYPE_UNSPECIFIED, 0)
  field(:PERMISSION_TYPE_RELATION, 1)
  field(:PERMISSION_TYPE_PERMISSION, 2)
end

defmodule Authzed.Api.V1.CheckDebugTrace.Permissionship do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:PERMISSIONSHIP_UNSPECIFIED, 0)
  field(:PERMISSIONSHIP_NO_PERMISSION, 1)
  field(:PERMISSIONSHIP_HAS_PERMISSION, 2)
  field(:PERMISSIONSHIP_CONDITIONAL_PERMISSION, 3)
end

defmodule Authzed.Api.V1.CaveatEvalInfo.Result do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:RESULT_UNSPECIFIED, 0)
  field(:RESULT_UNEVALUATED, 1)
  field(:RESULT_FALSE, 2)
  field(:RESULT_TRUE, 3)
  field(:RESULT_MISSING_SOME_CONTEXT, 4)
end

defmodule Authzed.Api.V1.DebugInformation do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:check, 1, type: Authzed.Api.V1.CheckDebugTrace)
  field(:schema_used, 2, type: :string, json_name: "schemaUsed")
end

defmodule Authzed.Api.V1.CheckDebugTrace.SubProblems do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:traces, 1, repeated: true, type: Authzed.Api.V1.CheckDebugTrace)
end

defmodule Authzed.Api.V1.CheckDebugTrace do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof(:resolution, 0)

  field(:resource, 1, type: Authzed.Api.V1.ObjectReference, deprecated: false)
  field(:permission, 2, type: :string)

  field(:permission_type, 3,
    type: Authzed.Api.V1.CheckDebugTrace.PermissionType,
    json_name: "permissionType",
    enum: true,
    deprecated: false
  )

  field(:subject, 4, type: Authzed.Api.V1.SubjectReference, deprecated: false)

  field(:result, 5,
    type: Authzed.Api.V1.CheckDebugTrace.Permissionship,
    enum: true,
    deprecated: false
  )

  field(:caveat_evaluation_info, 8,
    type: Authzed.Api.V1.CaveatEvalInfo,
    json_name: "caveatEvaluationInfo"
  )

  field(:was_cached_result, 6, type: :bool, json_name: "wasCachedResult", oneof: 0)

  field(:sub_problems, 7,
    type: Authzed.Api.V1.CheckDebugTrace.SubProblems,
    json_name: "subProblems",
    oneof: 0
  )
end

defmodule Authzed.Api.V1.CaveatEvalInfo do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:expression, 1, type: :string)
  field(:result, 2, type: Authzed.Api.V1.CaveatEvalInfo.Result, enum: true)
  field(:context, 3, type: Google.Protobuf.Struct)

  field(:partial_caveat_info, 4,
    type: Authzed.Api.V1.PartialCaveatInfo,
    json_name: "partialCaveatInfo"
  )

  field(:caveat_name, 5, type: :string, json_name: "caveatName")
end
