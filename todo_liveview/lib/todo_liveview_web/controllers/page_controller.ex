defmodule TodoLiveviewWeb.PageController do
  use TodoLiveviewWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
