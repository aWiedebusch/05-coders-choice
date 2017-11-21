defmodule RoomServer.Application do


  use Application

  def start(_type, _args) do

    children = [
      supervisor(RoomServer.GameSupervisor, [])
    ]

    opts = [strategy: :one_for_one, name: RoomServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
