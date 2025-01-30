defmodule Authzed.Api.V1.ErrorReason do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:ERROR_REASON_UNSPECIFIED, 0)
  field(:ERROR_REASON_SCHEMA_PARSE_ERROR, 1)
  field(:ERROR_REASON_SCHEMA_TYPE_ERROR, 2)
  field(:ERROR_REASON_UNKNOWN_DEFINITION, 3)
  field(:ERROR_REASON_UNKNOWN_RELATION_OR_PERMISSION, 4)
  field(:ERROR_REASON_TOO_MANY_UPDATES_IN_REQUEST, 5)
  field(:ERROR_REASON_TOO_MANY_PRECONDITIONS_IN_REQUEST, 6)
  field(:ERROR_REASON_WRITE_OR_DELETE_PRECONDITION_FAILURE, 7)
  field(:ERROR_REASON_SERVICE_READ_ONLY, 8)
  field(:ERROR_REASON_UNKNOWN_CAVEAT, 9)
  field(:ERROR_REASON_INVALID_SUBJECT_TYPE, 10)
  field(:ERROR_REASON_CAVEAT_PARAMETER_TYPE_ERROR, 11)
  field(:ERROR_REASON_UPDATES_ON_SAME_RELATIONSHIP, 12)
  field(:ERROR_REASON_CANNOT_UPDATE_PERMISSION, 13)
  field(:ERROR_REASON_CAVEAT_EVALUATION_ERROR, 14)
  field(:ERROR_REASON_INVALID_CURSOR, 15)
  field(:ERROR_REASON_TOO_MANY_RELATIONSHIPS_FOR_TRANSACTIONAL_DELETE, 16)
  field(:ERROR_REASON_MAX_RELATIONSHIP_CONTEXT_SIZE, 17)
  field(:ERROR_REASON_ATTEMPT_TO_RECREATE_RELATIONSHIP, 18)
  field(:ERROR_REASON_MAXIMUM_DEPTH_EXCEEDED, 19)
  field(:ERROR_REASON_SERIALIZATION_FAILURE, 20)
  field(:ERROR_REASON_TOO_MANY_CHECKS_IN_REQUEST, 21)
  field(:ERROR_REASON_EXCEEDS_MAXIMUM_ALLOWABLE_LIMIT, 22)
  field(:ERROR_REASON_INVALID_FILTER, 23)
  field(:ERROR_REASON_INMEMORY_TOO_MANY_CONCURRENT_UPDATES, 24)
  field(:ERROR_REASON_EMPTY_PRECONDITION, 25)
  field(:ERROR_REASON_COUNTER_ALREADY_REGISTERED, 26)
  field(:ERROR_REASON_COUNTER_NOT_REGISTERED, 27)
  field(:ERROR_REASON_WILDCARD_NOT_ALLOWED, 28)
end
