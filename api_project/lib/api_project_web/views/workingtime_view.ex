defmodule ApiProjectWeb.WorkingtimeView do
  use ApiProjectWeb, :view
  use JaSerializer.PhoenixView

  attributes [:start, :end, :user_id]
end
