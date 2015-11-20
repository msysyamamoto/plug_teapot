defmodule PlugTeapot do
  alias Plug.Conn
  alias Plug.Conn.Status

  @behaviour Plug

  def init(default), do: default

  def call(conn, _) do
      conn
      |> Conn.put_status Status.code(:im_a_teapot)
  end
end
