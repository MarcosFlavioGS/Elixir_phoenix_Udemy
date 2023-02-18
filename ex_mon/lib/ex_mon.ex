defmodule ExMon do
  alias ExMon.{Game, Player} # Creating aliases so I only need to use the laste name to reference

  def create_player(name, move_avg, move_rnd, move_heal) do # Function to create a player
    Player.build(name, move_avg, move_rnd, move_heal) # Creating a player using a defstruct created in ExMon.player
  end

  def start_game(player) do # Starting game by first creating a CPU player(computer) and starting the game using game function in ExMon.Game
    "Robotinik" # Passing the name |>
    |> create_player(:punch, :kick, :heal) # Passing the computer |>
    |> Game.start(player)
  end
end
