defmodule ExMon.Game do
  use Agent # Agents are used to store states

  def start(computer, player) do
    # Creating a initial value(initial state) taht the agent will start with
    #using computer and player structs. As well as current turn and status.
    initial_value = %{computer: computer, player: player, turn: :player, status: :started}
    # Passing initial_value and Agent name to "Agent.start_link"
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def info do
    Agent.get(__MODULE__, & &1) # Getting current value of the agent
  end

  def update(state) do
    Agent.update(__MODULE__, fn _ -> state end) # Receive a state, then substitute state
  end

  def get_player, do: Map.get(info(), :player)
  def turn, do: Map.get(info(), :turn)
  def fetch_player(player), do: Map.get(info(), player)

end
