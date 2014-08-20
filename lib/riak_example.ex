
defmodule RiakExample do
  def put(_, %Student{email: nil}) do
    raise "Email is required"
  end

  def put(pid, student = %Student{}) do
    key=student[:email]
    newstudent = :riakc_obj.new("students", key, student)
    :riakc_pb_socket.put(pid, newstudent)
  end

  def get(pid, email) when is_binary(email) do
    {:ok, student_obj} = :riakc_pb_socket.get(pid, "students", email)
    student_obj |> :riakc_obj.get_values |> hd |> :erlang.binary_to_term
  end
end


