defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "Starts the game state" do
      player = Player.build("Marcos", :soco, :chute, :heela)
      computer = Player.build("Robotinik", :soco, :chute, :heela)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "Return the game's current state" do
      player = Player.build("Marcos", :soco, :chute, :heela)
      computer = Player.build("Robotinik", :soco, :chute, :heela)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :heela, move_rnd: :chute},
          name: "Robotinik"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :heela, move_rnd: :chute},
          name: "Marcos"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()
    end
  end
  
  describe "update/1" do
  	test "returns the updated game state" do
  	  player = Player.build("Marcos", :soco, :chute, :heela)
      computer = Player.build("Robotinik", :soco, :chute, :heela)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :heela, move_rnd: :chute},
          name: "Robotinik"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :heela, move_rnd: :chute},
          name: "Marcos"
        },
        status: :started,
        turn: :player
      }

	  assert expected_response == Game.info()

	  new_state = %{
        computer: %ExMon.Player{
          life: 80,
          moves: %{move_avg: :soco, move_heal: :heela, move_rnd: :chute},
          name: "Robotinik"
        },
        player: %ExMon.Player{
          life: 15,
          moves: %{move_avg: :soco, move_heal: :heela, move_rnd: :chute},
          name: "Marcos"
        },
        status: :started,
        turn: :player
      }

	  Game.update(new_state)

	  expected_response = %{new_state | turn: :computer, status: :continue}
	  assert expected_response == Game.info()
  	end
  end
end
