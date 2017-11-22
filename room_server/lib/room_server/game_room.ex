defmodule RoomServer.GameRoom do


    def new_room(name, game, password) do
        Agent.update(RoomServer.RoomState, fn state ->
                     
                        state ++ [%{name: name, game: game, password: password, joinable: "Yes"}]
                    end)
    end

    def list_rooms() do
        Agent.get(RoomServer.RoomState, fn state -> 
            state
            |> Enum.map(fn(room) ->
                    [
                        room.name,
                        room.game,
                        room.joinable
                    ]
                end)
        end)
    end

    def make_move(name, ori_pos, new_pos) do
        
    end


end