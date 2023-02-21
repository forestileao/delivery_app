defmodule DeliveryApp.PostalCode.Supervisor do
  use Supervisor
  alias DeliveryApp.PostalCode.Store

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      {Store, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
