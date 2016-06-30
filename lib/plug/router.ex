defmodule PlugPlay.Plug.Router do
  use Plug.Router

  alias PlugPlay.Plug.VerifyRequest

  plug Plug.Parsers, parsers: [:urlencoded, :multipart]
  plug VerifyRequest, fields: ["content", "mimetype"],
    paths:  ["/upload"]
  plug :match
  plug :dispatch

  get "/", do: send_resp(conn, 200, "Welcome")
  get "/about", do: send_resp(conn, 200, "This is an about page")
  post "/upload", do: send_resp(conn, 201, "Uploaded")
  match _, do: send_resp(conn, 404, "Oops!")
end
