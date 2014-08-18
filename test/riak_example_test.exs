defmodule RiakExampleTest do
  use ExUnit.Case

  def stub_student do
    %Student{email: "diogovk@example.com", name: "Diogo", age: 27}
  end

  test "can put new student" do
    {:ok, pid} = :riakc_pb_socket.start_link('172.16.5.179', 8087)
    assert RiakExample.put(pid, stub_student()) == :ok 
  end

  test "can get student from email" do
    {:ok, pid} = :riakc_pb_socket.start_link('172.16.5.179', 8087)
    email=stub_student()[:email]
    assert stub_student() == RiakExample.get(pid, email)
  end
end
