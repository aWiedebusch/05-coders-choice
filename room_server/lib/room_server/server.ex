defmodule RoomServer.Server do
    use GenServer

    def init do
        { :ok, [] }
    end


########################################################################

    def handle_call(:checkers, _from, state) do
        { :reply, RoomServer.Checkers.new_game(), state }
    end

    def handle_call(:chess, _from, state) do
        { :reply, RoomServer.Chess.new_game(), state }
    end

    def handle_call(:stratego, _from, state) do
        { :reply, RoomServer.Stratego.new_game(), state }
    end

    # def handle_call({:make_move, new_pos}, _from, state) do
    #     { :reply, RoomServer.Checkers.new_game(), state }
    # end
end