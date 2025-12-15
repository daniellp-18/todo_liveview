defmodule TodoLiveview.Repo do
  use Ecto.Repo,
    otp_app: :todo_liveview,
    adapter: Ecto.Adapters.Postgres
end
