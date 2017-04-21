# Working with multiple processes: Exercise 3
#
# Use spawn_link to start a process, and have that process send a message to the
# parent and then exit immediately. Meanwhile, sleep for 500 ms in the parent,
# then receive as many messages as are waiting. Trace what you receive. Does it
# matter that you weren’t waiting for the notification from the child when it
# exited?

defmodule Child do
  def report_back(parent) do
    send parent, { :ok, "Hello, parent process!" }
  end
end

defmodule Parent do
  def wait_for_reports do
    receive do
      msg ->
        IO.puts inspect msg
        wait_for_reports()
    end
  end
end

spawn_link Child, :report_back, [self()]
:timer.sleep 500
Parent.wait_for_reports()

# Parent receives only one message: _{ :ok, "Hello, parent process!" }_
# No matter how long the parent process sleeps, the messages sent to it are
# received. Thus, existing messages are queued.
