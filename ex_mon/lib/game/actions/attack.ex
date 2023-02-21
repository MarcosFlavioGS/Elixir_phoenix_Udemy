defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game


  @move_avg_damage 18..25
  @move_rnd_damage 10..35

  def attack_opponent(opponent, move) do
    damage = calculate_damage(move)
    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_life(damage)
    |> update_opponent_life(opponent)
  end

  defp calculate_damage(:move_avg), do: Enum.random(@move_avg_damage)
  defp calculate_damage(:move_rnd), do: Enum.random(@move_rnd_damage)

  defp calculate_life(life, damage) when life - damage < 0, do: 0
  defp calculate_life(life, damage), do: life - damage
  
  defp update_opponent_life(life, opponent) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
  end
end
