defmodule ExMon do
  alias ExMon.{Game, Player} # Creating aliases so I only need to use the laste name to reference
  alias ExMon.Game.{Status, Actions}
  @computer_name "Robotinik" # Defining a module variable
  @computer_moves [:move_avg, :move_rnd, :move_heal]

  def create_player(name, move_avg, move_rnd, move_heal) do # Function to create a player
    Player.build(name, move_avg, move_rnd, move_heal) # Creating a player using a defstruct created in ExMon.player
  end

  def start_game(player) do # Starting game by first creating a CPU player(computer) and starting the game using game function in ExMon.Game
    @computer_name # Passing the name |>
    |> create_player(:punch, :kick, :heal) # Passing the computer |>
    |> Game.start(player)

    Status.print_round_message(Game.info)
  end

  def make_move(move) do
	Game.info()
	|> Map.get(:status)
	|> handle_status(move)
  end

  defp handle_status(:game_over, _move), do: Status.print_round_message(Game.info())
  defp handle_status(_other, move) do
    move
    |> Actions.fetch_move()
    |> do_move()

	computer_move(Game.info())
  end

  defp do_move({:error, move}), do: Status.wrong_move_message(move)
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal()
      move -> Actions.attack(move)
    end
  Status.print_round_message(Game.info)
  end

  defp computer_move(%{turn: :computer, status: :continue}) do
    move = {:ok, Enum.random(@computer_moves)}
	do_move(move)
  end
  defp computer_move(_), do: :ok
end
