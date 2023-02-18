defmodule FizzBuzzTest do
  use ExUnit.Case
  describe "build/1" do
    test "When a valid file is provided, it returns the converted list" do
      assert FizzBuzz.build("numbers.txt") == {:ok, [1, 2, :Fizz, 4, :Buzz, :FizzBuzz]}
    end
    test "When an invalid file is provided, it returns an error" do
      assert FizzBuzz.build("invalid.txt") == {:error, "Error reading file: enoent"}
    end
  end
end
