defmodule Authzed.Api.V1.GRPCUtil do
  def bearer_auth_token(ca_path) do
    GRPC.Credential.new(ssl: [cacertfile: ca_path])
  end

  def insecure_bearer_auth_token(token) do
    [authorization: "Bearer #{token}"]
  end
end
