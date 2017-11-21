defmodule RoomServer.GameSupervisor do
    use Supervisor 

    def start_link do
        Supervisor.start_link(__MODULE__, [], name: RoomServer.GameSupervisor)
    end

    def init(_args) do
        children = [
            worker(RoomServer.Server, [], restart: :transient)
        ]

        supervise(children, strategy: :one_for_one)
    end
end