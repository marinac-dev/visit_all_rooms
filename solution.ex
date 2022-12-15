defmodule Solution do
  @spec can_visit_all_rooms(rooms :: [[integer]]) :: boolean
  def can_visit_all_rooms(rooms) do
    # Time complexity: O(n)
    rooms = List.to_tuple(rooms)
    # This operation happens in constant time
    rooms_length = tuple_size(rooms)
    # Now this is a bit tricky, Erlang stores Maps and MapSet of size upto MAP_SMALL_MAP_LIMIT
    # So for small maps (up to 32 elements), it uses a linear search O(n), and for bigger hash table O(log n)
    # So we can say that this operation is O(1) for small maps and O(log n) for bigger maps
    visited = MapSet.new() |> MapSet.put(0)
    # Get keys from first room | O(1)
    keys = elem(rooms, 0)
    # Keep track keys found and rooms visited | O(1)
    lengths = [rooms_length, 1]
    # Depth first search | O(n)
    visit_rooms(keys, rooms, visited, lengths)
  end

  @spec visit_rooms(keys :: [integer], rooms :: tuple, visited :: MapSet.t(), lengths :: [integer]) :: boolean
  def visit_rooms([key | keys], rooms, visited, [room_num, keys_num] = lengths) do
    if MapSet.member?(visited, key) do
      visit_rooms(keys, rooms, visited, lengths)
    else
      keys = elem(rooms, key) ++ keys
      visited = MapSet.put(visited, key)
      visit_rooms(keys, rooms, visited, [room_num, keys_num + 1])
    end
  end

  def visit_rooms([], _, _, [room_num, keys_num]), do: room_num == keys_num
end
