# Working with multiple processes: Exercise 3
#
# Do the same, but have the child raise an exception. What difference do you
# see in the tracing? (see _exercises/multiple_processes/waiting_parent.exs_).

defmodule Child do
  def report_back do
    raise "Boom! This went horribly wrong..."
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

# spawn_link Child, :report_back, []
spawn_monitor Child, :report_back, []
:timer.sleep 500
Parent.wait_for_reports()

# Child process fails and takes the parent process with it:
#
# ** (EXIT from #PID<0.70.0>) an exception was raised:
#     ** (RuntimeError) Boom! This went horribly wrong...
#         exercises/multiple_proceses/failing_child.exs:8: Child.report_back/0
#
# 17:42:40.165 [error] Process #PID<0.79.0> raised an exception
# ** (RuntimeError) Boom! This went horribly wrong...
#     exercises/multiple_proceses/failing_child.exs:8: Child.report_back/0
#
# In case of `spawn_monitor` the parent process keeps on working, but receives
# a notification from the runtime that a child process died:
#   {:DOWN, #Reference<0.0.3.25>, :process, #PID<0.79.0>, {%RuntimeError{message: "Boom! This went horribly wrong..."}, [{Child, :report_back, 0, [file: 'exercises/multiple_proceses/failing_child.exs', line: 8]}]}}
