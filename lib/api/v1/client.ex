defmodule Authzed.Api.V1.Client do
  alias Authzed.Api.V1

  @keys [
    :channel,
    permissions_service: V1.PermissionsService.Stub,
    schema_service: V1.SchemaService.Stub,
    watch_service: V1.WatchService.Stub
  ]

  defstruct @keys

  def new(endpoint, token) when is_binary(token) do
    {:ok, channel} = GRPC.Stub.connect(endpoint, headers: [authorization: "Bearer #{token}"])
    %__MODULE__{channel: channel}
  end

  def new(endpoint, ssl_cred) do
    {:ok, channel} = GRPC.Stub.connect(endpoint, cred: ssl_cred)
    %__MODULE__{channel: channel}
  end

  def new(host, port, token) when is_binary(token) do
    {:ok, channel} = GRPC.Stub.connect(host, port, headers: [authorization: "Bearer #{token}"])
    %__MODULE__{channel: channel}
  end

  def new(host, port, ssl_cred) do
    {:ok, channel} = GRPC.Stub.connect(host, port, cred: ssl_cred)
    %__MODULE__{channel: channel}
  end
end
