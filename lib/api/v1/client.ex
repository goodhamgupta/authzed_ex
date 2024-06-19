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

  @doc """
  Establishes a gRPC connection with the Authzed service.

  ## Options:

  https://hexdocs.pm/grpc/GRPC.Stub.html#connect/2-options
  """
  def new(endpoint, auth_header_or_ssl_cred, opts \\ [])

  def new(endpoint, auth_header, opts) when is_list(auth_header) do
    grpc_opts = Keyword.merge(opts, headers: auth_header)
    {:ok, channel} = GRPC.Stub.connect(endpoint, grpc_opts)
    %__MODULE__{channel: channel}
  end

  def new(endpoint, ssl_cred, opts) do
    grpc_opts = Keyword.merge(opts, cred: ssl_cred)
    {:ok, channel} = GRPC.Stub.connect(endpoint, grpc_opts)
    %__MODULE__{channel: channel}
  end

  def new(host, port, auth_header, opts) when is_list(auth_header) do
    grpc_opts = Keyword.merge(opts, headers: auth_header)
    {:ok, channel} = GRPC.Stub.connect(host, port, grpc_opts)
    %__MODULE__{channel: channel}
  end

  def new(host, port, ssl_cred, opts) do
    grpc_opts = Keyword.merge(opts, cred: ssl_cred)
    {:ok, channel} = GRPC.Stub.connect(host, port, grpc_opts)
    %__MODULE__{channel: channel}
  end
end
