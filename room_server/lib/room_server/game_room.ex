defmodule RoomServer.GameRoom do


    def new_room(name, game, password) do
        Agent.update(RoomServer.RoomState, fn state ->
            state ++ 
                [
                    %{
                        name: name, 
                        game: game, 
                        password: password, 
                        joinable: "Yes",
                        board_state: :initializing
                    }
                ]
            end)
    end

    def list_rooms() do
        Agent.get(RoomServer.RoomState, fn state -> 
            Enum.map(state, fn(room) ->
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

    def find(name) do
        Agent.get(RoomServer.RoomState, fn state ->

            Enum.find(state, fn(room) ->
                room.name == name
            end)
        end)
    end

end