defmodule RoomServer.Application do


  use Application

  def start(_type, args) do

    import Supervisor.Spec, warn: false

    children = [
      #supervisor(RoomServer.GameSupervisor, [])
      worker(RoomServer.RoomState, args, restart: :permanent),
      worker(RoomServer, [], restart: :transient)
    ]

    opts = [
      strategy: :rest_for_one,
      name: RoomServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
