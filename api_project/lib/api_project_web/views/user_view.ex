defmodule ApiProjectWeb.UserView do
  use ApiProjectWeb, :view
  use JaSerializer.PhoenixView

  attributes [:email, :username]
end
