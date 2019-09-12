defmodule ApiProjectWeb.ClockView do
  use ApiProjectWeb, :view
  use JaSerializer.PhoenixView

  attributes [:time, :status]
end
