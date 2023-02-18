defmodule ExMon.Player do
  required_keys = [:life, :move_avg, :move_heal, :move_rnd, :name]

  @enforce_keys required_keys # Forces to set all keys(selected) to be able to create the struct
  defstruct required_keys

  @max_life 100

  def build(name, move_avg, move_rnd, move_heal) do
    %ExMon.Player{
      name: name,
      move_rnd: move_rnd,
      move_avg: move_avg,
      move_heal: move_heal,
      life: @max_life
    }
  end
end
