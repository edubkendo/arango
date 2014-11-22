defmodule Arango.Connection do
  def start_link(config) do
    {:ok, _pid} = Agent.start_link(fn -> config end, name: :config)
  end

  def get_config(elem) do
    Agent.get(:config, &Map.get(&1, elem))
  end

  def databases(%Arango.Config{url: url}) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url <> "/_api/database/user")
    {:ok, %{"result" => result}} = Poison.decode body
    result
  end
end
