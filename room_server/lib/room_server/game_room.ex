defmodule RoomServer.GameRoom do

alias RoomServer.Checkers, as: Checkers

    def new_room(name, game, password) do
        Agent.update(RoomServer.RoomState, fn state ->
            state ++ 
                [
                    %{
                        name: name, 
                        game: game, 
                        password: password, 
                        joinable: "Yes",
                        board_state: new_game(name, game)
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

    def find(name) do
        Agent.get(RoomServer.RoomState, fn state ->

            Enum.find(state, fn(room) ->
                room.name == name
            end)
        end)
    end

    ##################################################

    def new_game(name,:Checkers) do
        Checkers.new_game(name)
    end

    def make_move(name, ori_pos, new_pos) do
        Checkers.make_move(name, ori_pos, new_pos)
    end

end