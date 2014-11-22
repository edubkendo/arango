defmodule ConnectionTest do
  use ExUnit.Case

  @url "http://localhost:8529"

  setup do
    config = %Arango.Config{url: @url}
    {:ok, %{config: config}}
  end

  test "it should make a connection", %{config: config} do
    [h|t] = Arango.Connection.databases(config)
    assert h == "_system"
  end

  test "it should preserve config", %{config: config} do
    Arango.Connection.start_link(config)
    assert @url == Arango.Connection.get_config(:url)
  end
end
