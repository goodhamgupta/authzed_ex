defmodule AuthzedTest do
  use ExUnit.Case

  alias Authzed.Api.V1.{
    Client,
    CheckPermissionRequest,
    Client,
    Consistency,
    ObjectReference,
    ReadSchemaRequest,
    Relationship,
    RelationshipUpdate,
    SubjectReference,
    WriteRelationshipsRequest,
    WriteSchemaRequest
  }

  alias Authzed.Api.V1.GRPCUtil

  setup_all do
    {:ok,
     client:
       Client.new("localhost:50051", GRPCUtil.insecure_bearer_auth_token("somerandomkeyhere"))}
  end

  test "basic schema", state do
    client = state[:client]

    schema = ~s"""
        definition document {
            relation reader: user
        }
        definition user {}
    """

    client.schema_service.write_schema(client.channel, WriteSchemaRequest.new(schema: schema))

    {:ok, resp} = client.schema_service.read_schema(client.channel, ReadSchemaRequest.new())
    assert String.contains?(resp.schema_text, "definition document")
    assert String.contains?(resp.schema_text, "definition user")
  end

  test "basic operation", state do
    client = state[:client]

    schema = ~s"""
        definition post {
            relation writer: user
            relation reader: user
            permission write = writer
            permission view = reader + writer
        }
        definition user {}
    """

    client.schema_service.write_schema(client.channel, WriteSchemaRequest.new(schema: schema))

    emilia =
      SubjectReference.new(object: ObjectReference.new(object_type: "user", object_id: "emilia"))

    beatrice =
      SubjectReference.new(
        object: ObjectReference.new(object_type: "user", object_id: "beatrice")
      )

    post_one = ObjectReference.new(object_type: "post", object_id: "1")

    # Add relationships
    client.channel
    |> client.permissions_service.write_relationships(
      WriteRelationshipsRequest.new(
        updates: [
          RelationshipUpdate.new(
            operation: :OPERATION_CREATE,
            relationship:
              Relationship.new(
                resource: post_one,
                relation: "writer",
                subject: emilia
              )
          ),
          RelationshipUpdate.new(
            operation: :OPERATION_CREATE,
            relationship:
              Relationship.new(
                resource: post_one,
                relation: "reader",
                subject: beatrice
              )
          )
        ]
      )
    )

    # Check permissions

    {:ok, response} =
      client.permissions_service.check_permission(
        client.channel,
        CheckPermissionRequest.new(
          resource: post_one,
          permission: "view",
          subject: emilia,
          consistency: Consistency.new(requirement: {:fully_consistent, true})
        )
      )

    assert response.permissionship == :PERMISSIONSHIP_HAS_PERMISSION

    {:ok, response} =
      client.permissions_service.check_permission(
        client.channel,
        CheckPermissionRequest.new(
          resource: post_one,
          permission: "view",
          subject: beatrice,
          consistency: Consistency.new(requirement: {:fully_consistent, true})
        )
      )

    assert response.permissionship == :PERMISSIONSHIP_HAS_PERMISSION

    {:ok, response} =
      client.permissions_service.check_permission(
        client.channel,
        CheckPermissionRequest.new(
          resource: post_one,
          permission: "write",
          subject: beatrice,
          consistency: Consistency.new(requirement: {:fully_consistent, true})
        )
      )

    assert response.permissionship == :PERMISSIONSHIP_NO_PERMISSION
  end
end
