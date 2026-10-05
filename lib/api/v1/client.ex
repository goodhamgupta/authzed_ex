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

  `endpoint` is a target string for [`GRPC.Stub.connect/2`](https://hexdocs.pm/grpc/GRPC.Stub.html#connect/2),
  for example `"localhost:50051"`, `"grpc.example.com:443"`, or a typed address such as
  `"ipv4:10.0.0.5:50051"`.

  Connections use the Gun adapter unless you pass `:adapter`.

  ## Options

  https://hexdocs.pm/grpc/GRPC.Stub.html#connect/2-options
  """
  def new(endpoint, auth_header_or_ssl_cred, opts \\ [])

  def new(endpoint, auth_header, opts) when is_binary(endpoint) and is_list(auth_header) do
    grpc_opts = Keyword.merge(opts, headers: auth_header)
    {:ok, channel} = GRPC.Stub.connect(endpoint, grpc_opts)
    %__MODULE__{channel: channel}
  end

  def new(endpoint, ssl_cred, opts) when is_binary(endpoint) do
    grpc_opts = Keyword.merge(opts, cred: ssl_cred)
    {:ok, channel} = GRPC.Stub.connect(endpoint, grpc_opts)
    %__MODULE__{channel: channel}
  end

  @deprecated "Use Client.new/3 with a single GRPC target string; see GRPC.Stub.connect/2 (e.g. \"host:port\" or ipv4:/ipv6: forms)."
  def new(host, port, auth_header, opts) when is_binary(host) and is_list(auth_header) do
    new(deprecated_host_port_endpoint(host, port), auth_header, opts)
  end

  @deprecated "Use Client.new/3 with a single GRPC target string; see GRPC.Stub.connect/2."
  def new(host, port, ssl_cred, opts) when is_binary(host) and not is_list(ssl_cred) do
    new(deprecated_host_port_endpoint(host, port), ssl_cred, opts)
  end

  # Deprecated host+port arity: map to the same targets users should pass to new/3, without
  # GRPC.Stub.connect/3 (warnings-as-errors).
  defp deprecated_host_port_endpoint(host, port) do
    case :inet.parse_address(to_charlist(host)) do
      {:ok, {_, _, _, _}} ->
        "ipv4:#{host}:#{port}"

      {:ok, {_, _, _, _, _, _, _, _}} ->
        "ipv6:[#{host}]:#{port}"

      {:error, _} ->
        "#{host}:#{port}"
    end
  end
end
