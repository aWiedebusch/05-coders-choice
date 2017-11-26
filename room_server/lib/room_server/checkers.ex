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

    def make_move(name, ori_pos, new_pos, color) do

        move(name, ori_pos, new_pos, color, legal(ori_pos, new_pos, color))

    end

###########################################################

    defp move(name, ori_pos, new_pos, color, :good_move) do

        Agent.get_and_update(RoomServer.GameState,
            fn state ->
                {:ok, moved_board} = Map.fetch(state, name)
                
                moved_board = Map.replace(moved_board, new_pos, color)
                moved_board = Map.replace(moved_board, ori_pos, :empty)

                Map.replace(state, name, moved_board)

                {{:good_move, moved_board}, moved_board}
            end
        )
    end
    defp move(_name, _ori_pos, _new_pos, _color, :bad_move) do
        {:bad_move, Agent.get(RoomServer.GameState, fn state -> state end)}
     end

    defp legal(ori_pos, new_pos, :blue) do
        {ori_row, ori_col, new_row, new_col} = pos_to_int(ori_pos, new_pos)

        blue_row_check(ori_row < new_row)
            |> b_col_check(rem(ori_row, 2), ori_col, new_col)

    end

    defp legal(ori_pos, new_pos, :pink) do
        {ori_row, ori_col, new_row, new_col} = pos_to_int(ori_pos, new_pos)

        pink_row_check(ori_row > new_row)
            |> p_col_check(rem(ori_row, 2), ori_col, new_col)
    end

    defp pos_to_int(ori_pos, new_pos) do
        ori_row = ori_pos
                  |> String.at(0)
                  |> String.to_integer()
        ori_col = ori_pos
                  |> String.at(1)
                  |> String.to_integer()
        new_row = new_pos
                  |> String.at(0)
                  |> String.to_integer()
        new_col = new_pos
                  |> String.at(1)
                  |> String.to_integer()

        {ori_row, ori_col, new_row, new_col}
    end

    defp pink_row_check(true),                       do: :ok
    defp pink_row_check(false),                      do: :bad_move

    defp blue_row_check(true),                       do: :ok
    defp blue_row_check(false),                      do: :bad_move

    defp p_col_check(:ok, 0, ori_col, new_col),        do: can_plus_one(new_col == (ori_col || ori_col + 1))
    defp p_col_check(:ok, 1, ori_col, new_col),        do: can_minus_one(new_col == (ori_col || ori_col - 1))
    defp p_col_check(:bad_move,_, _ori_col, _new_col), do: :bad_move

    defp b_col_check(:ok, 0, ori_col, new_col),        do: can_minus_one(new_col == (ori_col || ori_col - 1))
    defp b_col_check(:ok, 1, ori_col, new_col),        do: can_plus_one(new_col == (ori_col || ori_col + 1))
    defp b_col_check(:bad_move,_, _ori_col, _new_col), do: :bad_move

    defp can_plus_one(true),                         do: :good_move
    defp can_plus_one(false),                        do: :bad_move

    defp can_minus_one(true),                        do: :good_move
    defp can_minus_one(false),                       do: :bad_move


end