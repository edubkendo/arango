defmodule Arango.Connection do
  def databases(%Arango.Config{url: url}) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url <> "/_api/database/user")
    {:ok, %{"result" => result}} = Poison.decode body
    result
  end
end
