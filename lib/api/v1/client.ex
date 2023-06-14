defmodule Authzed.Api.V1.Client do
  alias Authzed.Api.V1

  @keys [
    :channel,
    permissions_service: V1.PermissionsService.Stub,
    schema_service: V1.SchemaService.Stub,
    watch_service: V1.WatchService.Stub,
    experimental_service: V1.ExperimentalService.Stub
  ]

  defstruct @keys

  def new(endpoint, auth_header) when is_list(auth_header) do
    {:ok, channel} = GRPC.Stub.connect(endpoint, headers: auth_header)
    %__MODULE__{channel: channel}
  end

  def new(endpoint, ssl_cred) do
    {:ok, channel} = GRPC.Stub.connect(endpoint, cred: ssl_cred)
    %__MODULE__{channel: channel}
  end

  def new(host, port, auth_header) when is_list(auth_header) do
    {:ok, channel} = GRPC.Stub.connect(host, port, headers: auth_header)
    %__MODULE__{channel: channel}
  end

  def new(host, port, ssl_cred) do
    {:ok, channel} = GRPC.Stub.connect(host, port, cred: ssl_cred)
    %__MODULE__{channel: channel}
  end
end
