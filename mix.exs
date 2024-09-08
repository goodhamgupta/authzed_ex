defmodule Authzed.MixProject do
  use Mix.Project

  @version "1.3.0"
  @repo_url "https://github.com/goodhamgupta/authzed_ex/"

  def project do
    [
      app: :authzed,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      package: package(),
      description: "Unofficial SpiceDB library for Elixir",

      # Docs
      name: "Authzed",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, "~> 0.8.1"},
      {:protobuf, "~> 0.12.0"},
      {:google_protos, "~> 0.3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @repo_url}
    ]
  end

  defp docs do
    [
      main: "Authzed",
      source_ref: "v#{@version}",
      source_url: @repo_url
    ]
  end
end
