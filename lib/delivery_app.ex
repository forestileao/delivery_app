defmodule DeliveryApp do
  use Application

  def start(_type, _args) do
    DeliveryApp.Supervisor.start_link([])
  end
end
