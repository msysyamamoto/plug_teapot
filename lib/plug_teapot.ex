defmodule PlugTeapot do
  alias Plug.Conn
  alias Plug.Conn.Status
  
  @behaviour Plug

  def init(default), do: default

  def call(conn, opts) do
      conn
      |> Conn.put_status(Status.code(:im_a_teapot))
      |> resp(opts)
  end

  defp resp(conn, opts) do
      case Keyword.fetch(opts, :custom_resp) do
          {:ok, true} ->
              conn
          _ ->
              conn
              |> Conn.put_resp_header("content-type", "text/plain")
              |> Conn.send_resp(conn.status, "I'm a teapot")
              |> Conn.halt
      end
  end
end
