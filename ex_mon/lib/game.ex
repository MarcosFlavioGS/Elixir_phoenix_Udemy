defmodule ExMon.Game do
  alias ExMon.Player
  # Agents are used to store states
  use Agent

  def start(computer, player) do
    # Creating a initial value(initial state) taht the agent will start with
    # using computer and player structs. As well as current turn and status.
    initial_value = %{computer: computer, player: player, turn: :player, status: :started}
    # Passing initial_value and Agent name to "Agent.start_link"
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def info do
    # Getting current value of the agent
    Agent.get(__MODULE__, & &1)
  end

  def update(state) do
    # Receive a state, then substitute state
    Agent.update(__MODULE__, fn _ -> update_game_status(state) end)
  end

  def get_player, do: Map.get(info(), :player)
  def turn, do: Map.get(info(), :turn)
  def fetch_player(player), do: Map.get(info(), player)

  defp update_game_status(%{player: %Player{life: player_life}, computer: %Player{life: computer_life}} = state)
	when player_life == 0 or computer_life == 0, do: Map.put(state, :status, :game_over)
  defp update_game_status(state) do
    state
		|> Map.put(:status, :continue)
		|> update_turn()
  end

  defp update_turn(%{turn: :player} = state), do: Map.put(state, :turn, :computer)
  defp update_turn(%{turn: :computer} = state), do: Map.put(state, :turn, :player)
end
