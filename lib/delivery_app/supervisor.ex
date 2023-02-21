defmodule DeliveryApp.Supervisor do
  use Supervisor
  alias DeliveryApp.PostalCode

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      PostalCode.Supervisor
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end
