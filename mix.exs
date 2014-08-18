defmodule RiakExample.Mixfile do
  use Mix.Project

  def project do
    [app: :riak_example,
     version: "0.0.1",
     elixir: "~> 0.15.2-dev",
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [ {:riakc, github: "basho/riak-erlang-client"} ]
  end
end
