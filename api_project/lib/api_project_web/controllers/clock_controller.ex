defmodule ApiProjectWeb.ClockController do
  use ApiProjectWeb, :controller

  alias ApiProject.Models
  alias ApiProject.Models.Clock

  action_fallback ApiProjectWeb.FallbackController

  def index(conn, _params) do
    clocks = Models.list_clocks()
    render(conn, "index.json-api", data: clocks)
  end

  def create(conn, %{"data" => clock_params, "user_id" => user_id}) do
    with {:ok, %Clock{} = clock} <- Models.create_clock(user_id, clock_params) do
      conn
      |> put_status(:created)
      |> render("show.json-api", data: clock)
    end
  end

  """
  def create(conn, %{"data" => clock_params, "user_id" => user_id}) do
    with {:ok, %Clock{} = clock} <- Models.create_clock(user_id, clock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", clock_path(conn, :show, clock))
      |> render("show.json-api", data: clock)
    end
  end
  """

  """
  def show(conn, %{"id" => id}) do
    clock = Models.get_clock!(id)
    render(conn, "show.json-api", data: clock)
  end
  """

  def show(conn, %{"user_id" => user_id}) do
    clock = Models.get_clock_by_userID!(user_id)
    render(conn, "show.json-api", data: clock)
  end

  def update(conn, %{"id" => id, "data" => clock_params}) do
    clock = Models.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Models.update_clock(clock, clock_params) do
      render(conn, "show.json-api", data: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Models.get_clock!(id)
    with {:ok, %Clock{}} <- Models.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
