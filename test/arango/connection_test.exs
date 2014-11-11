defmodule ConnectionTest do
  use ExUnit.Case

  @url "http://localhost:8529"

  test "it should make a connection" do
    config = %Arango.Config{url: @url}
    [h|t] = Arango.Connection.databases(config)
    assert h == "_system"
  end
end
