defmodule RiakExampleTest do
  use ExUnit.Case

  def stub_student do
    %Student{email: "diogov@example.com", name: "Diogo", age: 27}
  end

  test "can put and get new student" do
    {:ok, pid} = :riakc_pb_socket.start_link('172.16.5.179', 8087)
    assert RiakExample.put(pid, stub_student()) == :ok
    email=stub_student()[:email]
    assert stub_student() == RiakExample.get(pid, email)
  end

  test "can put and get new student using maps datatype" do
    {:ok, pid} = :riakc_pb_socket.start_link('172.16.5.179', 8087)
    assert RiakCrdtMapExample.put(pid, stub_student()) == :ok
    key=stub_student()[:email]
    assert stub_student() == RiakCrdtMapExample.get(pid, key)
  end
end
