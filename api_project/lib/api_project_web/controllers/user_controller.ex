defmodule ApiProjectWeb.UserController do
  use ApiProjectWeb, :controller

  alias ApiProject.Models
  alias ApiProject.Models.User

  action_fallback ApiProjectWeb.FallbackController

  def index(conn, _params) do
    users = Models.list_users()
    render(conn, "index.json-api", data: users)
  end

  def create(conn, %{"data" => user_params}) do
    with {:ok, %User{} = user} <- Models.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render("show.json-api", data: user)
    end
  end

  """
  def create(conn, %{"data" => user_params}) do
    with {:ok, %User{} = user} <- Models.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json-api", data: user)
    end
  end
  """

  def show(conn, %{"id" => id}) do
    user = Models.get_user!(id)
    render(conn, "show.json-api", data: user)
  end

  def show_user_by_email_pass(conn, %{"email" => email, "password" => password}) do
    user = Models.get_user_by_email_pass!(email, password)
    render(conn, "show.json-api", data: user)
  end

  def show_user_by_token(conn, %{"token" => token}) do
    user = Models.get_user_by_token!(token)
    render(conn, "show.json-api", data: user)
  end

  def update(conn, %{"id" => id, "data" => user_params}) do
    user = Models.get_user!(id)

    with {:ok, %User{} = user} <- Models.update_user(user, user_params) do
      render(conn, "show.json-api", data: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Models.get_user!(id)
    with {:ok, %User{}} <- Models.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
