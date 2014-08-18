RiakExample
===========

Just an example project to demonstrate how to use riak using elixir

For some reason mix doesn't compile correctly riak_pb.
To get riakc working I had to:

```
mix deps.get
mix deps.compile
cd deps/riak_pb
make erl_deps
make erl_compile
```

To test riak connection (change your host and port):
```
iex(1)> {ok, pid} = :riakc_pb_socket.start_link('172.16.5.179', 8087)
{:ok, #PID<0.115.0>}
iex(2)> :riakc_pb_socket.ping(pid)
:pong
```
Obs: to open a iex session with the dependencies loaded use iex -S mix

To test:
```
mix test
```

TODO: Make an OTP application so we don't have to start_link on each test
