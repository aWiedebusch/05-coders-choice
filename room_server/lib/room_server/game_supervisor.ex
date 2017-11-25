defmodule RoomServer.GameSupervisor do
    use Supervisor 

    def start_link do
        Supervisor.start_link(__MODULE__, [], name: RoomServer.GameSupervisor)
    end

    def init(_args) do

        import Supervisor.Spec, warn: false

        children = [
            worker(RoomServer.GameState, [], restart: :permanent)
        ]

        supervise(children, strategy: :rest_for_one)
    end
end