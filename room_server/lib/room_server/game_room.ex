defmodule RoomServer.GameRoom do


    def new_room(name, game, password) do
        
        rooms = %RoomServer.RoomState{}

        room = %{
            name: name,
            game: game,
            password: password,
            board_state: null
        }

        

    end


end