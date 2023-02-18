defmodule ExMon.Player do
  required_keys = [:life, :move_avg, :move_heal, :move_rnd, :name]

  @enforce_keys required_keys # Forces to set all keys(selected) to be able to create the struct
  defstruct required_keys # Defining the struct

  @max_life 100 # Defining a module variable

  def build(name, move_avg, move_rnd, move_heal) do # Function to build players. Sets both the user and the computer.
    %ExMon.Player{ # Defing a map to set each value to a key
      name: name,
      move_rnd: move_rnd,
      move_avg: move_avg,
      move_heal: move_heal,
      life: @max_life
    }
  end
end
