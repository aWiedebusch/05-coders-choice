defmodule RoomServer.Server do
    use GenServer

    # @name RoomServer

    def init do
        { :ok, [] }
    end

    # def start_link(default \\ []) do
    #     GenServer.start_link(RoomServer.GameRoom, default, name: @name)
    # end


########################################################################

    def handle_call( {:new_room, name, game, password}, _from, _state ) do
        new_room = RoomServer.GameRoom.new_room(name, game, password)
        { :reply, new_room, new_room }
    end

    def handle_call({:make_move, name, ori_pos, new_pos}, _from, state) do
        new_room = RoomServer.GameRoom.make_move(name, ori_pos, new_pos)
        { :reply, new_room, new_room }
    end
end