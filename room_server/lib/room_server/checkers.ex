defmodule RoomServer.Checkers do

    def new_game(name) do

        new_board = %{
             "00" => :blue,
             "01" => :blue,
             "02" => :blue,
             "03" => :blue,
             "10" => :blue,
             "11" => :blue,
             "12" => :blue,
             "13" => :blue,
             "20" => :blue,
             "21" => :blue,
             "22" => :blue,
             "23" => :blue,

             "30" => :empty,
             "31" => :empty,
             "32" => :empty,
             "33" => :empty,
             "40" => :empty,
             "41" => :empty,
             "42" => :empty,
             "43" => :empty,

             "50" => :pink,
             "51" => :pink,
             "52" => :pink,
             "53" => :pink,
             "60" => :pink,
             "61" => :pink,
             "62" => :pink,
             "63" => :pink,
             "70" => :pink,
             "71" => :pink,
             "72" => :pink,
             "73" => :pink
          }

        Agent.get_and_update(RoomServer.GameState,
          fn state -> 
            new_state = Map.put(state,name, new_board)

            {new_state, new_state}
          end
        )
    end

    def make_move(name, ori_pos, new_pos) do
        
    end

end