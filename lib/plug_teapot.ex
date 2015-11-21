defmodule PlugTeapot do
  import Plug.Conn, only: [put_status: 2, put_resp_header: 3, send_resp: 3, halt: 1]
  alias Plug.Conn.Status

  @behaviour Plug

  def init(default), do: default

  def call(conn, opts) do
      conn
      |> put_status(Status.code(:im_a_teapot))
      |> resp(opts)
  end

  defp resp(conn, opts) do
      case Keyword.fetch(opts, :custom_resp) do
          {:ok, true} ->
              conn
          _ ->
              conn
              |> put_resp_header("content-type", "text/plain")
              |> send_resp(conn.status, "I'm a teapot")
              |> halt
      end
  end
end
