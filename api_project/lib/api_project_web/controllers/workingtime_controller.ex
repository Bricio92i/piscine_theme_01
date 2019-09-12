defmodule ApiProjectWeb.WorkingtimeController do
  use ApiProjectWeb, :controller

  alias ApiProject.Models
  alias ApiProject.Models.Workingtime

  action_fallback ApiProjectWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Models.list_workingtimes()
    render(conn, "index.json-api", data: workingtimes)
  end

  def create(conn, %{"data" => workingtime_params, "user_id" => user_id }) do
    with {:ok, %Workingtime{} = workingtime} <- Models.create_workingtime(user_id, workingtime_params) do
      conn
      |> put_status(:created)
      |> render("show.json-api", data: workingtime)
    end
  end

  """
    ##in conn get why the third line does not work
    def create(conn, %{"data" => workingtime_params, "user_id" => user_id }) do
      with {:ok, %Workingtime{} = workingtime} <- Models.create_workingtime(user_id, workingtime_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", workingtime_path(conn, :show, workingtime.id))
        |> render("show.json-api", data: workingtime)
      end
    end
  """

  """
  def show(conn, %{"id" => id}) do
    workingtime = Models.get_workingtime!(id)
    render(conn, "show.json-api", data: workingtime)
  end
  """

  def show(conn, %{"user_id" => id}) do
    workingtimes = Models.get_workingtimes_by_userID!(id)
    render(conn, "show.json-api", data: workingtimes)
  end

  def show_wt_user_by_start_end(conn, %{"user_id" => user_id, "start"  => wt_start, "end" => wt_end}) do
    workingtimes = Models.get_workingtime_by_userID_start_end!(user_id, wt_start, wt_end)
    render(conn, "show.json-api", data: workingtimes)
  end

  def show_wt_by_user_and_wtid(conn, %{"user_id" => user_id, "workingtime_id"  => workingtime_id}) do
    workingtimes = Models.get_workingtime_by_userID_wtID!(user_id, workingtime_id)
    render(conn, "show.json-api", data: workingtimes)
  end

  def update(conn, %{"id" => id, "data" => workingtime_params}) do
    workingtime = Models.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- Models.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json-api", data: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Models.get_workingtime!(id)
    with {:ok, %Workingtime{}} <- Models.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")  ### Show status and message here and return it in json
    end
  end
end
