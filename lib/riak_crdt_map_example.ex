
defmodule RiakCrdtMapExample do
   def put(_, %Student{email: nil}) do
    raise "Email is required"
  end

  def put(pid, student = %Student{name: name, email: email, age: age}) do
    newstudent = RiMap.new
                  |> RiMap.register("email", email)
                  |> RiMap.register("name", name)
    if (age != nil) do
      newstudent = newstudent |> RiMap.register("age", Integer.to_string(age))
    end
    key=student[:email]
    newstudent |> RiMap.putMap(pid, "students", key)
  end

  def get(pid, email) when is_binary(email) do
    {:ok, fetched} = RiMap.getMap(pid, "students", email)
    student = fetched |> RiMap.fold(%Student{},
                                      fn({atribute,_}, value, acc) ->
                                        put_in(acc, [String.to_atom(atribute)], value)
                                      end)
    if (student.age != nil) do
      student = %{student | age: String.to_integer(student.age)}
    end
    student
  end
end
