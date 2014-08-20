
defmodule RiMap do
  def new(), do: :riakc_map.new()
  def register(map, atribute, value) when is_binary(value) do
    {atribute, :register}
      |> :riakc_map.update(&(:riakc_register.set(value,&1)), map)
  end
  def putMap(map, pid, bucket, key, bucket_type \\ "maps") do
    :riakc_pb_socket.update_type(pid, {bucket_type, bucket},
                                 key,
                                 :riakc_map.to_op(map))
  end
  def getMap(pid, bucket, key, bucket_type \\ "maps") do
    :riakc_pb_socket.fetch_type(pid, {bucket_type, bucket}, key)
  end

  def fold(map, acc, fun) do
    :riakc_map.fold(fun, acc, map)
  end
end
