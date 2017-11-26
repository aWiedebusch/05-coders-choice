defmodule RoomServer.Server do
    use GenServer

    def init do
        { :ok, [] }
    end


########################################################################

    def handle_call( {:new_room, name, game, password}, _from, _state ) do
        new_room = RoomServer.GameRoom.new_room(name, game, password)
        { :reply, new_room, new_room }
    end

    def handle_call({:make_move, name, ori_pos, new_pos, color}, _from, _state) do
        next_state = RoomServer.GameRoom.make_move(name, ori_pos, new_pos, color)
        { :reply, next_state, next_state }
    end

    def handle_call({:list_rooms}, _from, _state) do
        { :reply, RoomServer.GameRoom.list_rooms(), RoomServer.GameRoom.list_rooms()}
    end

    def handle_call({:find_room, name}, _from, _state) do
        { :reply, RoomServer.GameRoom.find(name), RoomServer.GameRoom.find(name)}
    end

end